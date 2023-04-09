package com.yedam.spring.material.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.spring.material.service.MaterialService;

@Controller
public class MaterialController {

	@Autowired
	MaterialService materialService;
	
	//발주관리
	@GetMapping("/materialOrder")
	public String getMaterialOrder(Model model) {
		model.addAttribute("materialList", materialService.getMaterialList());
		model.addAttribute("matetiOrderList", materialService.getMaterialOrderList());
		return "material/materialOrder";
	}
	
	//자재재고조회
	@GetMapping("/materialList")
	public String getMaterialList(Model model) {
		model.addAttribute("materialList", materialService.getMaterialList());
		return "material/materialList";
	}
	
	//발주조회
	@GetMapping("/materialOrderList")
	public String getMaterialOrderList(Model model) {
		model.addAttribute("materialOrderList", materialService.getMaterialOrderList());
		return "material/materialOrderList";
	}
	
	
	//자재입고조회
	@GetMapping("/materialReceivingList")
	public String getMaterialReceivingList(Model model) {
		model.addAttribute("materialReceivingList", materialService.getMaterialReceivingList());
		return "material/materialReceivingList";
	}
	
	//자재출고조회
	@GetMapping("/materialShippingList")
	public String getMaterialShippingList(Model model) {
		model.addAttribute("materialShippingList", materialService.getMaterialShippingList());
		return "material/materialShippingList";
	}
	
	//자재LOT조회
	@GetMapping("/materialLOTList")
	public String getMaterialLOTList(Model model) {
		model.addAttribute("materialLOTList", materialService.getMaterialLOTList());
		return "material/materialLOTList";
	}
	//자재입고검사조회
	@GetMapping("/materialTestList")
	public String getMaterialTestList(Model model) {
		model.addAttribute("materialTestList", materialService.getMaterialTestList());
		return "material/materialTestList";
	}
	
	}

