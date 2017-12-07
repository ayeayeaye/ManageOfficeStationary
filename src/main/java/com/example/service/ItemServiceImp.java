package com.example.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.model.Category;
import com.example.model.Item;
import com.example.repository.ItemRepository;


@Service
public class ItemServiceImp implements ItemService {

	
	@Resource
	private ItemRepository repository;

	@Override
	public ArrayList<Item> findAllItem() {
		ArrayList<Item> itemList = (ArrayList<Item>) repository.findAll();
		return itemList;
	}

	@Override
	public ArrayList<Item> findItemByCategoryId(Integer id) {
		ArrayList<Item> itemListByCategoryId = (ArrayList<Item>) repository.findItemByCategoryId(id);
		return itemListByCategoryId;
	}

	@Override
	public Double findPriceByItem(Integer itemId) {
		Double price = repository.findPriceByItem(itemId);
		return price ;
	}

	@Override
	public void saveItem(Item newItem) {
		repository.saveAndFlush(newItem);
	}
	
	


	
}
