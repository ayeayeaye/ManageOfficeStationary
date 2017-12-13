package com.example.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.model.Supplier;
import com.example.repository.SupplierRepository;

@Service
public class SupplierServiceImp implements SupplierService {

	@Resource
	SupplierRepository repository;
	
	@Override
	public ArrayList<Supplier> findAllSup() {
		return (ArrayList<Supplier>) repository.findAll() ;
	}


}
