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
@Table(name="employee")
public class Employee {

	@Id
	@Column(name = "employee_id")
	private int employeeId;
	@Column(name = "employee_name")
	private String employeeName;
	@Column(name = "department")
	private String department;
	@Column(name = "designation")
	private String designation;
	

	public Employee(int employeeId, String employeeName, String departmentId, String designation ) {
		super();
		this.employeeId = employeeId;
		this.employeeName = employeeName;
		this.department = departmentId;
		this.designation = designation;
	}

	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getDepartmentId() {
		return department;
	}

	public void setDepartmentId(String departmentId) {
		this.department = departmentId;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}


	@Override
	public String toString() {
		return "Employee [employeeId=" + employeeId + ", employeeName=" + employeeName + ", departmentId="
				+ department + ", designation=" + designation + "]";
	}
	

	
	
	
}
