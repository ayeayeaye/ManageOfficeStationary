package com.example.service;

import com.example.model.Stock;

public interface StockService {

	Stock findStockById(Integer stockId);

	void saveStock(Stock updateStock);

	void saveNewStock(Stock addNewStock);

}
