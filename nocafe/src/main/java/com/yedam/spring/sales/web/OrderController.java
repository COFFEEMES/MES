package com.yedam.spring.sales.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.spring.sales.service.EdctsVO;
import com.yedam.spring.sales.service.OrderService;
import com.yedam.spring.sales.service.OrderVO;
import com.yedam.spring.sales.service.VendVO;

@Controller
public class OrderController {

	//주문서 관리 
	
	@Autowired
	OrderService orderService;
	
	//주문서 조회 페이지
	@GetMapping("/orderList")
	public String orderList() {
		return "sales/order";
	}
	
	//주문서 조회 프로세스
	@PostMapping("/orderSearch")
	@ResponseBody
	public List<OrderVO> orderSearch(@RequestParam(required = false) String start, @RequestParam(required = false)  String end, @RequestParam(required = false)  String vendNm) {
		return orderService.searchOrder(start, end, vendNm);
	}
	
	//거래처 조회 모달창
	@PostMapping("/vendSearch")
	@ResponseBody
	public List<VendVO> vendSearch(@RequestParam(required = false) String vendNm) {
		return orderService.searchVend(vendNm);
	}
	
	
	//주문서 삭제 
	@PostMapping("/orderDelete") 
	@ResponseBody
	 public int orderDelete(@RequestParam String str){
		 return orderService.deleteOrder(str);
		 
	 }
	
	//주문서 상세 조회 모달창
	@PostMapping("/orderDetail")
	@ResponseBody
	public List<OrderVO> orderDetail(@RequestParam String orderNo) {
		return orderService.orderDetail(orderNo);
	}
	
	//주문서 디테일 수정
	@PostMapping("/saveOrder")
	@ResponseBody
	public int saveOrder(@RequestBody List<OrderVO> orderVO) {
		//System.out.println(orderVO);
		return orderService.saveOrder(orderVO);
	} 
	
	//제품명 조회 모달창
	@PostMapping("/proSearch")
	@ResponseBody
	public List<EdctsVO> proSearch(@RequestParam(required = false) String proNm) {
		return orderService.searchPro(proNm);
		}
	
	//주문서 전체수정
		@PostMapping("/saveOrderTotal")
		@ResponseBody
		public int saveOrderTotal(@RequestBody List<OrderVO> orderVO) {
			//System.out.println(orderVO);
			return orderService.saveOrderTotal(orderVO);
		} 
		
}
