package com.example.service;

import java.util.ArrayList;

import com.example.model.Category;
import com.example.model.Item;

public interface CategoryService {

	ArrayList<Category> findAllCategory();
	
	String findCategoryName(Integer id);
	
}
