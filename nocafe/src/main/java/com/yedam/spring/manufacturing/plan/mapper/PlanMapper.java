package com.yedam.spring.manufacturing.plan.mapper;

import java.util.List;

import com.yedam.spring.sales.order.service.OrderVO;

public interface PlanMapper {
	
//	미계획 주문서 조회
	public List<OrderVO> selectOrderList();
	
	
	
}
