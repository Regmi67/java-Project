package com.purna.beltexam.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.purna.beltexam.services.BabyService;
import com.purna.beltexam.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	private final UserService userServ;
	private final BabyService babyServ;

	public HomeController( UserService userServ, BabyService babyServ) {
		this.userServ = userServ;
		this.babyServ = babyServ;
		// TODO Auto-generated constructor stub
	}
	@GetMapping("/")
	public String home(HttpSession session, Model model) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/users/login/register";
		}
		model.addAttribute("allBabys", babyServ.getAll());
		model.addAttribute("loggedInUser", userServ.getUser((long)session.getAttribute("user_id")));
		return "main/dashboard.jsp";
		
		
	}

}
