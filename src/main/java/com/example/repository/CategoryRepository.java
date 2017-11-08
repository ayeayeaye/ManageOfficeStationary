package com.example.repository;


import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.model.Category;
import com.example.model.Item;



public interface CategoryRepository extends JpaRepository<Category,String> {

	@Query("SELECT c FROM Category c")
	ArrayList<Category> findAllCategory();


	@Query("SELECT c.categoryName FROM Category c where c.categoryId = :id")
	String findCategoryName(@Param("id") Integer id);
}
