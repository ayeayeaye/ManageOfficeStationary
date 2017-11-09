package com.example.service;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder.In;

import org.springframework.stereotype.Service;

import com.example.model.Category;
import com.example.model.Department;
import com.example.model.Item;
import com.example.repository.CategoryRepository;
import com.example.repository.DepartmentRepository;
import com.example.repository.ItemRepository;


@Service
public class DepartmentServiceImp implements DepartmentService {

	
	@Resource
	private DepartmentRepository repository;

/*	@Override
	public Department findreqToStoreDept(Integer id) {
		Department  reqToStoreDept=  repository.findreqToStoreDept(id);
		return reqToStoreDept;
	}
*/


	
}
