package com.example.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.sql.Array;
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
import com.example.model.RequestDetail;
import com.example.model.Requests;
import com.example.service.CategoryService;
import com.example.service.DepartmentService;
import com.example.service.ItemService;
import com.example.service.RequestDetailService;
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
	@Autowired
	RequestDetailService rdService;
	@Autowired
	DepartmentService deptService;
	
	//Read
	@RequestMapping(value="/test")
	public ModelAndView test(HttpSession session)
	{
		
		ModelAndView moView = new ModelAndView("itemList");
		ArrayList<Item>  itemList= iService.findAllItem();
		moView.addObject("itemList",itemList);
		return moView;
		
	}
	
	//Read
	@RequestMapping(value="/dashboard")
	public ModelAndView viewDashboard()
	{
		ModelAndView moView = new ModelAndView("staff-dashboard");
		/*Eg	*/	
		String deptCode = "SCI";
		ArrayList<Requests> aDeptReqList=rService.findADeptRequest(deptCode);	
		
		//Get latest 3 rows
		Requests[] last3Req = new Requests[3];
		int count=0;		
		for (int i =  aDeptReqList.size()-1; i >= aDeptReqList.size()-3 ; i--)
		{
			last3Req[count] = aDeptReqList.get(i);
			count++;
		}
	
		moView.addObject("last3Req",last3Req);
				
		return moView;	
	}
	
	//Create
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
	
	//Read
	@RequestMapping(value="/request/history")
	public ModelAndView requestHistory(HttpSession session)
	{
		ModelAndView moView = new ModelAndView("staff-request-history");	
		/*example login department*/
		ArrayList<Requests>  deptReqList= rService.findADeptRequest("SCI");	
		moView.addObject("deptReqList",deptReqList);
		/*example login department's staff*/
		Integer loginEmpId = 10050 ; 
		moView.addObject("loginEmpId",loginEmpId);
	
		return moView;		
	}
	
	//Read
	@RequestMapping(value="/request/detail/{reqId}")
	public ModelAndView requestDetail(HttpSession session, @PathVariable Integer reqId)
	{
		ModelAndView moView = new ModelAndView("staff-request-detail");	
		ArrayList<RequestDetail> reqDetList = rdService.findReqDetailByReqId(reqId);	
		moView.addObject("reqDetList", reqDetList);		
		Requests aReq =rService.findARequestByReqId(reqId);
		moView.addObject("aReq", aReq);
		return moView;	
	}

}
