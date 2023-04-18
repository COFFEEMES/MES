package com.yedam.spring.manufacturing.direction.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.manufacturing.direction.service.DirService;
import com.yedam.spring.manufacturing.direction.service.DirVO;

@Controller
public class DirController {

@Autowired
DirService dir;

@GetMapping("/mkDir")
public String dirCom() {
	return  "manufacture/direction";
};

@GetMapping("getPlanList")
@ResponseBody
public List<DirVO> getPlanList() {
	return dir.getPlanList();
};

@PostMapping("getDataForGrid")
@ResponseBody
public List<DirVO>getDataForGrid(@RequestBody String[] DirVO){
	return dir.getDataForGrid(DirVO);
}
	
}
