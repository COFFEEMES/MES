package com.yedam.spring.sales.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.sales.mapper.MaterialWareMpper;
import com.yedam.spring.sales.service.MaterialWareVO;
import com.yedam.spring.sales.service.OrderVO;

@Controller
public class MaterialWareController {
	
	@Autowired
	MaterialWareMpper materialWareMapper;

	//자재입고검사 페이지
	@GetMapping("/materialReceivingTest")
	public String materialReceivingTest() {
		return "sales/materialReceivingTest";
	}
	
	//자재 발주 목록
	@PostMapping("/reList")
	@ResponseBody
	public List<MaterialWareVO> reList(@RequestParam(required = false) String start, @RequestParam(required = false)  String end, @RequestParam(required = false)  String vendNm) {
			return materialWareMapper.reList(start, end, vendNm);
		}
}
