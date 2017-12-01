package com.example.controller;

import java.util.ArrayList;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.example.model.Department;
import com.example.model.RequestDetail;
import com.example.model.Requests;
import com.example.service.CategoryService;
import com.example.service.DepartmentService;
import com.example.service.ItemService;
import com.example.service.RequestDetailService;
import com.example.service.RequestService;
;


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
	@Autowired
	RequestDetailService rdService;
	
	//Read
	@RequestMapping(value="/dashboard")
	public ModelAndView viewDashboard()
	{
		ModelAndView moView = new ModelAndView("store-dashboard");
				
		ArrayList<Requests>  storeReqPendList= rService.findStoreRequestPending();		
		moView.addObject("storeReqPendList",storeReqPendList);
		
		ArrayList<Requests>  storeALlReqList= rService.findStoreAllReques();		
		moView.addObject("storeALlReqList",storeALlReqList);
		
		ArrayList<Department> deptList = dService.getAllDept();
		moView.addObject("deptList", deptList);
		
		return moView;	
	}
	
	//Read
	@RequestMapping(value="/request/history")
	public ModelAndView requestHistory(HttpSession session)
	{
		ModelAndView moView = new ModelAndView("store-request-history");	
		ArrayList<Requests>  reqList= rService.findStoreAllReques();		
		moView.addObject("reqList",reqList);
	
		return moView;
		
	}
	
	//Read
	@RequestMapping(value="/request/detail/{reqId}")
	public ModelAndView requestDetail(HttpSession session, @PathVariable Integer reqId)
	{
		ModelAndView moView = new ModelAndView("store-request-detail");	
		ArrayList<RequestDetail> reqDetList = rdService.findReqDetailByReqId(reqId);	
		moView.addObject("reqDetList", reqDetList);
		
		Requests aReq =rService.findARequestByReqId(reqId);
		moView.addObject("aReq", aReq);
		return moView;	
	}

	//Update
	@RequestMapping(value="/request/detail/{aRqId}", method=RequestMethod.POST)
	public ModelAndView requestDetailDisburse(@PathVariable Integer aRqId, @ModelAttribute @Valid RequestDetail requestDetail, HttpServletRequest request)
	{
		ModelAndView moView = new ModelAndView("redirect:/store/request/history");	
		/*ModelAndView moView = new ModelAndView("text");*/
		
		//1-get request_id(always one)
		Requests disbReq = rService.findARequestByReqId(aRqId);
		
		//2-Set StoreStatus, DeptStatus, DisbursedDate of Request Table
		disbReq.setStoreStatus("Disbursed");
		disbReq.setDeptStatus("Receive");		
        Date date = new Date();
        Date currentDate  = date;       
		disbReq.setDisburseDate(currentDate);	
		//2-Set in database
		rService.saveRequest(disbReq);
		
		//3-Get request_detail_id(many) depend on reques_id(see no 1)
		ArrayList<RequestDetail> disbReqDetailList = rdService.findReqDetailByReqId(aRqId);
		moView.addObject("disbReqDetailList",disbReqDetailList);

		//4-get receive_quantity values from textboxs
		String[] receiveQtyAry= request.getParameterValues("receiveQuantities");		
		moView.addObject("receiveQtyAry", receiveQtyAry);
		
		//5-set first value of receive_quantity array in first RequestDetail Object's column 
		//  set second value of receive_quantity array in second RequestDetail Object's column
		//......... loop until the number of result(see no 3 OR no 4)
		int k=0;
		for(int j=0; j<disbReqDetailList.size(); j++)
		{
			int i = Integer.valueOf(receiveQtyAry[k]);
			disbReqDetailList.get(j).setReceiveQuantity(i);
			rdService.fillReceiveQuantity(disbReqDetailList.get(j));
			k++;
		}
			
		moView.addObject("aRqId", aRqId);
		return moView;	
	}
	
	
	//Read
	@RequestMapping(value="/request/pending")
	public ModelAndView requestPending(HttpSession session)
	{
		ModelAndView moView = new ModelAndView("store-request-pending");	
		ArrayList<Requests>  storeReqPendList= rService.findStoreRequestPending();		
		moView.addObject("storeReqPendList",storeReqPendList);
	
		return moView;		
	}

	//Read
	@RequestMapping(value="/request/today/history")
	public ModelAndView requestTodayHistory(HttpSession session)
	{
		ModelAndView moView = new ModelAndView("store-request-today-history");	
		
		ArrayList<Requests>  todayReqList= rService.findTodayRequests();		
		moView.addObject("todayReqList",todayReqList);
	
		return moView;
		
	}

	//Read
/*	@RequestMapping(value="/collectP", method=RequestMethod.GET)
	public ModelAndView viewAllCollectP(HttpSession session)
	{
		ModelAndView moView = new ModelAndView("collect-point");
		
		ArrayList<CollectionPoint> allCollectPointLsit = cpService.getAllCollectPoint();
		moView.addObject("allCollectPointLsit",allCollectPointLsit);
		
		moView.addObject("command", new CollectionPoint());
		
		return moView;	
	}*/
	

	//Create
/*	@RequestMapping(value="/collectP/Created", method=RequestMethod.POST)
	public ModelAndView addNewCollectPoint( @ModelAttribute("collectpoint") CollectionPoint cpFromView )
	{
		ModelAndView moView = new ModelAndView("redirect:/store/collectP");
		
		CollectionPoint cp = new CollectionPoint();
		cp.setCollectPointName(cpFromView.getCollectPointName());
		//"CPId" is not "auto increment" in database, so every create "New", id is = "0" (not unique)
		//Assign "New CP's ID" Manually
		int si = cpService.getAllCollectPoint().size();
		int cpSize =  si  +1;
		cp.setCollectPointId(cpSize);
	
		cpService.createNewCP(cp);
		
		moView.addObject("collectPName",cpFromView.getCollectPointName());		
		return moView;
	}*/
	
/*	@RequestMapping(value="/collectP/delete/{cpId}")
	public ModelAndView deleteCollectPoint(@PathVariable Integer cpId)
	{
		CollectionPoint aCP =cpService.findaCPById(cpId);
		cpService.deleteCPbyId(aCP);
		return new ModelAndView("redirect:/store/collectP", "aCP", aCP);

	}*/

}
