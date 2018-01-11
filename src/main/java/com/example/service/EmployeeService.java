package com.example.service;

import java.util.ArrayList;

import com.example.model.Category;
import com.example.model.Employee;
import com.example.model.ItemStcok;

public interface EmployeeService {

	ArrayList<Employee> findEmpsByDept(String dept);

	ArrayList<Employee> findAllEmp();

}
