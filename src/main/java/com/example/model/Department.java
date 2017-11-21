package com.example.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="department")
public class Department {

	@Id
	@Column(name = "department_code")
	private String departmentCode;
	
	@Column(name = "department_name")
	private String departmentName;
	
	@Column(name = "contact_number")
	private String contactNumber;
	
	@Column(name = "department_head")
	private String departmentHead;
	
	@Column(name = "representative")
	private String representative;
	
	@Column(name = "collectionpoint")
	private int collectionpoint;
	
	@ManyToOne
	@JoinColumn(name="collectionpoint", insertable=false, updatable=false)
	private CollectionPoint collectPointModel;

	public Department() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Department(String departmentCode, String departmentName, String contactNumber, String departmentHead,
			String representative, int collectionpoint, CollectionPoint collectPointModel) {
		super();
		this.departmentCode = departmentCode;
		this.departmentName = departmentName;
		this.contactNumber = contactNumber;
		this.departmentHead = departmentHead;
		this.representative = representative;
		this.collectionpoint = collectionpoint;
		this.collectPointModel = collectPointModel;
	}

	public String getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getDepartmentHead() {
		return departmentHead;
	}

	public void setDepartmentHead(String departmentHead) {
		this.departmentHead = departmentHead;
	}

	public String getRepresentative() {
		return representative;
	}

	public void setRepresentative(String representative) {
		this.representative = representative;
	}

	public int getCollectionpoint() {
		return collectionpoint;
	}

	public void setCollectionpoint(int collectionpoint) {
		this.collectionpoint = collectionpoint;
	}

	public CollectionPoint getCollectPointModel() {
		return collectPointModel;
	}

	public void setCollectPointModel(CollectionPoint collectPointModel) {
		this.collectPointModel = collectPointModel;
	}

	@Override
	public String toString() {
		return "Department [departmentCode=" + departmentCode + ", departmentName=" + departmentName
				+ ", contactNumber=" + contactNumber + ", departmentHead=" + departmentHead + ", representative="
				+ representative + ", collectionpoint=" + collectionpoint + ", collectPointModel=" + collectPointModel
				+ "]";
	}

	
	
	
}
