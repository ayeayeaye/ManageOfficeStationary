package com.example.repository;


import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import com.example.model.Item;


public interface ItemRepository extends JpaRepository<Item,String> {

	@Query("SELECT e FROM Item e where e.category = :id")
	ArrayList<Item> findItemByCategoryId(@Param("id") Integer id);

	@Query("Select i.price from Item i where i.itemId = :itemId")
	Double findPriceByItem(@Param("itemId") Integer itemId);

}
