package com.yedam.spring.manufacturing.plan.service;

import java.util.List;

import com.yedam.spring.sales.service.OrderVO;

public interface PlanService {
	
//	미등록 주문서 조회
	public List<OrderVO> getOrderlist();
	
}
