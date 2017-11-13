package com.example.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.model.Requests;

public interface RequestRepository extends JpaRepository<Requests, String> {
	
	@Query("SELECT e FROM Requests e where e.storeStatus = 'Pending' ")
	ArrayList<Requests> findStoreRequestPending();
	
	@Query("SELECT e FROM Requests e where e.storeStatus = 'Disbursed' ")
	ArrayList<Requests> findStoreRequestDisburse();
	
	@Query("SELECT e FROM Requests e where e.department = :id")
	ArrayList<Requests> findADeptRequest(@Param("id") String id);
	
	@Query("SELECT e FROM Requests e where e.requestId = :aRqId")
	Requests findARequestByReqId(@Param("aRqId") Integer aRqId);


	
}
