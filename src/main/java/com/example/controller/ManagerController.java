package com.example.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Formatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.RequestDetail;
import com.example.model.Requests;
import com.example.service.RequestDetailService;
import com.example.service.RequestService;

@Controller
@RequestMapping(value="/manager")
public class ManagerController {

	@Autowired
	RequestService rService;
	@Autowired
	RequestDetailService rdService;
	
	@RequestMapping(value="/dashboard")
	public ModelAndView managerDashboard()
	{
		ModelAndView moView = new ModelAndView("manager-dashboard");
		return moView;		
	}
	
	@RequestMapping(value="/view/requested/request")
	public ModelAndView viewAllReques()
	{
		/*Eg: Login Department*/
		String deptCode = "ADMIN";
		ArrayList<Requests> requestedReqList = rService.findDeptPendingAllRequests(deptCode);
		return new ModelAndView("manager-view-requested-request", "requestedReqList", requestedReqList);
	}
	
	@RequestMapping(value="/request/detail/{reqId}")
	public ModelAndView approveRejectRequest(@PathVariable Integer reqId)
	{	
		ModelAndView moView = new ModelAndView("staff-request-detail2");	
		
		ArrayList<RequestDetail> reqDetList = rdService.findReqDetailByReqId(reqId);	
		moView.addObject("reqDetList", reqDetList);	
		
		Requests aReq =rService.findARequestByReqId(reqId);
		moView.addObject("aReq", aReq);
		
		moView.addObject("who", "manager");
		return moView;
	}
	
	@RequestMapping(value="/request/approve/{reqId}")
	public String approveRequest(@PathVariable Integer reqId)
	{	
		Requests appReq = rService.findARequestByReqId(reqId);
		
		//local
		//set Department Status
		appReq.setDeptStatus("Approve");
		//set Store Status
		appReq.setStoreStatus("Pending");
		//set Approve/Reject Date
		appReq.setApproveDate(getitngTodayDate());		
		//database
		rService.saveRequest(appReq);
		
		return "redirect:/manager/view/requested/request";
	}
	
	@RequestMapping(value="/request/reject/{reqId}")
	public String rejectRequest(@PathVariable Integer reqId)
	{	
		Requests appReq = rService.findARequestByReqId(reqId);
		
		//local
		//set Department Status
		appReq.setDeptStatus("Reject");
		//set Approve/Reject Date
		appReq.setApproveDate(getitngTodayDate());
		
		//database
		rService.saveRequest(appReq);
		
		return "redirect:/manager/view/requested/request";
	}
	
	

	
//General Methods
	public Date getitngTodayDate()
	{
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = new Date();
		String todayDateS =  dateFormat.format(date);
		Date todayDateD = null;
		try {
			todayDateD = dateFormat.parse(todayDateS);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return todayDateD;
	}
	
}
