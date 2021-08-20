package com.amdocs.training.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.amdocs.training.dao.UserDAO;
import com.amdocs.training.dao.impl.UserDAOImpl;
import com.amdocs.training.model.User;

@RestController
public class UserController {

	UserDAO dao = new UserDAOImpl();

	@GetMapping("/user/{id}")
	public User getUser(@PathVariable int id) {
		User user = dao.getUserById(id);
		return user;
	}
	@GetMapping("/users")
	public List<User> getAllUser() {
		List<User> list = dao.findAll();
		return list;
	
	}
//	@GetMapping("/reg")
//	public List<User> setUser() {
//		return list;
//	
//	}
}
