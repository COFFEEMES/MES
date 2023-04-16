package com.yedam.spring.sales.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.sales.service.LotService;
import com.yedam.spring.sales.service.LotVO;

@Controller
public class LotController {
	
	@Autowired
	LotService lotService;
	
	// 페이지
	@GetMapping("/lotList")
	public String lotList() {
		return "sales/lot";
	}
	
	//조회
	@PostMapping("/lotSearch")
	@ResponseBody
	public List<LotVO> lotSearch(@RequestParam(required = false) String start, @RequestParam(required = false)  String end, @RequestParam(required = false)  String proNm) {
		return lotService.lotList(start, end, proNm);
	}
	
	//삭제 
	@PostMapping("/lotDelete") 
	@ResponseBody
	 public int lotDelete(@RequestParam String str){
		 return lotService.deleteLot(str);
		 
	 }

}
