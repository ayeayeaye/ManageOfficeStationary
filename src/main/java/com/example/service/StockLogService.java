package com.example.service;

import java.util.ArrayList;

import org.springframework.data.domain.Page;

import com.example.model.Requests;
import com.example.model.Stock;

public interface StockLogService {

	void saveAStock(Stock addedStock);

	ArrayList<Stock> getAllStock();

	ArrayList<Stock> findAllStockByDesc();

}
