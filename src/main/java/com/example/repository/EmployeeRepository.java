package com.example.repository;


import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.model.Employee;
import com.example.model.ItemStcok;


public interface EmployeeRepository extends JpaRepository<Employee,String> {

	@Query("Select e from Employee e where e.department=:dept")
	ArrayList<Employee> findEmpsByDept(@Param ("dept") String dept);


}
