package com.example.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="collectionpoint")
public class CollectionPoint {

	@Id
	@Column(name="collectionpoint_id")
	private int collectPointId;
	@Column(name="collectionpoint_name")
	private String collectPointName;
	
	@OneToMany(mappedBy="collectPointModel", cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private List<Department> departModelList = new ArrayList<Department>();

	public CollectionPoint() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CollectionPoint(int collectPointId, String collectPointName, List<Department> departModelList) {
		super();
		this.collectPointId = collectPointId;
		this.collectPointName = collectPointName;
		this.departModelList = departModelList;
	}

	public int getCollectPointId() {
		return collectPointId;
	}

	public void setCollectPointId(int collectPointId) {
		this.collectPointId = collectPointId;
	}

	public String getCollectPointName() {
		return collectPointName;
	}

	public void setCollectPointName(String collectPointName) {
		this.collectPointName = collectPointName;
	}

	public List<Department> getDepartModelList() {
		return departModelList;
	}

	public void setDepartModelList(List<Department> departModelList) {
		this.departModelList = departModelList;
	}

	@Override
	public String toString() {
		return "CollectionPoint [collectPointId=" + collectPointId + ", collectPointName=" + collectPointName
				+ ", departModelList=" + departModelList + "]";
	}
	
}
