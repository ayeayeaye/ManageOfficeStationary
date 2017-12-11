package com.example.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.example.javabeans.DepartmentStatus;
import com.example.javabeans.ManagerApproveNeed;

@Entity
@Table(name="request")
public class Requests {

	@Id
	@Column(name = "request_id")
	private int requestId;
	@Column(name = "drep_code")
	private int drepCode;
	@Column(name = "department")
	private String department;
	@Column(name = "employee")
	private int employee;
	
	@Column(name="need")
	private String  managerApprove;
	
	@Column(name = "dept_status")
	private String deptStatus;
	@Column(name = "store_status")
	private String storeStatus;

	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "req_date")
	private Date reqDate;	
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "approve_date")
	private Date approveDate;
	@Column(name = "disburse_date")
	private Date disburseDate;
	
	private String reason;
	
	@ManyToOne
	@JoinColumn(name="department", insertable=false, updatable=false)//own column name
	private Department departmentModel;
	
	@ManyToOne
	@JoinColumn(name="employee", insertable=false, updatable=false)//own column name
	private Employee employeeModel;

	public Requests(int requestId, int drepCode, String department, int employee, String managerApprove,
			String deptStatus, String storeStatus, Date reqDate, Date approveDate, Date disburseDate, String reason,
			Department departmentModel, Employee employeeModel) {
		super();
		this.requestId = requestId;
		this.drepCode = drepCode;
		this.department = department;
		this.employee = employee;
		this.managerApprove = managerApprove;
		this.deptStatus = deptStatus;
		this.storeStatus = storeStatus;
		this.reqDate = reqDate;
		this.approveDate = approveDate;
		this.disburseDate = disburseDate;
		this.reason = reason;
		this.departmentModel = departmentModel;
		this.employeeModel = employeeModel;
	}

	public Requests() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getRequestId() {
		return requestId;
	}

	public void setRequestId(int requestId) {
		this.requestId = requestId;
	}

	public int getDrepCode() {
		return drepCode;
	}

	public void setDrepCode(int drepCode) {
		this.drepCode = drepCode;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public int getEmployee() {
		return employee;
	}

	public void setEmployee(int employee) {
		this.employee = employee;
	}

	public String getManagerApprove() {
		return managerApprove;
	}

	public void setManagerApprove(String managerApprove) {
		this.managerApprove = managerApprove;
	}

	public String getDeptStatus() {
		return deptStatus;
	}

	public void setDeptStatus(String deptStatus) {
		this.deptStatus = deptStatus;
	}

	public String getStoreStatus() {
		return storeStatus;
	}

	public void setStoreStatus(String storeStatus) {
		this.storeStatus = storeStatus;
	}

	public Date getReqDate() {
		return reqDate;
	}

	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}

	public Date getApproveDate() {
		return approveDate;
	}

	public void setApproveDate(Date approveDate) {
		this.approveDate = approveDate;
	}

	public Date getDisburseDate() {
		return disburseDate;
	}

	public void setDisburseDate(Date disburseDate) {
		this.disburseDate = disburseDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Department getDepartmentModel() {
		return departmentModel;
	}

	public void setDepartmentModel(Department departmentModel) {
		this.departmentModel = departmentModel;
	}

	public Employee getEmployeeModel() {
		return employeeModel;
	}

	public void setEmployeeModel(Employee employeeModel) {
		this.employeeModel = employeeModel;
	}

	@Override
	public String toString() {
		return "Requests [requestId=" + requestId + ", drepCode=" + drepCode + ", department=" + department
				+ ", employee=" + employee + ", managerApprove=" + managerApprove + ", deptStatus=" + deptStatus
				+ ", storeStatus=" + storeStatus + ", reqDate=" + reqDate + ", approveDate=" + approveDate
				+ ", disburseDate=" + disburseDate + ", reason=" + reason + ", departmentModel=" + departmentModel
				+ ", employeeModel=" + employeeModel + "]";
	}

	
}
