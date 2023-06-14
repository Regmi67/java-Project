package com.purna.beltexam.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.purna.beltexam.models.Baby;
import com.purna.beltexam.services.BabyService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/names")
public class BabyController {

	private final BabyService babyServ;
	public BabyController(BabyService babyServ) {
		this.babyServ = babyServ;
	}
	
	@GetMapping("/create")
	public String createBaby(@ModelAttribute("baby") Baby baby) {
		return "baby/create.jsp";
	}
	
	@PostMapping("/process/create")
	public String processCreateBaby(@Valid @ModelAttribute("baby") Baby baby, BindingResult result) {
		if(result.hasErrors()) {
			return "baby/create.jsp";
		}
		babyServ.create(baby);
		return "redirect:/";
				
	}
	
	@GetMapping("/edit/{id}")
	public String editBaby(@PathVariable("id") Long id, Model model, HttpSession session) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/users/login/register";
		}
		Baby baby = babyServ.getOne(id);
		if(!baby.getUserName().getId().equals(session.getAttribute("user_id")) ) {
			return "redirect:/";
		}
		model.addAttribute("baby", babyServ.getOne(id));
		return "baby/edit.jsp";
	}
	
	@PutMapping("/process/edit/{id}")
	public String processEditBaby(@Valid @ModelAttribute("baby") Baby baby, BindingResult result) {
		if(result.hasErrors()) {
			 return "baby/edit.jsp";
		}
		babyServ.update(baby);
		return "redirect:/";
	}
	
	@DeleteMapping("/delete/{id}")
	public String deleteBaby(@PathVariable("id") Long id) {
		babyServ.delete(id);
		return "redirect:/";
	}
	
	@GetMapping("/{id}")
	public String showOneBaby(@PathVariable("id") Long id, Model model, HttpSession session) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/users/login/register";
		}
		model.addAttribute("baby", babyServ.getOne(id));
		return "baby/displayOne.jsp";
	}
}