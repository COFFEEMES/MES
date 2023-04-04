package com.yedam.spring.sales.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.sales.order.mapper.OrderMapper;
import com.yedam.spring.sales.order.service.OrderService;
import com.yedam.spring.sales.order.service.OrderVO;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderMapper orderMapper;

	@Override
	public List<OrderVO> searchOrder(OrderVO vo) {
		return orderMapper.searchOrder(vo);
	}
	
	
}
