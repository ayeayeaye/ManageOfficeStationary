package com.example.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import com.example.service.StockService;
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
	StockService stService;
	
	/*example*/
	Integer storeStaff = 10018;
	//
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	String fTodayDate = format1.format(cal.getTime());
	
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

	// Store-stock-view
	@RequestMapping(value="/view")
	public ModelAndView viewStock( )
	{
		ModelAndView moView = new ModelAndView("store-stock-view");
		moView.addObject("itemList", itService.findAllItem());
		//Give empty stock object for ("/add")
		moView.addObject("addNewStock", new Stock());	
		moView.addObject("supList",supService.findAllSup());
		
		return moView;
	}


	@RequestMapping(value="/add")
	public ModelAndView addStockG( )
	{
		ModelAndView moView = new ModelAndView("store-stock-add");	
		moView.addObject("itemList", itService.findAllItem());
		moView.addObject("supList",supService.findAllSup());
		moView.addObject("newStockList",new ArrayList<Stock>());
		return moView;
	}
	
	@RequestMapping(value="/added")
	public ModelAndView addStockP(@RequestParam("reqItemC") ArrayList<Integer> reqItemIdList)
	{
		ModelAndView moView = new ModelAndView("text1");
		return moView;
	}
	
	@RequestMapping(value="/view/log")
	public ModelAndView viewStocKLog( )
	{
		ModelAndView moView = new ModelAndView("store-stock-view-stocklog");
		moView.addObject("itemList", itService.findAllItem());
		moView.addObject("supList",supService.findAllSup());
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
