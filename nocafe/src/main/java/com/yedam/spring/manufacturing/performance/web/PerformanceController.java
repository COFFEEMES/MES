package com.yedam.spring.manufacturing.performance.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.manufacturing.performance.service.InstVO;
import com.yedam.spring.manufacturing.performance.service.PerformanceService;
import com.yedam.spring.manufacturing.performance.service.ProcessVO;

@Controller
public class PerformanceController {
	
	@Autowired
	PerformanceService service;
	
	@GetMapping("/performance")
	public String getAllInst(Model model) {
		model.addAttribute("instList", service.getAllInst());
		return "manufacture/performance";
	}
	
	@PostMapping("/getPrOrderDetail")
	@ResponseBody
	public List<InstVO> getPrOrderDetail(InstVO instVO){
		return service.getPrOrderDetail(instVO);
	}
	
	@PostMapping("/getPrcsBom")
	@ResponseBody
	public List<ProcessVO> getPrcsBom(InstVO instVO){
		return service.getPrcsBom(instVO);
	}

}
