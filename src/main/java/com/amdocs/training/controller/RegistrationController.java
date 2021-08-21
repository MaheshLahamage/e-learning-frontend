package com.amdocs.training.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.amdocs.training.dao.UserDAO;
import com.amdocs.training.dao.impl.UserDAOImpl;
import com.amdocs.training.model.User;

@Controller
public class RegistrationController {

	@GetMapping("/user_registration")
	public String sign_up() {
		return "user_registration";
	}
	
	@PostMapping("/registrationProcess")
	public ModelAndView sign_up(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		int id = Integer.parseInt(request.getParameter("id"));
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String reg_date = request.getParameter("reg_date");
		String password = request.getParameter("password");
		String upload_photo = request.getParameter("upload_photo");
		long phone = Long.parseLong(request.getParameter("phone"));

		User user = new User(id, username, phone, email, address, reg_date, password, upload_photo);
		System.out.println("**********************"+user+"**********************");
		UserDAO dao = new UserDAOImpl();
		if(dao.saveUser(user)) {
			System.out.println("User "+user.getUser_id()+" added in database!");
			mv.addObject("username", user.getName());
			mv.setViewName("user_login");
		}
		else {
			System.out.println("Error while adding User "+user.getUser_id()+" in database!");
			mv.setViewName("error");
		}
		return mv;
	}
}
