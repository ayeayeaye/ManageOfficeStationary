package com.example.controller;


import java.util.ArrayList;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.Requests;
import com.example.service.CategoryService;
import com.example.service.DepartmentService;
import com.example.service.ItemService;
import com.example.service.RequestService;


@Controller
@RequestMapping(value = "/store")	
public class StoreController {

	
	@Autowired
	ItemService iService;
	@Autowired
	CategoryService cService;
	@Autowired
	RequestService rService;
	@Autowired
	DepartmentService dService;
	
	
	@RequestMapping(value="/request/history")
	public ModelAndView requestHistory(HttpSession session)
	{
		ModelAndView moView = new ModelAndView("store-request-history");	
		ArrayList<Requests>  reqList= rService.findStoreRequest();		
		moView.addObject("reqList",reqList);
	
		return moView;
		
	}
	
	
}
