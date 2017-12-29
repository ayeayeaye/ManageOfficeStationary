package com.example.service;

import java.util.ArrayList;

import com.example.model.Category;
import com.example.model.ItemStcok;

public interface ItemStcokService {

	ArrayList<ItemStcok> findAllItem();
	
	ArrayList<ItemStcok> findItemByCategoryId(Integer id);

	Double findPriceByItem(Integer itemId);

	void saveItem(ItemStcok newItem);

	ItemStcok findItemById(Integer itemId);

}
