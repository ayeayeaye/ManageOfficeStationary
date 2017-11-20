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
	public ArrayList<Requests> findStoreRequestPending() {
		ArrayList<Requests> storeReqPendList =  repository.findStoreRequestPending();
		return storeReqPendList;
	}
	
	@Override
	public ArrayList<Requests> findStoreAllReques() {
		ArrayList<Requests> storeReqDList =  repository.findStoreAllRequest();
		return storeReqDList;
	}

	@Override
	public ArrayList<Requests> findADeptRequest(String id) {
		ArrayList<Requests> adeptReqList =  repository.findADeptRequest(id);
		return adeptReqList;
	}

	@Override
	public Requests findARequestByReqId(Integer aRqId) {
		Requests disbReq = repository.findARequestByReqId(aRqId);
		return disbReq;
	}

	@Override
	public void changeRequest(Requests disbReq) {
		repository.saveAndFlush(disbReq);		
	}

	@Override
	public ArrayList<Requests> findTodayRequests() {
		ArrayList<Requests> todayReqList =  repository.findTodayRequests();
		return todayReqList;
	}







}
