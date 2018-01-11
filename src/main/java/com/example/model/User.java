package com.example.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class User {

	@Id
	@Column(name="user_id")
	private int userId;
	@Column(name="user_name")
	private String userName;
	@Column(name="uemployee")
	private int employee;
	@Column(name="password")
	private String password;
	
	@OneToOne (cascade = CascadeType.ALL)
	@JoinColumn (name="uemployee", insertable=false, updatable=false)
	private Employee uEmpModel;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(int userId, String userName, int employee, String password, Employee uEmpModel) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.employee = employee;
		this.password = password;
		this.uEmpModel = uEmpModel;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getEmployee() {
		return employee;
	}

	public void setEmployee(int employee) {
		this.employee = employee;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Employee getuEmpModel() {
		return uEmpModel;
	}

	public void setuEmpModel(Employee uEmpModel) {
		this.uEmpModel = uEmpModel;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", employee=" + employee + ", password=" + password+ "]";
	}
	
	
	
}
