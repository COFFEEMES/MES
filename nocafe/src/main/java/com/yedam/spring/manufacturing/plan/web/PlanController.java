package com.yedam.spring.manufacturing.plan.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.spring.manufacturing.plan.service.PlanService;
import com.yedam.spring.sales.service.OrderVO;

@Controller
public class PlanController {
	
	@Autowired
	PlanService planService;
	
	@GetMapping("/mkrPlan")
	public String dirList() {
		return "manufacture/plan";
	}
	
	
//	외부모달
	@GetMapping("/orderListModal")
	public List<OrderVO> loginModal() {
		return planService.getOrderlist();
	}
	
//	/*
//	 * @GetMapping("/") model.addAttribute("order", planService.getOrderlist());
//	 */
}
