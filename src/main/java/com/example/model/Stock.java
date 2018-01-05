package com.example.model;

import java.util.Date;

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
@Table(name="stock_log")
public class Stock {

	@Id
	@Column(name="stock_id")
	private int stockId;
	@Column(name="added_employee")
	private int addedEmployee;
	@Column(name="item_stock")
	private int addedItem;
	@Column(name="added_quantity")
	private int addedQty;
	@Column(name="added_price")
	private double addedPrice;
	@Column(name="added_date")
	private Date addedDate;
	private int supplier;
	private String updated;
	private String reason;
	
	@OneToOne (cascade=CascadeType.ALL)
	@JoinColumn(name="item_stock", insertable=false, updatable=false)
	private ItemStcok itemModel;
	
	@OneToOne (cascade = CascadeType.ALL)
	@JoinColumn (name="added_employee", insertable=false, updatable=false)
	private Employee empModel;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn (name = "supplier", insertable=false, updatable=false)
	private Supplier supModel;
	
	public Stock() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Stock(int stockId, int addedEmployee, int addedItem, int addedQty, double addedPrice, Date addedDate,
			int supplier, String updated, String reason,ItemStcok itemModel, Employee empModel, Supplier supModel ) {
		super();
		this.stockId = stockId;
		this.addedEmployee = addedEmployee;
		this.addedItem = addedItem;
		this.addedQty = addedQty;
		this.addedPrice = addedPrice;
		this.addedDate = addedDate;
		this.supplier = supplier;
		this.updated = updated;
		this.reason = reason;
		this.itemModel = itemModel;
		this.empModel = empModel;
		this.supModel = supModel;
	}

	public int getStockId() {
		return stockId;
	}

	public void setStockId(int stockId) {
		this.stockId = stockId;
	}

	public int getAddedEmployee() {
		return addedEmployee;
	}

	public void setAddedEmployee(int addedEmployee) {
		this.addedEmployee = addedEmployee;
	}

	public int getAddedItem() {
		return addedItem;
	}

	public void setAddedItem(int addedItem) {
		this.addedItem = addedItem;
	}

	public int getAddedQty() {
		return addedQty;
	}

	public void setAddedQty(int addedQty) {
		this.addedQty = addedQty;
	}

	public double getAddedPrice() {
		return addedPrice;
	}

	public void setAddedPrice(double addedPrice) {
		this.addedPrice = addedPrice;
	}

	public Date getAddedDate() {
		return addedDate;
	}

	public void setAddedDate(Date addedDate) {
		this.addedDate = addedDate;
	}

	public int getSupplier() {
		return supplier;
	}

	public void setSupplier(int supplier) {
		this.supplier = supplier;
	}

	public String getUpdated() {
		return updated;
	}

	public void setUpdated(String updated) {
		this.updated = updated;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public ItemStcok getItemModel() {
		return itemModel;
	}

	public void setItemModel(ItemStcok itemModel) {
		this.itemModel = itemModel;
	}
	
	
	
	public Employee getEmpModel() {
		return empModel;
	}

	public void setEmpModel(Employee empModel) {
		this.empModel = empModel;
	}

		
	public Supplier getSupModel() {
		return supModel;
	}

	public void setSupModel(Supplier supModel) {
		this.supModel = supModel;
	}

	@Override
	public String toString() {
		return "Stock [stockId=" + stockId + ", addedEmployee=" + addedEmployee + ", addedItem=" + addedItem
				+ ", addedQty=" + addedQty + ", addedPrice=" + addedPrice + ", addedDate=" + addedDate + ", supplier="
				+ supplier + ", updated=" + updated + ", reason=" + reason +"]";
	}

	
}
