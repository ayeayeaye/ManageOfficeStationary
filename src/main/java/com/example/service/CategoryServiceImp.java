package com.example.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.model.Category;
import com.example.model.Item;
import com.example.repository.CategoryRepository;
import com.example.repository.ItemRepository;


@Service
public class CategoryServiceImp implements CategoryService {

	
	@Resource
	private CategoryRepository repository;


	
	@Override
	public ArrayList<Category> findAllCategory() {
		ArrayList<Category> categoryList = repository.findAllCategory();
		return categoryList;
	}



	
}
