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
import com.example.model.Department;
import com.example.model.Item;
import com.example.model.Requests;
import com.example.service.CategoryService;
import com.example.service.DepartmentService;
import com.example.service.ItemService;
import com.example.service.RequestService;


@Controller
@RequestMapping(value = "/staff")
public class StaffController {

	
	@Autowired
	ItemService iService;
	@Autowired
	CategoryService cService;
	@Autowired
	RequestService rService;
	@Autowired
	DepartmentService dService;
	
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
	
	@RequestMapping(value="/request/history")
	public ModelAndView requestHistory(HttpSession session)
	{
		ModelAndView moView = new ModelAndView("staff-request-history");	
		//int id = 11111; //example department code
		ArrayList<Requests>  deptReqList= rService.findADeptRequest(22222);	
		moView.addObject("deptReqList",deptReqList);
	
		return moView;
		
	}

}
