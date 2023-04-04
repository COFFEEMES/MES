package com.yedam.spring.sales.order.mapper;

import java.util.List;

import com.yedam.spring.sales.order.service.OrderVO;

public interface OrderMapper {

	//주문서 조회
	public List<OrderVO> searchOrder(OrderVO vo);
	
}
