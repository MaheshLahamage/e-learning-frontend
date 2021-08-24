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
import com.amdocs.training.dao.impl.CourseDAOImpl;
import com.amdocs.training.dao.impl.EnrollDAOImpl;
import com.amdocs.training.model.Auth;
import com.amdocs.training.model.Course;
import com.amdocs.training.model.Enroll;
import com.amdocs.training.model.User;

@Controller
public class CourseController {

	@GetMapping("/add_course")
	public ModelAndView add_course(HttpServletRequest request, HttpServletResponse response) {
		Auth auth = (Auth) request.getSession().getAttribute("auth");
		if(auth == null || auth.getRoll() != "ADMIN") {
			return new ModelAndView("redirect:/admin_login");
		}
		return new ModelAndView("add_course");
	}
	
	@PostMapping("/submit_course")
	public ModelAndView submit_course(HttpServletRequest request, HttpServletResponse response) {
		Auth auth = (Auth) request.getSession().getAttribute("auth");
		if(auth == null || auth.getRoll() != "ADMIN") {
			return new ModelAndView("redirect:/admin_login");
		}
		ModelAndView mv = new ModelAndView("redirect:/courses");
		String c_name = request.getParameter("c_name");
		double c_fees = Double.parseDouble(request.getParameter("c_fees"));
		String c_desp = request.getParameter("c_desp");
		String c_resource = request.getParameter("c_resource");

		Course course = new Course(null, c_name, c_fees, c_desp, c_resource);
		System.out.println("**********************"+course+"**********************");
		CourseDAO dao = new CourseDAOImpl();
		if(dao.saveCourse(course)) {
			System.out.println("Course "+course.getC_name()+" added in database!");
			mv.addObject("c_name", course.getC_name());
		}
		else {
			System.out.println("Error while adding Course from "+course.getC_name()+" in database!");
			mv.setViewName("error");
		}
		return mv;
	}

	@GetMapping("/courses")
	public ModelAndView all_courses(HttpServletRequest request, HttpServletResponse response) {
		Auth auth = (Auth) request.getSession().getAttribute("auth");
		if(auth == null || auth.getRoll() == null) {
			return new ModelAndView("redirect:/user_login");
		}
		ModelAndView mv = new ModelAndView("all_courses");
		CourseDAO dao = new CourseDAOImpl();
		EnrollDAO enrolldao = new EnrollDAOImpl();
		List<Course> courses = dao.findAll();
		List<Course> other = new ArrayList<Course>(courses);
		List<Course> enrolled = null;
		if(auth.getRoll()=="USER") {
			User user = (User)auth.getObj();
			enrolled = enrolldao.getEnrolledCourses(user.getUser_id());
		}
		for(Course i: courses) {
			System.out.println(i);
		}
		if(enrolled!=null) {
			for(Course i: enrolled) {
				System.out.println(i);
			}
			other.removeAll(enrolled);
		}
		mv.addObject("courses", other);
		mv.addObject("enrolled", enrolled);
		
		return mv;
	}
}
