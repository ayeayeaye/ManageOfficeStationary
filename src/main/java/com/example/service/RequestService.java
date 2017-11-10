package com.example.service;

import java.util.ArrayList;

import com.example.model.Requests;

public interface RequestService {

	ArrayList<Requests> findStoreRequest();

	ArrayList<Requests> findADeptRequest(String id);

	Requests getRequestByReqId(Integer aRqId);

	void changeRequest(Requests disbReq);

}
