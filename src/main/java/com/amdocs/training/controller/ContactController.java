package com.amdocs.training.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.amdocs.training.dao.ContactDAO;
import com.amdocs.training.dao.impl.ContactDAOImpl;
import com.amdocs.training.model.Auth;
import com.amdocs.training.model.Contact;

@Controller
public class ContactController {

	@GetMapping("/add_contact")
	public ModelAndView add_contact(HttpServletRequest request, HttpServletResponse response) {
		Auth auth = (Auth) request.getSession().getAttribute("auth");
		if(auth == null || auth.getRoll() == null) {
			return new ModelAndView("redirect:/user_login");
		}
		return new ModelAndView("add_contact");
	}
	
	@PostMapping("/submit_contact")
	public ModelAndView submit_feeback(HttpServletRequest request, HttpServletResponse response) {
		Auth auth = (Auth) request.getSession().getAttribute("auth");
		if(auth == null || auth.getRoll() == null) {
			return new ModelAndView("redirect:/user_login");
		}
		ModelAndView mv = new ModelAndView("redirect:/contacts");
		Integer user_id = Integer.parseInt(request.getParameter("user_id"));
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String message = request.getParameter("message");

		Contact contact = new Contact(null, user_id, username, email, phone, message);
		System.out.println("**********************"+contact+"**********************");
		ContactDAO dao = new ContactDAOImpl();
		if(dao.saveContact(contact)) {
			System.out.println("Contact From "+contact.getUser_id()+" added in database!");
//			mv.addObject("username", contact.getName());
//			mv.setViewName("all_contacts");
//			mv.setViewName("contacts");
		}
		else {
			System.out.println("Error while adding Contact from "+contact.getUser_id()+" in database!");
			mv.setViewName("error");
		}
		return mv;
	}

	@GetMapping("/contacts")
	public ModelAndView all_contacts(HttpServletRequest request, HttpServletResponse response) {
		Auth auth = (Auth) request.getSession().getAttribute("auth");
		if(auth == null || auth.getRoll() == null) {
			return new ModelAndView("redirect:/user_login");
		}
		ModelAndView mv = new ModelAndView("contact");
		ContactDAO dao = new ContactDAOImpl();
		List<Contact> contacts = dao.findAll();
		for(Contact i: contacts) {
			System.out.println(i);
		}
		mv.addObject("contacts", contacts);
		
		return mv;
	}
}
