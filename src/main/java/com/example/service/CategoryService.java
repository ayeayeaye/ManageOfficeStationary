package com.example.service;

import java.util.ArrayList;

import com.example.model.Category;
import com.example.model.ItemStcok;

public interface CategoryService {

	ArrayList<Category> findAllCategory();
	
	String findCategoryName(Integer id);

	void saveCategory(Category newCat);
	
}
