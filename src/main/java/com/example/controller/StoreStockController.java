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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
	@RequestMapping(value="/view/log")
	public ModelAndView viewStocKLog( )
	{
		ModelAndView moView = new ModelAndView("store-stock-view-stocklog");
		ArrayList<Stock> stockLogList = stService.getAllStock();
		moView.addObject("stockLogList", stockLogList);
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
	
	
}
