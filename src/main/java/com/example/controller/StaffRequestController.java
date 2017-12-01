package com.example.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.Category;
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
public class StaffRequestController {

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
	
	//Read //***If a department has no request, error
	@RequestMapping(value="/dashboard")
	public ModelAndView viewDashboard()
	{
		ModelAndView moView = new ModelAndView("staff-dashboard");
		/*Eg	*/	
		String deptCode = "ADMIN";
		ArrayList<Requests> aDeptReqList=rService.findADeptRequest(deptCode);	
		
		if(aDeptReqList.size()>0 )
		{				
			//Get latest 3 rows/requests
			Requests[] last3Req = new Requests[3];
			int count=0;		
			for (int i =  aDeptReqList.size()-1; i >= aDeptReqList.size()-3 ; i--)
			{
				last3Req[count] = aDeptReqList.get(i);
				count++;
			}
		
			moView.addObject("last3Req",last3Req);
		}
		else
		{
			moView.addObject("erMsg", "There are no request at this moment");
		}
		return moView;	
	}
	
	//Create
	@RequestMapping(value="/request/create")
	public ModelAndView createNewRequest(HttpSession session, HttpServletRequest request)
	{
		//ModelAndView moView = new ModelAndView("staff-create-request");
		ModelAndView moView = new ModelAndView("staff-create-request-2");
		ArrayList<Item>  itemList= iService.findAllItem();
		moView.addObject("itemList",itemList);
		
		ArrayList<Category> categoryList = cService.findAllCategory();
		moView.addObject("categoryList",categoryList);
		
		return moView;
		
	}
			
	
	//
	@RequestMapping(value="/request/create", method=RequestMethod.POST)
	public String createdRequest(HttpSession session, HttpServletRequest request,
	@RequestParam("reqItemC") ArrayList<Integer> reqItemIdList, @RequestParam("reqQuantityC") ArrayList<Integer> reqQuantityList )
	{
				
		//Eg
		String drepCode = "ADMIN"; //SCI,
		Integer loginEmp = 10002; //10050,
		
		//request
		Requests  newReq = new Requests();
		newReq.setDepartment(drepCode);
		newReq.setEmployee(loginEmp);
		//Set "drepcode"
		//increase "Department request code" by manually
		Integer maxDepRepId =rService.findMaxDeptRepCode(drepCode);	
		if(maxDepRepId <=0 )
		{
			newReq.setDrepCode(1);
		}
		else
		{
			newReq.setDrepCode(maxDepRepId+1);
		}
		
		//Set "dept_status"
		newReq.setDeptStatus("Request");	
		//Set "request date"
	    Date date = Calendar.getInstance().getTime();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String d = sdf.format(date);
	    newReq.setReqDate(date);


	    //get last request id
	    Integer lastReqId = rService.findLastReqId();
	 
	    
	    //save in database(Parent)
	    rService.saveNewRequest(newReq);
	    
		//request detail
		RequestDetail newReqDetl =  new RequestDetail();
		//get data from view jsp
	    for (int i = 0; i < reqItemIdList.size(); i++)
	    {
			//set "request id"**
			newReqDetl.setRequestId(lastReqId+1);
			//set "item code"
	    	newReqDetl.setItem(reqItemIdList.get(i));	
			//set "request quantity"
			newReqDetl.setReqQuantity(reqQuantityList.get(i));
			//save in database (Child)
			rdService.saveReqDetl(newReqDetl);
		}
	    
		return "redirect:/staff/request/history";
		
	}
	
	//Read
	@RequestMapping(value="/request/history")
	public ModelAndView requestHistory(HttpSession session)
	{
		ModelAndView moView = new ModelAndView("staff-request-history");	
		/*example login department*/
		ArrayList<Requests>  deptReqList= rService.findADeptRequest("ADMIN");	
		moView.addObject("deptReqList",deptReqList);
		/*example login department's staff*/
		Integer loginEmpId = 10002 ; 
		moView.addObject("loginEmpId",loginEmpId);
	
		return moView;		
	}
	
/*	//Read
	@RequestMapping(value="/request/detailUpdate/{clickBtnText}/{reqId}")
	public ModelAndView requestDetailUpdate(HttpSession session, @PathVariable Integer reqId, @PathVariable String clickBtnText)
	{
		ModelAndView moView = new ModelAndView("staff-request-detail");	
		
		ArrayList<RequestDetail> reqDetList = rdService.findReqDetailByReqId(reqId);	
		moView.addObject("reqDetList", reqDetList);	
		
		Requests aReq =rService.findARequestByReqId(reqId);
		moView.addObject("aReq", aReq);
		
		if(clickBtnText.equals("Detail"))
		{
			moView.addObject("msg", "clickDetail");
		}
		else if (clickBtnText.equals("Update"))
		{
			moView.addObject("msg", "clickUpdate");
		}
		
		return moView;	
	}*/
		//Read
	@RequestMapping(value="/request/detail/{reqId}")
	public ModelAndView requestDetail(HttpSession session, @PathVariable Integer reqId)
	{
		ModelAndView moView = new ModelAndView("staff-request-detail2");	
		
		ArrayList<RequestDetail> reqDetList = rdService.findReqDetailByReqId(reqId);	
		moView.addObject("reqDetList", reqDetList);	
		
		Requests aReq =rService.findARequestByReqId(reqId);
		moView.addObject("aReq", aReq);
		
		moView.addObject("who", "staff");
		
		return moView;	
	}
	//Read
	@RequestMapping(value="/request/update/{reqId}")
	public ModelAndView requestUpdateG(HttpSession session, @PathVariable Integer reqId)
	{
		ModelAndView moView = new ModelAndView("staff-update-request");	
		ArrayList<RequestDetail> reqDetList = rdService.findReqDetailByReqId(reqId);	
		moView.addObject("reqDetList", reqDetList);	
		
		//send this "A" request Id because  request id from request details is "List"
		Requests aReq =rService.findARequestByReqId(reqId);
		moView.addObject("aReq", aReq);
		
		return moView;	
	}
	//Update
	@RequestMapping(value="/request/update/{reqId}", method=RequestMethod.POST)
	public ModelAndView requestUpdateP(HttpSession session, @PathVariable Integer reqId, @RequestParam("reqQuantityC") ArrayList<Integer> reqQuantityList )
	{
		ModelAndView moView = new ModelAndView("redirect:/staff/request/detail/"+reqId);	
		
		//Update "Request Quantity" by "request Detail Id"
		ArrayList<RequestDetail> rdList = rdService.findReqDetailByReqId(reqId);
		RequestDetail ard = new RequestDetail();
		for (int i = 0; i < rdList.size(); i++)
		{							
			rdService.updateReqQtyByReqdeId(rdList.get(i).getRequestdetailId(),reqQuantityList.get(i));
		}
					
		return moView;	
	}

	//Delete
	@RequestMapping(value="/request/cancel/{rqId}")
	public String requestCancel(@PathVariable Integer rqId)
	{
		Requests request = rService.findARequestByReqId(rqId);
		ArrayList<RequestDetail> rqDetailList = rdService.findReqDetailByReqId(rqId);
		
		for (int i = 0; i < rqDetailList.size(); i++) 
		{
			rdService.deleteRqDetail(rqDetailList.get(i));
		}
			
		rService.deleteRequest(request);
		return "redirect:/staff/request/history";
	}
	
	
	@RequestMapping(value="/request/history/{rId}")
	public String noCancelToRequestHistory(HttpSession session)
	{	
		return "redirect:/staff/request/history";		
	}
	
	
	
}
