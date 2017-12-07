package com.example.service;

import java.util.ArrayList;

import com.example.model.Category;
import com.example.model.Item;

public interface ItemService {

	ArrayList<Item> findAllItem();
	
	ArrayList<Item> findItemByCategoryId(Integer id);

	Double findPriceByItem(Integer itemId);

	void saveItem(Item newItem);
	
}
