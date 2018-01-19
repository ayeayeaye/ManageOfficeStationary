package com.example.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAccessor;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.javabeans.MyDate;
import com.example.model.Category;
import com.example.model.ItemStcok;
import com.example.model.Stock;
import com.example.model.Supplier;
import com.example.service.CategoryService;
import com.example.service.EmployeeService;
import com.example.service.ItemStcokService;
import com.example.service.StockLogService;
import com.example.service.SupplierService;

@Controller
@RequestMapping(value="/store/stock")
public class StoreStockController {

	@Autowired
	ItemStcokService itService;
	@Autowired
	SupplierService spService;
	@Autowired
	CategoryService cService;
	@Autowired
	SupplierService supService;
	@Autowired
	StockLogService stService;
	@Autowired
	EmployeeService empService;
	
	/*example*/
	Integer storeStaff = 10018;
	//
	Date todayDate = Calendar.getInstance().getTime();


	
	//
	@RequestMapping(value="/create/category")
	public ModelAndView createNewCategory(@RequestParam("newCatName") String newCatName )
	{
		ModelAndView moView = new ModelAndView("redirect:/all/view/catalogue");
		
		Category newCat = new Category();
		newCat.setCategoryName(newCatName);		
		cService.saveCategory(newCat);
		return moView;
	}
	
	@RequestMapping(value="/create/item")
	public String createNewItem(@ModelAttribute ("newItem") ItemStcok newItem )
	{	
		itService.saveItem(newItem);
		return "redirect:/all/view/catalogue";
	}

	/*Stock*/
	@RequestMapping(value="/view")
	public ModelAndView viewStock( )
	{
		ModelAndView moView = new ModelAndView("store-stock-view");		
		moView.addObject("catList", cService.findAllCategory());
		moView.addObject("itemList", itService.findAllItem());
		//Give empty stock object for ("/add")
		moView.addObject("newStock", new Stock());	
		moView.addObject("aItem", new ItemStcok());
		moView.addObject("supList",supService.findAllSup());
		
		return moView;
	}

	@RequestMapping(value="/add/{itemId}")
	public String addStockP(@ModelAttribute ("newStock") Stock stock, HttpSession session, @PathVariable Integer itemId)
	{

		/*Stock_Log*/
		stock.setAddedEmployee(storeStaff);	
		stock.setAddedDate(todayDate);
		stService.saveAStock(stock);
		
		/*Item*/
		ItemStcok addedStockItem = itService.findItemById(itemId);
		//Quantity(Update Quantity)
		Integer currentQty = addedStockItem.getTotalQty();
		Integer addedQty = stock.getAddedQty();
		Integer totalQty = currentQty+addedQty;
		addedStockItem.setTotalQty(totalQty); 
		//Price(Update Price)
		double currentPrice = addedStockItem.getPrice();		
		double addedPrice = stock.getAddedPrice();		
		if(addedPrice > currentPrice )
		{
			addedStockItem.setPrice(addedPrice);
		}	
		itService.saveItem(addedStockItem);
		
		
		return "redirect:/store/stock/view";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updateStockP(@ModelAttribute ("aItem") ItemStcok updItem)
	{	
		//category, unit, reorderLevel are null value in ModelAttribute. So.... 
		ItemStcok itemToUpd =itService.findItemById(updItem.getItemId());
		updItem.setCategory(itemToUpd.getCategory());
		updItem.setUnit(itemToUpd.getUnit());
		updItem.setReorderLevel(itemToUpd.getReorderLevel());
		//when input set disable, don't know the value/ don't bind data. So,...
		updItem.setItemName(itemToUpd.getItemName());
			
		itService.saveItem(updItem);
		
		return "redirect:/store/stock/view";
	}
	
	/*Stock Log*/
	@RequestMapping(value="/view/alllog/{page}")
	public ModelAndView viewStocKLog(@PathVariable ("page") Integer page )
	{
		ModelAndView moView = new ModelAndView("store-stock-view-stocklog");
		ArrayList<Stock> allStockLogList = stService.findAllStockByDesc();
		
		//Calculate number of page for JSP
		Integer startDigit = allStockLogList.size() / 10 ; 
		Integer pageNo =  startDigit+1;
		moView.addObject("pageNo", pageNo);
		
		moView.addObject("allStockLogList", allStockLogList);		
		moView.addObject("tenStockLogList", createPagination(allStockLogList,page));
		moView.addObject("currentPage", page);
		
/*		//FILTER FIELD
		//Item Name
		ArrayList<ItemStcok> itemLists = itService.findAllItem(); 
		moView.addObject("fItems", itemLists);
		//Employee
		moView.addObject("fEmps",empService.findAllEmp());
		//Supervisor
		moView.addObject("fSups",supService.findAllSup());*/
		
		return moView;
	}
	

	//Pop-up window
	@RequestMapping(value="/popup/chooseItem/{rowIndex}")
	public ModelAndView popUpSearchItemG (@PathVariable Integer rowIndex )
	{
		ModelAndView moView = new ModelAndView("store-stock-choose-item");
		moView.addObject("itemLists", itService.findAllItem());
		moView.addObject("rowIndex", rowIndex);
		return moView;
	}	
	@RequestMapping(value="/popup/chooseSupplier")
	public ModelAndView popUpSearchSupplierG( )
	{
		ModelAndView moView = new ModelAndView("store-stock-choose-supplier");
		moView.addObject("supplierLists", spService.findAllSup());
		return moView;
	}

	// Store-stock-update
	@RequestMapping(value="/update/{itemId}")
	public ModelAndView updateStockG(@PathVariable Integer itemId )
	{
		ModelAndView moView = new ModelAndView("text1");

		moView.addObject("itemId", itemId);
/*		Stock updateStock = stService.findStockById(stockId);
		//update stock
		stService.saveStock(updateStock);
		moView.addObject("updateStock", updateStock);*/
		return moView;
	}
	
	// Store-stock-supplier
	@RequestMapping(value="/supplier")
	public ModelAndView viewSupplier( )
	{
		ModelAndView moView = new ModelAndView("store-stock-supplier");
		ArrayList<Supplier> supList = supService.findAllSup();
		moView.addObject("supList", supList);
		moView.addObject("newSup", new Supplier());
		return moView;
	}
	
	
	/*Method*/
	public List<Stock> createPagination(List<Stock> list, Integer page)
	{
		//PAGINATION
		ArrayList<Stock> tenStockLogList= new ArrayList<Stock>(); 
		Integer totalResult = list.size();
		
		Integer lastOneDigit = totalResult % 10 ; //got last one digit=3(23), 5(145)
		Integer startDigit = totalResult / 10 ; //got digit(s) b4 last one digit=2(23), 14(145)
		System.out.println("@@@"+lastOneDigit+","+startDigit);
		if(totalResult<10)
		{
			for (int i = 0; i < totalResult ; i++) {
				tenStockLogList.add(list.get(i));	
			}
		}	
		else if (totalResult >= 10)
		{			
				//Pages before last page
				 if(page <= startDigit )
				{
					for (int k = (page-1)*10 ; k <= (page*10)-1 ; k++){
						tenStockLogList.add(list.get(k));	
					}			
				}
				else //last page
				{
					for (int j = (page-1)*10 ; j < totalResult  ; j++){
						tenStockLogList.add(list.get(j));							
					}
				}				
		}
		return tenStockLogList;	
	}
	
}
