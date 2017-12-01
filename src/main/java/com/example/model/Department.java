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
	

	public Department() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Department(String departmentCode, String departmentName, String contactNumber) {
		super();
		this.departmentCode = departmentCode;
		this.departmentName = departmentName;
		this.contactNumber = contactNumber;
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

	@Override
	public String toString() {
		return "Department [departmentCode=" + departmentCode + ", departmentName=" + departmentName
				+ ", contactNumber=" + contactNumber + "]";
	}



	
	
	
}
