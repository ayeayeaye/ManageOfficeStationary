package com.example.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.Category;
import com.example.model.Item;
import com.example.model.Stock;
import com.example.model.Supplier;
import com.example.service.CategoryService;
import com.example.service.ItemService;
import com.example.service.StockService;
import com.example.service.SupplierService;

@Controller
@RequestMapping(value="/store/stock")
public class StoreStockController {

	@Autowired
	ItemService itService;
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
	public String createNewItem(@ModelAttribute ("newItem") Item newItem )
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
		return moView;
	}

	// Store-stock-add
	@RequestMapping(value="/add")
	public ModelAndView addStockG( )
	{
		ModelAndView moView = new ModelAndView("store-stock-add2");			
		moView.addObject("stockLists",new ArrayList<Stock>());
		return moView;
	}
	
	
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

/*	@RequestMapping(value="/add", method=RequestMethod.POST)
	public ModelAndView addStockP(@ModelAttribute("stockLists") ArrayList<Stock> addedStockLists )
	{
		ModelAndView moView = new ModelAndView("text1");			
		
		moView.addObject("addedStock", addedStockLists.get(0));
		return moView;
	}*/
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public ModelAndView addStockP(  )
	{
		ModelAndView moView = new ModelAndView("text1");			
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
