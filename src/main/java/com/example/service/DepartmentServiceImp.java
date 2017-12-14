package com.example.service;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder.In;

import org.springframework.stereotype.Service;

import com.example.model.Category;
import com.example.model.Department;
import com.example.model.ItemStcok;
import com.example.model.Requests;
import com.example.repository.CategoryRepository;
import com.example.repository.DepartmentRepository;
import com.example.repository.ItemStcokRepository;


@Service
public class DepartmentServiceImp implements DepartmentService {

	
	@Resource
	private DepartmentRepository repository;

	@Override
	public ArrayList<Department> getAllDept() {
		ArrayList<Department> deptList = (ArrayList<Department>) repository.findAll();
		return deptList;
	}



/*	@Override
	public Department findreqToStoreDept(Integer id) {
		Department  reqToStoreDept=  repository.findreqToStoreDept(id);
		return reqToStoreDept;
	}
*/


	
}
