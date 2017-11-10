package com.example.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.model.Requests;
import com.example.repository.CategoryRepository;
import com.example.repository.RequestRepository;

@Service
public class RequestServiceImp implements RequestService {

	@Resource
	private RequestRepository repository;
	
	@Override
	public ArrayList<Requests> findStoreRequest() {
		ArrayList<Requests> storeReqList =  repository.findStoreRequest();
		return storeReqList;
	}

	@Override
	public ArrayList<Requests> findADeptRequest(String id) {
		ArrayList<Requests> adeptReqList =  repository.findADeptRequest(id);
		return adeptReqList;
	}

	@Override
	public Requests getRequestByReqId(Integer aRqId) {
		Requests disbReq = repository.findRequestByReqId(aRqId);
		return disbReq;
	}

	@Override
	public void changeRequest(Requests disbReq) {
		repository.saveAndFlush(disbReq);		
	}



}
