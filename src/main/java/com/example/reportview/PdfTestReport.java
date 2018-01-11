package com.example.reportview;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractPdfView;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.example.model.Stock;
import com.example.model.Test;
import com.lowagie.text.Document;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfWriter;

public class PdfTestReport extends AbstractPdfView{

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setHeader("Content-Disposition", "attachment; filename=\"tests_List.pdf\"");
		
		@SuppressWarnings("unchecked")
		List<Test> list = (List<Test>) model.get("testList");
		
		Table table = new Table(2);
		table.addCell("ID");
		table.addCell("NAME");
		

		for (Test test : list) 
		{
			table.addCell( String.valueOf(test.getId()));
			table.addCell( test.getName());
		}
		
		document.add(table);
		
	}



}
