package com.yedam.spring.material.web;

import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.material.service.MaterialLOTVO;
import com.yedam.spring.material.service.MaterialOrderDetailVO;
import com.yedam.spring.material.service.MaterialOrderVO;
import com.yedam.spring.material.service.MaterialService;
import com.yedam.spring.material.service.MaterialVO;

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
	
	@GetMapping("rscCOrdrList")
	@ResponseBody
	public List<MaterialLOTVO> rscOrdrList(MaterialLOTVO materialLOTVO){
		List<MaterialLOTVO> rscCOrdrList = materialService.rscCOrdrList(materialLOTVO);
		return rscCOrdrList;
	}
	
	//발주관리페이지 - 발주코드
	@PostMapping("/materialOrderCd")
	@ResponseBody
	public List<MaterialOrderVO> rscOrdrCd(MaterialOrderVO materialOrderVO) {
		List<MaterialOrderVO> materialOrderCd = materialService.materialOrderCd(materialOrderVO);
		return materialOrderCd;		
	}
	
	//자재검색
	@PostMapping("/materalSearch")
	@ResponseBody
	public List<MaterialLOTVO> materalSearch(@RequestParam(required = false) String rscNm){
		return materialService.materalSearch(rscNm);
	};
	
	//발주검색
	@PostMapping("/materalOrderSearch")
	@ResponseBody
	public List<MaterialOrderVO> materalOrderSearch(@RequestParam(required = false) String vendNm){
		return materialService.materalOrderSearch(vendNm);
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
	
	//발주조회디테일
	@PostMapping("/orderDetailList")
	@ResponseBody
	public List<MaterialOrderDetailVO> orderDetailList (MaterialOrderDetailVO materialOrderDetailVO){
		return materialService.orderDetailList(materialOrderDetailVO);
	}
	
	//발주 수정
	@PostMapping("/materialOrderUpdate")
	@ResponseBody
	public List<MaterialOrderDetailVO> materialOrderUpdate(@RequestBody List<MaterialOrderDetailVO> materialOrderList, MaterialOrderDetailVO materialOrderDetailVO){
		materialService.materialOrderUpdate(materialOrderList);
		return materialOrderList;
	}
	
	
	
	//자재입고검사조회
	@GetMapping("/materialTestList")
	public String getMaterialTestList(Model model) {
		model.addAttribute("materialTestList", materialService.getMaterialTestList());
		return "material/materialTestList";
	}
	
	
    @RequestMapping("getResources")
    @ResponseBody
    public List<MaterialVO> getResources(@ModelAttribute MaterialVO materialVO) {
        return materialService.getResources(materialVO);
    }
	
	@PostMapping("materialOrderInsert")
	@ResponseBody
	public List<MaterialOrderVO> rscOrdrInsert(@RequestBody List<MaterialOrderVO> OrdrList, MaterialOrderVO vo){
		materialService.rscOrdrInsert(OrdrList);
		return OrdrList;
	}
	
	}

