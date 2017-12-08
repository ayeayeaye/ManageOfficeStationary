package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.model.Supplier;

public interface SupplierRepository extends JpaRepository<Supplier,String> {

}
