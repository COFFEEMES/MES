package com.yedam.spring.sales.order.service;

import java.util.List;

public interface OrderService {

	//전체조회
	public List<OrderVO> searchOrder(OrderVO vo);
}
