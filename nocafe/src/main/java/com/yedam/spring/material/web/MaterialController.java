package com.yedam.spring.material.web;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.material.service.MaterialLOTVO;
import com.yedam.spring.material.service.MaterialOrderDetailVO;
import com.yedam.spring.material.service.MaterialService;

@Controller
public class MaterialController {

	@Autowired
	MaterialService materialService;
	
	//발주관리페이지 - 자재 목록
	@GetMapping("/materialOrder")
	public String getMaterialOrder(Model model) {
		model.addAttribute("materialLOTList", materialService.getMaterialLOTList());
		return "material/materialOrder";
	}
	
	@GetMapping("/material")
	public String getMaterial(Model model) {
		model.addAttribute("materialList", materialService.getMaterialList());
		return "material/materialList";
	}
	
	
	//자재검색
	@PostMapping("/materalSearch")
	@ResponseBody
	public List<MaterialLOTVO> materalSearch(@RequestParam(required = false) String rscNm){
		return materialService.materalSearch(rscNm);
	};
	
	//발주관리페이지
	@PostMapping("/MaterialDetail")
	@ResponseBody
	public List<MaterialOrderDetailVO> getMaterialOrderDetail(@Param("rscCd") MaterialOrderDetailVO materialOrderDetailVO) {
		List<MaterialOrderDetailVO> getMaterialOrderDetail = materialService.getMaterialOrderDetail(materialOrderDetailVO);
		return getMaterialOrderDetail;		
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
	
	//자재입고검사조회
	@GetMapping("/materialTestList")
	public String getMaterialTestList(Model model) {
		model.addAttribute("materialTestList", materialService.getMaterialTestList());
		return "material/materialTestList";
	}
	
	}

