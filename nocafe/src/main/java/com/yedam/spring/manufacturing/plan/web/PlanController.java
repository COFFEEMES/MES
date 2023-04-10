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
	};
	
	
//	외부모달
	@GetMapping("/orderListModal")
	@ResponseBody
	public List<OrderVO> loginModal() {
		return planService.getOrderlist();
	};
	
//	계획 코드 생성
	@GetMapping("getPlanCd")
	@ResponseBody
	public PlanVO getPlanCd(PlanVO planVO) {
		planVO.setPlanDtFormat(date.format(planVO.getPlanDt()));
		System.out.println(planVO);
		return planService.getPlanCd(planVO);
	};
	
//	제품제고 조회
	@GetMapping("getStock")
	@ResponseBody
	public PlanVO getStock(PlanVO planVO) {
		return planService.getStock(planVO);
	};
	
//	bom코드 
	@GetMapping("getBom")
	@ResponseBody
	public List<PlanVO> getBom(PlanVO planVO) {
		return planService.getBomCd(planVO);
	};
	
//	불량률 조회
	@GetMapping("getInfer")
	@ResponseBody
	public List<PlanVO> getInfer(PlanVO planVO){
		return planService.getInferPct(planVO);
	};
	
	@GetMapping("getRsc")
	@ResponseBody
	public List<PlanVO>getRsc(PlanVO planVO){
		return planService.getRsc(planVO);
	}
	
	@GetMapping("getRscLot")
	@ResponseBody
	public List<PlanVO>getLot(PlanVO planVO){
		return planService.getRscDetail(planVO);
	}
	
//	/*
//	 * @GetMapping("/") model.addAttribute("order", planService.getOrderlist());
//	 */
}
