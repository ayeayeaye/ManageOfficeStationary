package com.example.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.model.CollectionPoint;
import com.example.repository.CollectPointRepository;

@Service
public class CollectPoitImp implements CollectPointService {

	@Resource
	CollectPointRepository repository;
	
	@Override
	public ArrayList<CollectionPoint> getAllCollectPoint() {
		ArrayList<CollectionPoint> allCollectPoint = (ArrayList<CollectionPoint>) repository.findAll();
		return allCollectPoint;
	}

	@Override
	public void createNewCP(CollectionPoint cp) {
		repository.saveAndFlush(cp);
	}


	@Override
	public CollectionPoint findaCPById(Integer cpId) {
		CollectionPoint aCP = repository.findCPbyId(cpId);
		return aCP;
	}

	@Override
	public void deleteCPbyId(CollectionPoint aCP) {		
		repository.delete(aCP);
	}

	
}
