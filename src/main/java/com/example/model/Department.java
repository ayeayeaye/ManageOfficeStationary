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
	
	@Column(name = "collectionpoint_id")
	private int collectionpointId;
	


	public Department(String departmentId, String departmentName, String contactNumber, String departmentHead,
			String representative, int collectionpointId) {
		super();
		this.departmentCode = departmentId;
		this.departmentName = departmentName;
		this.contactNumber = contactNumber;
		this.departmentHead = departmentHead;
		this.representative = representative;
		this.collectionpointId = collectionpointId;

	}

	public Department() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getdepartmentCode() {
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

	public int getCollectionpointId() {
		return collectionpointId;
	}

	public void setCollectionpointId(int collectionpointId) {
		this.collectionpointId = collectionpointId;
	}



	@Override
	public String toString() {
		return "Department [departmentCode=" + departmentCode + ", departmentName=" + departmentName + ", contactNumber="
				+ contactNumber + ", departmentHead=" + departmentHead + ", representative=" + representative
				+ ", collectionpointId=" + collectionpointId + "]";
	}


	
	
}
