package com.yedam.spring.manufacturing.performance.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.spring.manufacturing.performance.service.PerformanceService;

@Controller
public class PerformanceController {
	
	@Autowired
	PerformanceService service;
	
	@GetMapping("/performance")
	public String getAllInst(Model model) {
		model.addAttribute("instList", service.getAllInst());
		return "manufacture/performance";
	}

}
