package com.example.service;

import java.util.ArrayList;

import org.springframework.data.repository.query.Param;

import com.example.model.RequestDetail;

public interface RequestDetailService {

	ArrayList<RequestDetail> findReqDetailByReqId(Integer reqId);

	void fillReceiveQuantity(RequestDetail requestDetail);

}
