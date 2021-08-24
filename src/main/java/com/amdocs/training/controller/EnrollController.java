package com.amdocs.training.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.amdocs.training.dao.EnrollDAO;
import com.amdocs.training.dao.impl.EnrollDAOImpl;
import com.amdocs.training.model.Enroll;

@Controller
public class EnrollController {

	
	@PostMapping("/enrollProcess")
	public ModelAndView enroll(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("redirect:/courses");
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int course_id = Integer.parseInt(request.getParameter("course_id"));
		
		Enroll enroll = new Enroll(user_id,course_id);
		System.out.println("**********************"+enroll+"**********************");
		EnrollDAO dao = new EnrollDAOImpl();
		if(dao.saveEnroll(enroll)) {
			System.out.println("User "+enroll.getUser_id()+" added in database!");
//			mv.addObject("username", enroll.getUser_id());
//			mv.addObject("redirect", "courses");
//			mv.setViewName("all_courses");
		}
		else {
			System.out.println("Error while adding User "+enroll.getUser_id()+" in database!");
			mv.setViewName("error");
		}
		return mv;
	}
	
	@PostMapping("/unenrollProcess")
	public ModelAndView unenroll(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("redirect:/courses");
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int course_id = Integer.parseInt(request.getParameter("course_id"));
		
//		Enroll enroll = new Enroll(user_id,course_id);
//		System.out.println("**********************"+enroll+"**********************");
		EnrollDAO dao = new EnrollDAOImpl();
		if(dao.deleteEnroll(user_id, course_id)) {
			System.out.println("User : "+user_id+" unenrolled from course : "+course_id+" in database!");
//			mv.addObject("username", enroll.getUser_id());
//			mv.addObject("redirect", "courses");
//			mv.setViewName("all_courses");
		}
		else {
			System.out.println("Error while unenroll User : "+user_id+" course :"+course_id);
			mv.setViewName("error");
		}
		return mv;
	}

//	@GetMapping("/users")
//	public ModelAndView all_users() {
//		EnrollDAO dao = new EnrollDAOImpl();
//		List<Enroll> users = dao.findAll();
//		for(Enroll i: users) {
//			System.out.println(i);
//		}
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("users", users);
//		mv.setViewName("all_users");
//		
//		return mv;
//	}

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
