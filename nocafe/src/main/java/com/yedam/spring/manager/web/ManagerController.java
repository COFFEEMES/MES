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
import com.yedam.spring.manager.service.BomVO;
import com.yedam.spring.manager.service.DetailCodeVO;
import com.yedam.spring.manager.service.ManagerService;
import com.yedam.spring.manager.service.RscVO;
import com.yedam.spring.sales.service.EdctsVO;
import com.yedam.spring.sales.service.VendVO;

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
	public String getAllVend(Model model) {
		model.addAttribute("vendList", managerService.getAllVend());
		model.addAttribute("empList", managerService.getEmpList());
		return "manager/vendManager";
	}
	
	@PostMapping("/mergeVend")
	@ResponseBody
	public List<VendVO> mergeVend(VendVO vendVO){
		managerService.mergeVend(vendVO);
		return managerService.getAllVend();
	}
	
	@PostMapping("/delVend")
	@ResponseBody
	public List<VendVO> delVend(VendVO vendVO){
		managerService.delVend(vendVO);
		return managerService.getAllVend();
	}
	
	@GetMapping("/rscManage")
	public String getAllMat(Model model) {
		model.addAttribute("matList", managerService.getAllMat());
		model.addAttribute("matType", managerService.getMatType());
		return "manager/rscManager";
	}
	
	@PostMapping("/getRsc")
	@ResponseBody
	public RscVO getRsc(RscVO rscVO){
		return managerService.getRsc(rscVO);
	}
	
	@PostMapping("/mergeRsc")
	@ResponseBody
	public List<DetailCodeVO> mergeRsc(RscVO rscVO){
		managerService.mergeRsc(rscVO);
		return managerService.getAllMat();
	}
	
	@PostMapping("/delRsc")
	@ResponseBody
	public List<DetailCodeVO> delRsc(RscVO rscVO){
		managerService.delRsc(rscVO);
		return managerService.getAllMat();
	}
	
	@GetMapping("/bomManage")
	public String getAllPro(Model model) {
		model.addAttribute("proList", managerService.getAllPro());
		return "manager/BOM";
	}
	
	@PostMapping("/getPro")
	@ResponseBody
	public EdctsVO getPro(EdctsVO edctsVO) {
		return managerService.getPro(edctsVO);
	}
	
	@PostMapping("/mergePro")
	@ResponseBody
	public List<DetailCodeVO> mergePro(EdctsVO edctsVO){
		managerService.mergePro(edctsVO);
		return managerService.getAllPro();
	}
	
	@PostMapping("/delPro")
	@ResponseBody
	public List<DetailCodeVO> delPro(EdctsVO edctsVO){
		managerService.delPro(edctsVO);
		return managerService.getAllPro();
	}
	
	@PostMapping("/getPrcs")
	@ResponseBody
	public List<BomVO> getPrcs(EdctsVO edctsVO){
		return managerService.getPrcs(edctsVO);
	}

}
