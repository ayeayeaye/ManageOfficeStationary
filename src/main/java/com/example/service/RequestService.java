package com.example.service;

import java.util.ArrayList;

import com.example.model.Requests;

public interface RequestService {

	ArrayList<Requests> findStoreRequestPending();
	
	ArrayList<Requests> findStoreAllReques();

	ArrayList<Requests> findRequestsByDept(String id);

	Requests findARequestByReqId(Integer aRqId);

	void saveRequest(Requests disbReq);
	
	ArrayList<Requests> findTodayApproveRequests();

	void deleteRequest(Requests request);

	Integer findMaxDeptRepCode(String drepCode);

	void saveNewRequest(Requests newReq);

	Integer findLastReqId();

	ArrayList<Requests> findDeptPendingAllRequests(String deptCode);

}
