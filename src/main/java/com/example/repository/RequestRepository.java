package com.example.repository;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.model.Requests;

public interface RequestRepository extends JpaRepository<Requests, String> {
	
	@Query("SELECT e FROM Requests e where e.storeStatus = 'Pending' ")
	ArrayList<Requests> findStoreRequestPending();
	
	@Query("SELECT e FROM Requests e where e.storeStatus = 'Disbursed' OR  e.storeStatus = 'Pending'")
	ArrayList<Requests> findStoreAllRequest();
	
	@Query("SELECT e FROM Requests e where e.department = :id")
	ArrayList<Requests> findADeptRequest(@Param("id") String id);
	
	@Query("SELECT e FROM Requests e where e.requestId = :aRqId")
	Requests findARequestByReqId(@Param("aRqId") Integer aRqId);
	
	//Yin
	@Query(value="SELECT * FROM request r where r.approve_date = CURDATE();", nativeQuery=true)
	ArrayList<Requests> findTodayRequests();

	@Query("select max(e.drepCode) from Requests e where e.department = :drepCode ")
	Integer findMaxDeptRepCode(@Param("drepCode") String drepCode);

	@Query("select max(e.requestId) from Requests e")
	Integer findLastReqId();

	
}
