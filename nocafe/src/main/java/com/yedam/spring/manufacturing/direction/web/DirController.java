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
public List<DirVO>getDataForGrid(@RequestBody String dirVO){
	 System.out.println(dirVO);
	 List<DirVO>origin  =  dir.getDataForGrid(dirVO);
	 System.out.println(origin);
	 List<DirVO>afterProcs = dir.getPrcsEndcnt(origin);
	 for(int i=0;i<origin.size();i++) {
		 origin.get(i).setPlanCnt(origin.get(i).getPlanCnt()-afterProcs.get(i).getOutput());
	 }
	
	 return origin;
}

@PostMapping("getDataForSecGrid")
@ResponseBody
public List<List<DirVO>> getDataForSecGrid(@RequestBody List<DirVO> dirVO){
	return dir.getDataForSecGrid(dirVO);
}

@PostMapping("insertAll")
@ResponseBody
public void insertAll (@RequestBody List<List<DirVO>>dirVO) {
	for(int i=0;i< dirVO.size()  ;i++) {
		dir.insertAll(dirVO.get(i));
	}
	
}


}
