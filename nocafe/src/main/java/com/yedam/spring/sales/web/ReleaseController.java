package com.yedam.spring.sales.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.sales.service.OrderVO;
import com.yedam.spring.sales.service.ReceiveVO;
import com.yedam.spring.sales.service.ReleaseService;
import com.yedam.spring.sales.service.ReleaseVO;

@Controller
public class ReleaseController {
	
	@Autowired
	ReleaseService releaseService;
	

	//제품 출고 
	
	//제품입고 페이지
	@GetMapping("/releaseList")
	public String releaseList() {
		return "sales/release";
	}
	
	//전체조회
	@GetMapping("/getOrder")
	@ResponseBody
	public List<ReleaseVO> getOrder(Model model) {
		return releaseService.getOrder();
	}
	
	//완재품 재고량 조회 모달창
	@PostMapping("/getInven")
	@ResponseBody
	public List<ReleaseVO> getInven(@RequestParam(required = false) String proNm) {
		return releaseService.getInven(proNm);
	}
	
	//출고조회
	@GetMapping("/getOust")
	@ResponseBody
	public List<ReleaseVO> getOust(Model model) {
		return releaseService.getOust();
	}
	
	//주문서 조회 프로세스
	@PostMapping("/reAdd")
	@ResponseBody
	public int reAdd(@RequestParam(required = false) String orderNo, @RequestParam(required = false)  String orderDetailNo, @RequestParam(required = false) int orderCnt,
			@RequestParam(required = false)  String proLotNo, @RequestParam(required = false)  String proNm) {
		return releaseService.reAdd(orderNo, orderDetailNo, orderCnt, proLotNo, proNm);
		
	}
	
	
}
