package com.yedam.spring.manufacturing.plan.web;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.manufacturing.plan.service.PlanService;
import com.yedam.spring.manufacturing.plan.service.PlanVO;
import com.yedam.spring.sales.service.OrderVO;

@Controller
public class PlanController {
	
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	
	@Autowired
	PlanService planService;
	
	@GetMapping("/mkrPlan")
	public String dirList() {
		return "manufacture/plan";
	}
	
	
//	외부모달
	@GetMapping("/orderListModal")
	@ResponseBody
	public List<OrderVO> loginModal() {
		return planService.getOrderlist();
	}
	
	@GetMapping("getPlanCd")
	@ResponseBody
	public PlanVO getPlanCd(PlanVO planVO) {
		planVO.setPlanDtFormat(date.format(planVO.getPlanDt()));
		return planService.getPlanCd(planVO);
	}
	
	@GetMapping("getStock")
	@ResponseBody
	public PlanVO getStock(PlanVO planVO) {
		System.out.println(planVO);
		return planService.getStock(planVO);
	}
	
//	/*
//	 * @GetMapping("/") model.addAttribute("order", planService.getOrderlist());
//	 */
}
