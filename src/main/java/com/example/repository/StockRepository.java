package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.model.Stock;

public interface StockRepository extends JpaRepository<Stock, String> {

	@Query("select st from Stock st where st.stockId = :stockId")
	Stock findStockById(@Param("stockId") Integer stockId);

}
