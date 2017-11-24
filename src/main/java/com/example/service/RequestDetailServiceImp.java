package com.example.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.model.RequestDetail;
import com.example.model.Requests;
import com.example.repository.CategoryRepository;
import com.example.repository.RequestDetailRepository;
import com.example.repository.RequestRepository;

@Service
public class RequestDetailServiceImp implements RequestDetailService {

	@Resource
	private RequestDetailRepository repository;

	@Override
	public ArrayList<RequestDetail> findReqDetailByReqId(Integer reqId) {
		ArrayList<RequestDetail> reqDetList= repository.findReqDetailByReqId(reqId);
		return reqDetList;
	}

	@Override
	public void fillReceiveQuantity(RequestDetail requestDetail) {
		repository.saveAndFlush(requestDetail);
	}

	@Override
	public void deleteRqDetail(RequestDetail rqDetail) {
		repository.delete(rqDetail);
		
	}

	



}
