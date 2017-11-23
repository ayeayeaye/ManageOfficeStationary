package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.model.CollectionPoint;

public interface CollectPointRepository extends JpaRepository<CollectionPoint, String> {

	@Query("select cp from CollectionPoint cp where cp.collectPointId = :cpId")
	CollectionPoint findCPbyId(@Param ("cpId") Integer cpId );

}
