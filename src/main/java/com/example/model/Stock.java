package com.example.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="stock")
public class Stock {

	@Id
	@Column(name="stock_id")
	private int stockId;
	private int item; 
	@Column(name="added_quantity")
	private int addQty;
	@Column(name="added_date")
	private Date addDate;
	@Column(name="added_price")
	private double addedPrice;
	private int supplier;
	
	
	
	public Stock() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Stock(int stockId, int item, int addQty, Date addDate, double addedPrice, int supplier) {
		super();
		this.stockId = stockId;
		this.item = item;
		this.addQty = addQty;
		this.addDate = addDate;
		this.addedPrice = addedPrice;
		this.supplier = supplier;
	}

	public int getStockId() {
		return stockId;
	}

	public void setStockId(int stockId) {
		this.stockId = stockId;
	}

	public int getItem() {
		return item;
	}

	public void setItem(int item) {
		this.item = item;
	}

	public int getAddQty() {
		return addQty;
	}

	public void setAddQty(int addQty) {
		this.addQty = addQty;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	public double getAddedPrice() {
		return addedPrice;
	}

	public void setAddedPrice(double addedPrice) {
		this.addedPrice = addedPrice;
	}

	public int getSupplier() {
		return supplier;
	}

	public void setSupplier(int supplier) {
		this.supplier = supplier;
	}

	@Override
	public String toString() {
		return "Stock [stockId=" + stockId + ", item=" + item + ", addQty=" + addQty + ", addDate=" + addDate
				+ ", addedPrice=" + addedPrice + ", supplier=" + supplier + "]";
	}	
	
	
	
	
}
