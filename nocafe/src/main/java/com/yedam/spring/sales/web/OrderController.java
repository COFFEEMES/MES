package com.yedam.spring.sales.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.sales.service.OrderService;
import com.yedam.spring.sales.service.OrderVO;
import com.yedam.spring.sales.service.VendVO;

@Controller
public class OrderController {

	@Autowired
	OrderService orderService;
	
	//주문서 조회 페이지
	@GetMapping("/orderList")
	public String orderList() {
		return "sales/order";
	}
	
	//주문서 조회 프로세스
	@PostMapping("/orderSearch")
	@ResponseBody
	public List<OrderVO> orderSearch(@RequestParam(required = false) String start, @RequestParam(required = false)  String end, @RequestParam(required = false)  String vendNm) {
		return orderService.searchOrder(start, end, vendNm);
	}
	
	//거래처 조회 모달창
	@PostMapping("/vendSearch")
	@ResponseBody
	public List<VendVO> vendSearch(@RequestParam(required = false) String vendNm) {
		return orderService.searchVend(vendNm);
	}
	
	
	//주문서 삭제 --> 수정
	@PostMapping("/orderDelete") 
	@ResponseBody
	 public String orderDelete(@RequestParam String str){ 
		 return "redirect:sales/order"; 
		 }
	 
}
