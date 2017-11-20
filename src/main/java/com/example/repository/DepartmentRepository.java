package com.example.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.model.Department;
import com.example.model.Requests;

public interface DepartmentRepository extends JpaRepository<Department, String> {
	
/*	@Query("SELECT d FROM Department d where d.departmentId = :id ")
	Department findreqToStoreDept(@Param("id") Integer id);
*/

	
}
