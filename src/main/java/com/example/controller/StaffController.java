package com.example.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.ArrayList;import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView createNewRequest(HttpSession session, HttpServletRequest request)
	{
		ModelAndView moView = new ModelAndView("staff-create-request");	
		ArrayList<Item>  itemList= iService.findAllItem();
		moView.addObject("itemList",itemList);
		
		ArrayList<Category> categoryList = cService.findAllCategory();
		moView.addObject("categoryList",categoryList);
		

		return moView;
		
	}
	
/*	@RequestMapping(value="/create/request", method=RequestMethod.POST)
	public ModelAndView createNewRequest1(@Valid @ModelAttribute ("category") Category category, BindingResult result,
			final RedirectAttributes redirectAttributes, HttpServletRequest request)
	{
		ModelAndView moView = new ModelAndView("staff-create-request");
		String catId = request.getParameter("selectCategory");
		Integer id = Integer.valueOf(catId);
		
		//get items depend on selected categoryId
		ArrayList<Item>  itemList= iService.findItemByCategoryId(id);
		moView.addObject("itemList",itemList); //***same attribute name with GET
		
		//get category Name depend on selected categoryId
		String s = cService.findCategoryName(id);
		Category selectCat = new Category(id, s);		
		//Although only one category, send with arraylist bcz in JSP showed already data (above GET) with list style
		ArrayList<Category> categoryList = new ArrayList<Category>();
		categoryList.add(selectCat);
		
		ArrayList<Category> categoryList = cService.findAllCategory();;
		moView.addObject("categoryList",categoryList); //***same attribute name with GET

		return moView;
		
	}


	@RequestMapping(value="/created")
	public ModelAndView createdList(HttpSession session)
	{		
		ModelAndView moView = new ModelAndView("itemList");
		ArrayList<Item>  itemList= iService.findAllItem();
		moView.addObject("itemList",itemList);
		return moView;
		
	}*/
}
