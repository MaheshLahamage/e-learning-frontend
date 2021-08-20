package com.amdocs.training.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
	
	@GetMapping("/sign_up")
	public String sign_up() {
		return "sign_up";
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
