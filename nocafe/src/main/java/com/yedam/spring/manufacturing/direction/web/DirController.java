package com.yedam.spring.manufacturing.direction.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.spring.manufacturing.direction.service.DirService;

@Controller
public class DirController {

@Autowired
DirService dir;

@GetMapping("/mkDir")
public String dirCom() {
	return  "manufacture/direction";
};

	
}
