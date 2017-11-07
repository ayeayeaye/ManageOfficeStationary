package com.example.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.model.Item;


public interface ItemRepository extends JpaRepository<Item,String> {


//	@Query("SELECT e FROM Holiday e where e.holidayId = :id")
//	Holiday findHolidayByName(@Param("id") Integer id);
	
//	@Query("SELECT itemName FROM Item i")
//	ArrayList<String> findAllItem();
}
