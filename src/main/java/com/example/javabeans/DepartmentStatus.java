package com.example.javabeans;

public enum DepartmentStatus {
	REQUEST, APPROVED, REJECTED;
	
	public String toString() {
		return name().charAt(0) + name().substring(1).toLowerCase();
	}
}
