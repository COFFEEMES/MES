package com.yedam.spring.material.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.spring.material.service.MaterialService;

@Controller
public class MaterialController {

	@Autowired
	MaterialService materialService;
	
	//발주조회
	@GetMapping("MaterialOrderList")
	public String getMaterialOrderList(Model model) {
		model.addAttribute("MaterialOrderList", materialService.getMaterialOrderList());
		return "material/materialOrderList";
	}
	
	}

