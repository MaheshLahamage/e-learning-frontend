package com.amdocs.training.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.amdocs.training.dao.AdminDAO;
import com.amdocs.training.dao.UserDAO;
import com.amdocs.training.dao.impl.AdminDAOImpl;
import com.amdocs.training.dao.impl.UserDAOImpl;
import com.amdocs.training.model.Auth;
import com.amdocs.training.model.User;

@Controller
public class UserController {

	@GetMapping("/user_registration")
	public ModelAndView sign_up() {
		return new ModelAndView("user_registration");
	}
	
	@PostMapping("/registrationProcess")
	public ModelAndView sign_up(HttpServletRequest request, HttpServletResponse response) {
		Auth auth = (Auth) request.getSession().getAttribute("auth");
		
		ModelAndView mv = null;
		if(auth != null && auth.getRoll() == "ADMIN") {
			mv = new ModelAndView("redirect:/users");
		}
		else {
			mv = new ModelAndView("redirect:/user_login");
		}
		String username = request.getParameter("username");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String reg_date = request.getParameter("reg_date");
		String password = request.getParameter("password");
		String upload_photo = request.getParameter("upload_photo");

		User user = new User(null, username, phone, email, address, reg_date, upload_photo, password);
		System.out.println("**********************"+user+"**********************");
		UserDAO dao = new UserDAOImpl();
		if(dao.saveUser(user)) {
			System.out.println("User "+user.getUser_id()+" added in database!");
			mv.addObject("username", user.getName());
		}
		else {
			System.out.println("Error while adding User "+user.getUser_id()+" in database!");
			mv.setViewName("error");
		}
		return mv;
	}

	@GetMapping("/users")
	public ModelAndView all_users(HttpServletRequest request, HttpServletResponse response) {
		Auth auth = (Auth) request.getSession().getAttribute("auth");
		if(auth == null || auth.getRoll() != "ADMIN") {
			return new ModelAndView("redirect:/admin_login");
		}
		ModelAndView mv = new ModelAndView("all_users");
		UserDAO dao = new UserDAOImpl();
		List<User> users = dao.findAll();
//		for(User i: users) {
//			System.out.println(i);
//		}
		mv.addObject("users", users);
		
		return mv;
	}
	

	@PostMapping("/delUserProcess")
	public ModelAndView delUser(HttpServletRequest request, HttpServletResponse response) {
		Auth auth = (Auth) request.getSession().getAttribute("auth");
		if(auth == null || auth.getRoll() != "ADMIN") {
			return new ModelAndView("redirect:/admin");
		}
		ModelAndView mv = new ModelAndView("redirect:/users");
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		
		System.out.println("**********************"+user_id+"**********************");
		UserDAO admindao = new UserDAOImpl();
		if(admindao.deleteUser(user_id)) {
			System.out.println("User "+user_id+" Removed from database!");
		}
		else {
			System.out.println("Error while removing User "+user_id+" from database!");
			mv.setViewName("error");
		}
		return mv;
	}
//	@GetMapping("/user/{id}")
//	public User getUser(@PathVariable int id) {
//		User user = dao.getUserById(id);
//		return user;
//	}
//	@GetMapping("/users")
//	public List<User> getAllUser() {
//		List<User> list = dao.findAll();
//		return list;
//	
//	}
//	@GetMapping("/reg")
//	public List<User> setUser() {
//		return list;
//	
//	}
}
