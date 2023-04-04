package com.yedam.spring.sales.order.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.spring.sales.order.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	OrderService orderService;
	
	//주문서 조회 페이지
	@GetMapping("/orderList")
	public String orderList() {
		return "sales/order";
	}
	
	//주문서 조회 
	//@GetMapping("/orderSearch")
	//public String orderSearch(Model model) {
		
	//}
	
}
