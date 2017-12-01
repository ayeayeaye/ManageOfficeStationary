package com.example.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.example.model.Item;
import com.example.service.CategoryService;
import com.example.service.ItemService;

@Controller
@RequestMapping(value="/staff")
public class StaffGeneralController {

	@Autowired
	CategoryService cService;
	@Autowired
	ItemService iService;
	
	
	@RequestMapping(value="/view/catalogue")
	public ModelAndView viewCatalogueG()
	{
		ArrayList<Item> itemList = iService.findAllItem();
		return new ModelAndView("view-catalogue","itemList", itemList);
		
	}

}
