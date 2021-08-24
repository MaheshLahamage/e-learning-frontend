package com.amdocs.training.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.amdocs.training.dao.CourseDAO;
import com.amdocs.training.dao.EnrollDAO;
import com.amdocs.training.dao.UserDAO;
import com.amdocs.training.dao.impl.CourseDAOImpl;
import com.amdocs.training.dao.impl.EnrollDAOImpl;
import com.amdocs.training.dao.impl.UserDAOImpl;
import com.amdocs.training.model.Auth;
import com.amdocs.training.model.Course;
import com.amdocs.training.model.Enroll;
import com.amdocs.training.model.User;

@Controller
public class EnrollController {


	@GetMapping("/enrolled")
	public ModelAndView enrolled(HttpServletRequest request, HttpServletResponse response) {
		Auth auth = (Auth) request.getSession().getAttribute("auth");
		if(auth == null || auth.getRoll() != "ADMIN") {
			return new ModelAndView("redirect:/admin_login");
			
		}
		ModelAndView mv = new ModelAndView("enrolled");
		CourseDAO coursedao = new CourseDAOImpl();
		UserDAO userdao = new UserDAOImpl();
		EnrollDAO enrolldao = new EnrollDAOImpl();
		
//		List<Course> courses = coursedao.findAll();
//		List<User> users = userdao.findAll();
		List<Enroll> enrolled = enrolldao.findAll();

		List<User> users = new ArrayList<User>();
		List<Course> courses = new ArrayList<Course>();
		if(enrolled!=null) {
			for(Enroll e: enrolled) {
				users.add(userdao.getUserById(e.getUser_id()));
				courses.add(coursedao.getCourseById(e.getCourse_id()));
			}
		}
		mv.addObject("users", users);
		mv.addObject("courses", courses);
		
		return mv;
	}
	
	@PostMapping("/enrollProcess")
	public ModelAndView enroll(HttpServletRequest request, HttpServletResponse response) {
		Auth auth = (Auth) request.getSession().getAttribute("auth");
		if(auth == null || auth.getRoll() == null) {
			return new ModelAndView("redirect:/user_login");
		}
		ModelAndView mv = new ModelAndView("redirect:/enrolled");
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
		Auth auth = (Auth) request.getSession().getAttribute("auth");
		if(auth == null || auth.getRoll() == null) {
			return new ModelAndView("redirect:/user_login");
		}
		ModelAndView mv = new ModelAndView("redirect:/enrolled");
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
}
