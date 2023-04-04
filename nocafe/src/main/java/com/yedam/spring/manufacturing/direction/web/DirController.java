package com.yedam.spring.manufacturing.direction.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DirController {
	@GetMapping("/dirList")
	public String dirList() {
		return "manufature/manufac";
	}
}
