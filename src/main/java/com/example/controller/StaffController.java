package com.example.controller;

import java.util.ArrayList;import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.model.Category;
import com.example.model.Item;
import com.example.service.CategoryService;
import com.example.service.ItemService;


@Controller
@RequestMapping(value = "/staff")
public class StaffController {

	
	@Autowired
	ItemService iService;
	@Autowired
	CategoryService cService;
	
	@RequestMapping(value="/test")
	public ModelAndView test(HttpSession session)
	{
		
		ModelAndView moView = new ModelAndView("itemList");
		ArrayList<Item>  itemList= iService.findAllItem();
		moView.addObject("itemList",itemList);
		return moView;
		
	}
	
	
	@RequestMapping(value="/create/request")
	public ModelAndView createNewRequest(HttpSession session)
	{
		ModelAndView moView = new ModelAndView("staff-create-request");	
		ArrayList<Item>  itemList= iService.findAllItem();
		moView.addObject("itemList",itemList);
		
		ArrayList<Category> categoryList = cService.findAllCategory();
		moView.addObject("categoryList",categoryList);
		
		return moView;
		
	}

}
