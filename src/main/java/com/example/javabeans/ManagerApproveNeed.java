package com.example.javabeans;

public enum ManagerApproveNeed {
	YES, NO;
	
	public String toString() {
		return name().charAt(0) + name().substring(1).toLowerCase();
	}
}
