package com.example.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.model.User;
import com.example.repository.UserRepository;

@Service
public class UserServiceImp implements UserService {

	@Resource
	private UserRepository repository;

	@Override
	public List<User> findAllUser() {
		return repository.findAll();
	}
}
