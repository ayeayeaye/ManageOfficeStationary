package com.example.service;

import java.util.ArrayList;

import com.example.model.Requests;
import com.example.model.Stock;

public interface StockLogService {

	void saveAStock(Stock addedStock);

	ArrayList<Stock> getAllStock();

}
