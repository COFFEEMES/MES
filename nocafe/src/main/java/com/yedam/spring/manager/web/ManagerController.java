package com.yedam.spring.manager.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.spring.manager.service.ManagerService;

@Controller
public class ManagerController {

	@Autowired
	ManagerService managerService;
	
	@GetMapping("/basicCodeManage")
	public String getBasicCode(Model model) {
		model.addAttribute("basicCode", managerService.getAllBasicCode());
		return "manager/basicCode";
	}

}
