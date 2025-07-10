package com.example.demo.Repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Model.DModel;

import java.util.List;

public interface Repository extends JpaRepository <DModel,Integer>{
	 List<DModel> findByNameContainingIgnoreCase(String name);

}