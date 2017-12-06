package com.example.javabeans;

public enum StoreStatus {
	PENDING, DISBURSED;
	
	public String toString() {
		return name().charAt(0) + name().substring(1).toLowerCase();
	}
}
