package com.example.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.Test;
import com.example.reportview.ExcelTestReport;
import com.example.reportview.PdfTestReport;

@Controller
@RequestMapping(value="/report")
public class ReportController {

	@RequestMapping(value="/rtest")
	public ModelAndView reportTest(HttpServletRequest req, HttpServletResponse resp)
	{
			List<Test> list =  new ArrayList<Test>();
			list.add(new Test(1,"su su"));
			list.add(new Test(2,"mg mg"));
			list.add(new Test(3,"ko ko"));
			
			String type = req.getParameter("type");
			
			if(type!=null && type.equals("xls"))
			{
				return new ModelAndView(new ExcelTestReport(), "testList", list);
			}
			else if(type!=null && type.equals("pdf"))
			{
				return new ModelAndView(new PdfTestReport(), "testList", list);
			}
			
			return new ModelAndView("reportTest", "testList", list);
	}
}
