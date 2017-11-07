package com.example.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.model.Item;
import com.example.repository.ItemRepository;


@Service
public class ItemServiceImp implements ItemService {

	
	@Resource
	private ItemRepository repository;
	
	@Override
	public ArrayList<Item> findAllItem() {
		ArrayList<Item> itemNameList = (ArrayList<Item>) repository.findAll();
		return itemNameList;
	}

	
}
