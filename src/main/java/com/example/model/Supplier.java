package com.example.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="supplier")
public class Supplier {

	@Id
	@Column(name="supplier_id")
	private int supplierId ;
	@Column(name="name")
	private String supName;
	@Column(name="company")
	private String supCompany ;
	@Column(name="contact_number")
	private String supPhNo;
	@Column(name="email")
	private String supEmail;
	@Column(name="address")
	private String supAddres;
	public Supplier(int supplierId, String supName, String supCompany, String supPhNo, String supEmail,
			String supAddres) {
		super();
		this.supplierId = supplierId;
		this.supName = supName;
		this.supCompany = supCompany;
		this.supPhNo = supPhNo;
		this.supEmail = supEmail;
		this.supAddres = supAddres;
	}
	public Supplier() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}
	public String getSupName() {
		return supName;
	}
	public void setSupName(String supName) {
		this.supName = supName;
	}
	public String getSupCompany() {
		return supCompany;
	}
	public void setSupCompany(String supCompany) {
		this.supCompany = supCompany;
	}
	public String getSupPhNo() {
		return supPhNo;
	}
	public void setSupPhNo(String supPhNo) {
		this.supPhNo = supPhNo;
	}
	public String getSupEmail() {
		return supEmail;
	}
	public void setSupEmail(String supEmail) {
		this.supEmail = supEmail;
	}
	public String getSupAddres() {
		return supAddres;
	}
	public void setSupAddres(String supAddres) {
		this.supAddres = supAddres;
	}
	@Override
	public String toString() {
		return "Supplier [supplierId=" + supplierId + ", supName=" + supName + ", supCompany=" + supCompany
				+ ", supPhNo=" + supPhNo + ", supEmail=" + supEmail + ", supAddres=" + supAddres + "]";
	}
	
}
