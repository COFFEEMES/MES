package com.yedam.spring.manager.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.manager.service.BasicCodeVO;
import com.yedam.spring.manager.service.DetailCodeVO;
import com.yedam.spring.manager.service.ManagerService;

@Controller
public class ManagerController {

	@Autowired
	ManagerService managerService;
	
	@GetMapping("/basicCodeManage")
	public String getBasicCode(Model model) {
		model.addAttribute("basicCode", managerService.getAllBasicCode());
		return "manager/basicCode";
	}
	
	@PostMapping("/getDetailCode")
	@ResponseBody
	public List<DetailCodeVO> getDetailCode(DetailCodeVO detailCodeVO) {
		return managerService.getDetailCode(detailCodeVO);
	}
	
	@PostMapping("/upsertDcode")
	@ResponseBody
	public List<DetailCodeVO> upsertDetailCode(@RequestBody List<DetailCodeVO> list) {
		managerService.upsertDetailCode(list);
		return managerService.getDetailCode(list.get(0));
	}
	
	@PostMapping("/insertBcode")
	@ResponseBody
	public List<BasicCodeVO> insertBasicCode(BasicCodeVO basicCodeVO) {
		managerService.insertBasicCode(basicCodeVO);
		return managerService.getAllBasicCode();
	}
	
	@GetMapping("/vendManage")
	public String getAllvend(Model model) {
		model.addAttribute("vend", managerService.getAllVend());
		return "manager/vendManager";
	}

}
