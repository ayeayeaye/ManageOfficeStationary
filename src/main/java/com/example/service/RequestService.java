package com.example.service;

import java.util.ArrayList;

import com.example.model.Requests;

public interface RequestService {

	ArrayList<Requests> findStoreRequestPending();
	
	ArrayList<Requests> findStoreAllReques();

	ArrayList<Requests> findADeptRequest(String id);

	Requests findARequestByReqId(Integer aRqId);

	void changeRequest(Requests disbReq);
	
	ArrayList<Requests> findTodayRequests();

	void deleteRequest(Requests request);

	Integer findMaxDeptRepCode(String drepCode);

	void saveNewRequest(Requests newReq);

	Integer findLastReqId();


}
