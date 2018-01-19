package com.example.repository;


import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import com.example.model.ItemStcok;


public interface ItemStcokRepository extends JpaRepository<ItemStcok,String> {

	@Query("SELECT e FROM ItemStcok e where e.category = :id")
	ArrayList<ItemStcok> findItemByCategoryId(@Param("id") Integer id);

	@Query("Select i.price from ItemStcok i where i.itemId = :itemId")
	Double findPriceByItem(@Param("itemId") Integer itemId);

	@Query("SELECT e FROM ItemStcok e where e.itemId = :itemId")
	ItemStcok findItemById(@Param("itemId") Integer itemId);

	@Query("Select i from ItemStcok i where i.totalQty <= i.reorderLevel")
	List<ItemStcok> findLowStockItem();

}
