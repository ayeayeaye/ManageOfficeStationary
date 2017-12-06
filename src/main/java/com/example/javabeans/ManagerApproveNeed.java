package com.example.javabeans;

public enum ManagerApproveNeed {
	YES, NO;
	
	public String toString()
	{
		return name().substring(0, 1);
	}
}
