package com.yedam.spring.sales.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.sales.service.ReceiveService;
import com.yedam.spring.sales.service.ReceiveVO;
import com.yedam.spring.sales.service.ReleaseVO;

@Controller
public class ReceiveController {
	
	@Autowired
	ReceiveService receiveService;

	//제품 입고 
	
	//제품입고 페이지
	@GetMapping("/receiveList")
	public String receiveList() {
		return "sales/receive";
	}
	
	//검사완료 조회 모달창
	@PostMapping("/testCom")
	@ResponseBody
	//@RequestParam(required = false) String start, @RequestParam(required = false)  String end
	public List<ReceiveVO> testCom() {
		return receiveService.testComplete();
	}
	
	//입고 등록
	@PostMapping("/signUp")
	@ResponseBody
	public int signUp(@RequestBody List<ReceiveVO> receiveVO) {
		return receiveService.signUp(receiveVO);
	} 
	
	//입고 조회(오늘날짜)
	@GetMapping("/receiveData")
	@ResponseBody
	public List<ReceiveVO> receiveData(Model model) {
		return receiveService.search();
	}
	
	//제품입고조회 페이지
	@GetMapping("/receiveCheck")
	public String receiveCheck() {
		return "sales/receiveCheck";
	}
	
	//입출고 조회 -> 입고
	@PostMapping("/reCheck")
	@ResponseBody
	public List<ReceiveVO> reCheck(@RequestParam(required = false) String start, @RequestParam(required = false)  String end, @RequestParam(required = false)  String proNm) {
		return receiveService.reCheck(start, end, proNm);
	}
	
	//입출고 조회 -> 출고
	@PostMapping("/releaseCheck")
	@ResponseBody
	public List<ReleaseVO> releaseCheck(@RequestParam(required = false) String start, @RequestParam(required = false)  String end, @RequestParam(required = false)  String proNm) {
		return receiveService.releaseCheck(start, end, proNm);
	}

}
