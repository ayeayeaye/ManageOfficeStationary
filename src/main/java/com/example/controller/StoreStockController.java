package com.example.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.Stock;
import com.example.model.Supplier;
import com.example.service.ItemService;
import com.example.service.SupplierService;

@Controller
@RequestMapping(value="/store/stock")
public class StoreStockController {

	@Autowired
	ItemService itService;
	@Autowired
	SupplierService spService;
	
	@RequestMapping(value="/view")
	public ModelAndView viewStock( )
	{
		ModelAndView moView = new ModelAndView("store-stock-view");
		moView.addObject("itemList", itService.findAllItem());
		return moView;
	}

	
	@RequestMapping(value="/add")
	public ModelAndView addStockG( )
	{
		ModelAndView moView = new ModelAndView("store-stock-add2");			
		moView.addObject("stockLists",new ArrayList<Stock>());
		return moView;
	}
	
	
	@RequestMapping(value="/popup/chooseItem")
	public ModelAndView popUpSearchItemG( )
	{
		ModelAndView moView = new ModelAndView("store-stock-choose-item");
		moView.addObject("itemLists", itService.findAllItem());
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
	
}
