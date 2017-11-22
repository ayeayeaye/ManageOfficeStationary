package com.example.service;

import java.util.ArrayList;

import com.example.model.CollectionPoint;

public interface CollectPointService {

	ArrayList<CollectionPoint> getAllCollectPoint();

	void createNewCP(CollectionPoint cp);
}
