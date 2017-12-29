package com.example.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="item_stock")
public class ItemStcok {

	@Id
	@Column(name="item_id")
	private int itemId;
	@Column(name="item_name")
	private String itemName;
	@Column(name="category")
	private int category;
	private String unit;
	@Column(name="updated_price")
	private double price;
	@Column(name="updated_quantity")
	private int totalQty;
	@Column(name="reorder_level")
	private int reorderLevel;
	
	@ManyToOne
	@JoinColumn(name="category", insertable=false, updatable=false)
	private Category categoryModel;
	
	public ItemStcok() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ItemStcok(int itemId, String itemName, int category, String unit, double price, int totalQty,
			int reorderLevel, Category categoryModel) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.category = category;
		this.unit = unit;
		this.price = price;
		this.totalQty = totalQty;
		this.reorderLevel = reorderLevel;
		this.categoryModel = categoryModel;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getTotalQty() {
		return totalQty;
	}

	public void setTotalQty(int totalQty) {
		this.totalQty = totalQty;
	}

	public int getReorderLevel() {
		return reorderLevel;
	}

	public void setReorderLevel(int reorderLevel) {
		this.reorderLevel = reorderLevel;
	}

	public Category getCategoryModel() {
		return categoryModel;
	}

	public void setCategoryModel(Category categoryModel) {
		this.categoryModel = categoryModel;
	}


	@Override
	public String toString() {
		return "ItemStcok [itemId=" + itemId + ", itemName=" + itemName + ", category=" + category + ", unit=" + unit
				+ ", price=" + price + ", totalQty=" + totalQty + ", reorderLevel=" + reorderLevel + "]";
	}
	
}
