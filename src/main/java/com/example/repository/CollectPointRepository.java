package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.model.CollectionPoint;

public interface CollectPointRepository extends JpaRepository<CollectionPoint, String> {

}
