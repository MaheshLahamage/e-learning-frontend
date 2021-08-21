package com.amdocs.training.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.amdocs.training.dao.UserDAO;
import com.amdocs.training.dao.impl.UserDAOImpl;
import com.amdocs.training.model.User;

@Controller
public class HomeController {

	@GetMapping("/")
	public String indexPage() {
		return "index";
	}

	@GetMapping("/Home")
	public String HomePage() {
		return "index";
	}

	@GetMapping("/add_contact")
	public String add_contact() {
		return "add_contact";
	}
	@GetMapping("/add_feedback")
	public String add_feedback() {
		return "add_feedback";
	}
	@GetMapping("/add_course")
	public String add_course() {
		return "add_course";
	}
}
