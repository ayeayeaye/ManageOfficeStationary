package com.example.controller;

import java.sql.Array;
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

import com.example.javabeans.DepartmentStatus;
import com.example.javabeans.ManagerApproveNeed;
import com.example.javabeans.StoreStatus;
import com.example.model.Category;
import com.example.model.Employee;
import com.example.model.Item;
import com.example.model.RequestDetail;
import com.example.model.Requests;
import com.example.service.CategoryService;
import com.example.service.DepartmentService;
import com.example.service.EmployeeService;
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
	@Autowired
	EmployeeService empService;
	
	Date todayDate = Calendar.getInstance().getTime();
	Double limitAmount = 100.00;
	
	//Example
	String deptCode = "IT";
	Integer loginEmp = 10012; 
	
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
		ArrayList<Requests> aDeptReqList=rService.findRequestsByDept(deptCode);	
		
		//Get all requests
		
		if(aDeptReqList.size()> 0 )//If a department has no request, error
		{						
			moView.addObject("last3Req",mGetLast3Request(aDeptReqList));
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

		ArrayList<Employee> empList = empService.findEmpsByDept(deptCode);
		moView.addObject("empList", empList);
		
		return moView;
		
	}
	
	@RequestMapping(value="/request/precreate")
	public String preCreateRequest(HttpSession session, HttpServletRequest request)
	{
		return "redirect:/staff/dashboard" ;		
	}
				
	//
	@RequestMapping(value="/request/create", method=RequestMethod.POST)
	public ModelAndView createdRequest(HttpSession session, HttpServletRequest request,
	@RequestParam("reqItemC") ArrayList<Integer> reqItemIdList, @RequestParam("reqQuantityC") ArrayList<Integer> reqQuantityList )
	{
				
		Integer lastReqId =0;
		
		//request
		Requests  newReq = new Requests();
		newReq.setDepartment(deptCode);
		newReq.setEmployee(loginEmp);
		//Set "drep_code"
		//increase "Department request code" by manually
		ArrayList<Requests> deptReqList =  rService.findRequestsByDept(deptCode);
		if(deptReqList.size() > 0)
		{
			Integer maxDepRepId =rService.findMaxDeptRepCode(deptCode);	
			newReq.setDrepCode(maxDepRepId+1);
			 //get last request id
			lastReqId = rService.findLastReqId();
		}
		else
		{
			newReq.setDrepCode(1);
		}
			

	    //Calculate Total Price
	    Double totalPrice  = 0.0;
	    String successMsg = null;
	    for (int j = 0; j < reqItemIdList.size(); j++)
	    {
	    	totalPrice = totalPrice + iService.findPriceByItem(reqItemIdList.get(j));
	    }
	    
	    	if(totalPrice < limitAmount )
	    	{    	     	    
	    		//Set "dept_status"
	    		newReq.setDeptStatus("Approve");
	    		//Set "store_status"
	    		newReq.setStoreStatus(StoreStatus.PENDING.toString());
	    		//Set "approve_date"
	    		newReq.setApproveDate(todayDate);
	    		newReq.setManagerApprove(ManagerApproveNeed.NO.toString());
	    		
	    	    //SAVE in database(Parent)
	    	    rService.saveNewRequest(newReq);
	    	    
	    	    successMsg = "successfully requested!";	    	    
	    	}
	    	else if(totalPrice >= limitAmount)
	    	{
	    		//Set "dept_status"
	    		newReq.setDeptStatus("Request");
	    		//Set "re_date"
	    		newReq.setReqDate(todayDate);
	    		newReq.setManagerApprove(ManagerApproveNeed.YES.toString());
	    		
	    	    //SAVE in database(Parent)
	    	    rService.saveNewRequest(newReq);
	    	    
	    		successMsg = "This request need Manager'Approve to proceed!" ;	    		
	    	}
	    	    	 	    
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
    			//SAVE in database (Child)
    			rdService.saveReqDetl(newReqDetl);
    		}

		return new ModelAndView("success","Created", successMsg);	
	}
	
	//Read
	@RequestMapping(value="/request/history")
	public ModelAndView requestHistory(HttpSession session)
	{
		ModelAndView moView = new ModelAndView("staff-request-history");	
		/*example login department*/
		ArrayList<Requests>  deptReqList= rService.findRequestsByDept(deptCode);	
		moView.addObject("deptReqList",deptReqList);
		/*example login department's staff*/
		moView.addObject("loginEmpId",loginEmp);
	
		return moView;		
	}
	
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
	
	//methods
	Integer noReqStaffDashboard = 3;
	public ArrayList<Requests> mGetLast3Request(ArrayList<Requests> aDepreqList)
	{
		ArrayList<Requests> reqList = new ArrayList<Requests>();
		
		for (int i = aDepreqList.size()-1; i >= 0 ; i--)
		{
			reqList.add(aDepreqList.get(i));
		}
		
		//Get only 3
		ArrayList<Requests> threeReq = new ArrayList<Requests>();	
		if(reqList.size() > noReqStaffDashboard )
		{
			for (int i = 0; i < noReqStaffDashboard ; i++){threeReq.add(reqList.get(i));}
		}
		else
		{
			for (int i = 0; i < reqList.size(); i++){threeReq.add(reqList.get(i));}
		}
		
		return threeReq;
	}
}
