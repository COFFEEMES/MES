package com.yedam.spring.manufacturing.plan.web;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
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
	
//	주문서 => 제품 , 생산량 , 재고
	@PostMapping("getOrderPro")
	@ResponseBody
	public List<PlanVO>getProCnt(@RequestBody String[] orderListAry){
		return planService.getOrderPro(orderListAry);
	}
	
	
//	계획 코드 생성
	@GetMapping("getPlanCd")
	@ResponseBody
	public PlanVO getPlanCd(PlanVO planVO) {
		planVO.setPlanDtFormat(date.format(planVO.getPlanDt()));
		System.out.println(planVO);
		return planService.getPlanCd(planVO);
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
	
//-----------------------------------------------------------------------------------	사용중
	@PostMapping("getRscStock")
	@ResponseBody
	public List<PlanVO>getRsc(@RequestBody List<Object>containorAry){
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("conAry", containorAry);
		
		return planService.getRsc(map);
	}
	
	@PostMapping("getRscLot")
	@ResponseBody
	public List<PlanVO>getLot(@RequestParam String rscNm, @RequestParam String bomCd ,PlanVO planVO){
		planVO.setRscNm(rscNm);
		planVO.setBomCd(bomCd);
		return planService.getRscDetail(planVO);
	}
	
//	/*
//	 * @GetMapping("/") model.addAttribute("order", planService.getOrderlist());
//	 */
}
