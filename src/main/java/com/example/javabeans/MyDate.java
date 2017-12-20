package com.example.javabeans;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MyDate {

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
