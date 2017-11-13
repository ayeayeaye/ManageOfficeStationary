package com.example.service;

import java.util.ArrayList;

import com.example.model.Requests;

public interface RequestService {

	ArrayList<Requests> findStoreRequestPending();
	
	ArrayList<Requests> findStoreRequestDisburse();

	ArrayList<Requests> findADeptRequest(String id);

	Requests findARequestByReqId(Integer aRqId);

	void changeRequest(Requests disbReq);

	


}
