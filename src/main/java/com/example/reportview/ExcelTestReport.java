package com.example.reportview;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.example.model.Stock;
import com.example.model.Test;

public class ExcelTestReport extends AbstractXlsView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		response.setHeader("Content-Disposition", "attachment; filename=\"test_List.xls\"");
		
		@SuppressWarnings("unchecked")
		List<Test> list = (List<Test>) model.get("testList");
		
		Sheet sheet = workbook.createSheet("Test List");
		
		Row header=sheet.createRow(0);
		header.createCell(0).setCellValue("ID");
		header.createCell(1).setCellValue("NAME");
		
		Integer rowNo = 1;
		for (Test test : list) 
		{
			Row row = sheet.createRow(rowNo++);
			row.createCell(0).setCellValue(test.getId());
			row.createCell(1).setCellValue(test.getName());
		}

	}

}
