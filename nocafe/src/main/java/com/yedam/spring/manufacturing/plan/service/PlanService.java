package com.yedam.spring.manufacturing.plan.service;

import java.util.List;

import com.yedam.spring.sales.service.OrderVO;

public interface PlanService {
	
//	미등록 주문서 조회
	public List<OrderVO> getOrderlist();
	
//	생산계획 코드 생성
	public PlanVO getPlanCd(PlanVO planVO);
	
//	총재고수량 조회
	public PlanVO getStock(PlanVO planVO);
}
