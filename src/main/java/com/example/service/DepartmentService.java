package com.example.service;

import java.util.ArrayList;

import org.springframework.data.repository.query.Param;

import com.example.model.Department;
import com.example.model.Requests;

public interface DepartmentService {

	ArrayList<Department> getAllDept();

	/*Department findreqToStoreDept(Integer id);*/
}
