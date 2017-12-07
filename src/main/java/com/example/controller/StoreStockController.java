package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.Stock;

@Controller
@RequestMapping(value="/store/stock")
public class StoreStockController {

	@RequestMapping(value="/view/stcok")
	public ModelAndView viewStock( )
	{
		ModelAndView moView = new ModelAndView("store-stock-view");			
		return moView;
	}
	
	@RequestMapping(value="/add")
	public ModelAndView addStock( )
	{
		ModelAndView moView = new ModelAndView("store-stock-add");
		moView.addObject("newStock",new Stock());
		return moView;
	}
	
}
