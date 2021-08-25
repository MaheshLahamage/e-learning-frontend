package com.amdocs.training.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.amdocs.training.dao.CourseDAO;
import com.amdocs.training.dao.FeedbackDAO;
import com.amdocs.training.dao.impl.CourseDAOImpl;
import com.amdocs.training.dao.impl.FeedbackDAOImpl;
import com.amdocs.training.model.Auth;
import com.amdocs.training.model.Feedback;

@Controller
public class FeedbackController {

//	@GetMapping("/add_feedback")
//	public ModelAndView add_feedback(HttpServletRequest request, HttpServletResponse response) {
//		Auth auth = (Auth) request.getSession().getAttribute("auth");
//		if(auth == null || auth.getRoll() == null) {
//			return new ModelAndView("redirect:/user_login");
//		}
//		return new ModelAndView("add_feedback");
//	}
//	
	@PostMapping("/submit_feedback")
	public ModelAndView submit_feeback(HttpServletRequest request, HttpServletResponse response) {
		Auth auth = (Auth) request.getSession().getAttribute("auth");
		if(auth == null || auth.getRoll() == null) {
			return new ModelAndView("redirect:/user_login");
		}
		ModelAndView mv = new ModelAndView("redirect:/feedbacks");
		Integer user_id = Integer.parseInt(request.getParameter("user_id"));
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String f_back = request.getParameter("feedback");

		Feedback feedback = new Feedback(null, user_id, username, email, f_back);
		System.out.println("**********************"+feedback+"**********************");
		FeedbackDAO dao = new FeedbackDAOImpl();
		if(dao.saveFeedback(feedback)) {
			System.out.println("Feedback From "+feedback.getUser_id()+" added in database!");
			mv.addObject("username", feedback.getName());
		}
		else {
			System.out.println("Error while adding Feedback from "+feedback.getUser_id()+" in database!");
			mv.setViewName("error");
		}
		return mv;
	}

	@GetMapping("/feedbacks")
	public ModelAndView all_feedback(HttpServletRequest request, HttpServletResponse response) {
		Auth auth = (Auth) request.getSession().getAttribute("auth");
		if(auth == null || auth.getRoll() == null) {
			return new ModelAndView("redirect:/user_login");
		}
		ModelAndView mv = new ModelAndView("all_feedbacks");
		FeedbackDAO dao = new FeedbackDAOImpl();
		List<Feedback> feedbacks = dao.findAll();
		for(Feedback i: feedbacks) {
			System.out.println(i);
		}
		mv.addObject("feedbacks", feedbacks);
		mv.setViewName("all_feedbacks");
		
		return mv;
	}

	@PostMapping("/delFeedbackProcess")
	public ModelAndView delCourse(HttpServletRequest request, HttpServletResponse response) {
		Auth auth = (Auth) request.getSession().getAttribute("auth");
		if(auth == null || auth.getRoll() != "ADMIN") {
			return new ModelAndView("redirect:/admin_login");
		}
		ModelAndView mv = new ModelAndView("redirect:/feedbacks");
		int f_id = Integer.parseInt(request.getParameter("f_id"));
		
		System.out.println("**********************"+f_id+"**********************");
		FeedbackDAO feedbackdao = new FeedbackDAOImpl();
		if(feedbackdao.deleteFeedback(f_id)) {
			System.out.println("Feedback "+f_id+" Removed from database!");
		}
		else {
			System.out.println("Error while removing Feedback "+f_id+" from database!");
			mv.setViewName("error");
		}
		return mv;
	}
}
