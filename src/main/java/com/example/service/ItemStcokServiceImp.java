package com.example.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.model.Category;
import com.example.model.ItemStcok;
import com.example.repository.ItemStcokRepository;


@Service
public class ItemStcokServiceImp implements ItemStcokService {

	
	@Resource
	private ItemStcokRepository repository;

	@Override
	public ArrayList<ItemStcok> findAllItem() {
		ArrayList<ItemStcok> itemList = (ArrayList<ItemStcok>) repository.findAll();
		return itemList;
	}

	@Override
	public ArrayList<ItemStcok> findItemByCategoryId(Integer id) {
		ArrayList<ItemStcok> itemListByCategoryId = (ArrayList<ItemStcok>) repository.findItemByCategoryId(id);
		return itemListByCategoryId;
	}

	@Override
	public Double findPriceByItem(Integer itemId) {
		Double price = repository.findPriceByItem(itemId);
		return price ;
	}

	@Override
	public void saveItem(ItemStcok newItem) {
		repository.saveAndFlush(newItem);
	}

	@Override
	public ItemStcok findItemById(Integer itemId) {
		ItemStcok a = repository.findItemById(itemId);
		return a;
	}

	@Override
	public List<ItemStcok> findLowStockItem() {
		List<ItemStcok> lowStItems = repository.findLowStockItem();
		return lowStItems;
	}


	
	


	
}
