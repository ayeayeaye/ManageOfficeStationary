/*package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.Category;
import com.example.model.Item;
import com.example.service.CategoryService;
import com.example.service.ItemService;

@Controller
@RequestMapping(value="/store/catalogue")
public class StoreCatalogueController {

	@Autowired
	CategoryService cService;
	@Autowired
	ItemService itService;
	
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

}
*/