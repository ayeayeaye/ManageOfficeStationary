package com.example.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.model.Stock;
import com.example.repository.StockRepository;
import com.example.repository.SupplierRepository;

@Service
public class StockServiceImp implements StockService {

	@Resource
	StockRepository repository;

	@Override
	public Stock findStockById(Integer stockId) {		
		return repository.findStockById(stockId);
	}

	@Override
	public void saveStock(Stock updateStock) {
		repository.saveAndFlush(updateStock);		
	}
	
}