package com.yedam.spring.manufacturing.performance.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.manufacturing.performance.service.DataForm;
import com.yedam.spring.manufacturing.performance.service.EqmVO;
import com.yedam.spring.manufacturing.performance.service.InstVO;
import com.yedam.spring.manufacturing.performance.service.PerformanceService;
import com.yedam.spring.manufacturing.performance.service.ProcessVO;

@Controller
public class PerformanceController {
	
	@Autowired
	PerformanceService service;
	
	@GetMapping("/performance")
	public String getAllInst(Model model) {
		model.addAttribute("instList", service.getAllInst());
		model.addAttribute("empList", service.getEmpList());
		return "manufacture/performance";
	}
	
	@PostMapping("/getPrOrderDetail")
	@ResponseBody
	public List<InstVO> getPrOrderDetail(InstVO instVO){
		return service.getPrOrderDetail(instVO);
	}
	
	@PostMapping("/getPrcsBom")
	@ResponseBody
	public List<ProcessVO> getPrcsBom(InstVO instVO){
		return service.getPrcsBom(instVO);
	}
	
	@PostMapping("/getPrcsEqm")
	@ResponseBody
	public List<EqmVO> getPrcsEqm(EqmVO eqmVO){
		return service.getPrcsEqm(eqmVO);
	}
	
	@PostMapping("/prcsStart")
	@ResponseBody
	public List<ProcessVO> prcsStart(ProcessVO processVO){
		service.prcsStart(processVO);
		InstVO instVO = new InstVO();
		instVO.setPrOrderCd(processVO.getPrOrderCd());
		instVO.setProCd(processVO.getProCd());
		return service.getPrcsBom(instVO);
	}
	
	@RequestMapping(value="prcsEnd", method={RequestMethod.POST})
	@ResponseBody
	public List<ProcessVO> prcsEnd(@RequestParam(value="dataForm[]") List<DataForm> dataForm, @RequestParam(value="gridData[]") List<ProcessVO> processVO){
		Map<String, String> map = new HashMap<>();
		for(DataForm temp : dataForm) {
			map.put(temp.getName(), temp.getValue());
		}
		System.out.println(map);
		System.out.println(processVO);
//		service.prcsEnd(processVO);
//		InstVO instVO = new InstVO();
//		instVO.setPrOrderCd(processVO.getPrOrderCd());
//		instVO.setProCd(processVO.getProCd());
//		return service.getPrcsBom(instVO);
		return null;
	}

}
