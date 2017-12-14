package com.example.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="category")
public class Category {

	
	@Id
	@Column(name = "category_id")
	private int categoryId;
	@Column(name = "category_name")
	private String categoryName;
	
	@OneToMany(mappedBy = "categoryModel", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<ItemStcok> itemMList;

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category(int categoryId, String categoryName, List<ItemStcok> itemMList) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.itemMList = itemMList;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public List<ItemStcok> getItemMList() {
		return itemMList;
	}

	public void setItemMList(List<ItemStcok> itemMList) {
		this.itemMList = itemMList;
	}

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryName=" + categoryName + ", itemMList=" + itemMList
				+ "]";
	}
	
}
