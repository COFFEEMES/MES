package com.yedam.spring.sales.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.sales.service.MaterialWareService;
import com.yedam.spring.sales.service.MaterialWareVO;
import com.yedam.spring.sales.service.OrderVO;

@Controller
public class MaterialWareController {
	
	@Autowired
	MaterialWareService materialWareService;

	//자재입고검사 페이지
	@GetMapping("/materialReceivingTest")
	public String materialReceivingTest() {
		return "sales/materialReceivingTest";
	}
	
	//자재 발주 목록
	@PostMapping("/reList")
	@ResponseBody
	public List<MaterialWareVO> reList(@RequestParam(required = false) String start, @RequestParam(required = false)  String end, @RequestParam(required = false)  String vendNm) {
			return materialWareService.reList(start, end, vendNm);
		}
	
	//자재 발주 목록
	@PostMapping("/detailList")
	@ResponseBody
	public List<MaterialWareVO> detailList(@RequestParam(required = false) String ordrCd) {
			return materialWareService.detailList(ordrCd);
		}
	
	//검사 모달
	@GetMapping("/testPoor")
	@ResponseBody
	public List<MaterialWareVO> testPoor() {
			return materialWareService.testPoor();
		}
	
	//사원정보
	@GetMapping("/empList")
	@ResponseBody
	public List<MaterialWareVO> empList() {
		return materialWareService.empList();
	}
	
	
	//상세 저장
	@PostMapping("/saveDetail")
	@ResponseBody
	public int saveDetail(@RequestBody List<MaterialWareVO> materialWareVO) {
			return materialWareService.saveDetail(materialWareVO);
		}
	
}
