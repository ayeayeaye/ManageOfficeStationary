package com.example.model;

import javax.persistence.criteria.CriteriaBuilder.In;

public class Test {

	private Integer id;
	private String name;
	
	public Test(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Test() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
