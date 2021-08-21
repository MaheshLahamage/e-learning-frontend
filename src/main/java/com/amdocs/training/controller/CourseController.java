package com.amdocs.training.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.amdocs.training.dao.CourseDAO;
import com.amdocs.training.dao.impl.CourseDAOImpl;
import com.amdocs.training.model.Course;

@Controller
public class CourseController {

	@GetMapping("/add_course")
	public String add_course() {
		return "add_course";
	}
	
	@PostMapping("/submit_course")
	public ModelAndView submit_course(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
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
			mv.setViewName("index");
		}
		else {
			System.out.println("Error while adding Course from "+course.getC_name()+" in database!");
			mv.setViewName("error");
		}
		return mv;
	}

	@GetMapping("/courses")
	public ModelAndView all_courses() {
		CourseDAO dao = new CourseDAOImpl();
		List<Course> courses = dao.findAll();
		for(Course i: courses) {
			System.out.println(i);
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("courses", courses);
		mv.setViewName("all_courses");
		
		return mv;
	}
}
