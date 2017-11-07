package com.example.repository;


import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.model.Category;



public interface CategoryRepository extends JpaRepository<Category,String> {

	@Query("SELECT c FROM Category c")
	ArrayList<Category> findAllCategory();


}
