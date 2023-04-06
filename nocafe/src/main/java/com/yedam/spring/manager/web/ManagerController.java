package com.yedam.spring.manager.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

}
