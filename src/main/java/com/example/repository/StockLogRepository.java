package com.example.repository;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.model.Requests;
import com.example.model.Stock;

public interface StockLogRepository extends JpaRepository<Stock, String> {
	
	
}
