package com.example.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="requestdetail")
public class RequestDetail {

	@Id
	@Column(name="requestdetail_id")
	private int requestdetailId;
	@Column(name="request")
	private int requestId;
	@Column(name="item")
	private int item;
	@Column(name="req_quantity")
	private int reqQuantity;
	@Column(name="receive_quantity")
	private int receiveQuantity;
	
	@ManyToOne
	@JoinColumn(name="item", insertable=false, updatable=false)
	private Item itemModel;
	
	@ManyToOne
	@JoinColumn(name="request", insertable=false, updatable=false)
	private Requests requestModel;

	public RequestDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RequestDetail(int requestdetailId, int requestId, int item, int reqQuantity, int receiveQuantity,
			Item itemModel, Requests requestModel) {
		super();
		this.requestdetailId = requestdetailId;
		this.requestId = requestId;
		this.item = item;
		this.reqQuantity = reqQuantity;
		this.receiveQuantity = receiveQuantity;
		this.itemModel = itemModel;
		this.requestModel = requestModel;
	}

	public int getRequestdetailId() {
		return requestdetailId;
	}

	public void setRequestdetailId(int requestdetailId) {
		this.requestdetailId = requestdetailId;
	}

	public int getRequestId() {
		return requestId;
	}

	public void setRequestId(int requestId) {
		this.requestId = requestId;
	}

	public int getItem() {
		return item;
	}

	public void setItem(int item) {
		this.item = item;
	}

	public int getReqQuantity() {
		return reqQuantity;
	}

	public void setReqQuantity(int reqQuantity) {
		this.reqQuantity = reqQuantity;
	}

	public int getReceiveQuantity() {
		return receiveQuantity;
	}

	public void setReceiveQuantity(int receiveQuantity) {
		this.receiveQuantity = receiveQuantity;
	}

	public Item getItemModel() {
		return itemModel;
	}

	public void setItemModel(Item itemModel) {
		this.itemModel = itemModel;
	}

	public Requests getRequestModel() {
		return requestModel;
	}

	public void setRequestModel(Requests requestModel) {
		this.requestModel = requestModel;
	}

	@Override
	public String toString() {
		return "RequestDetail [requestdetailId=" + requestdetailId + ", requestId=" + requestId + ", item=" + item
				+ ", reqQuantity=" + reqQuantity + ", receiveQuantity=" + receiveQuantity + ", itemModel=" + itemModel
				+ ", requestModel=" + requestModel + "]";
	}

	
		
}
