package com.example.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.example.model.RequestDetail;
import com.example.model.Requests;

public interface RequestDetailRepository extends JpaRepository<RequestDetail, String> {
	
	@Query("SELECT rd FROM RequestDetail rd where rd.requestId = :reqId")
	ArrayList<RequestDetail> findReqDetailByReqId(@Param("reqId") Integer reqId);

	@Transactional
	@Modifying
	@Query("update RequestDetail rd set rd.reqQuantity = :reqQty where rd.requestdetailId = :rdId")
	void updateReqQtyByReqdeId(@Param("rdId") Integer rdId,@Param("reqQty") Integer reqQty);
	
}
