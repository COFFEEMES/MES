package com.yedam.spring.sales.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReleaseController {

	//제품 출고 
	
	//제품입고 페이지
	@GetMapping("/releaseList")
	public String releaseList() {
		return "sales/release";
	}
	
}
