package com.yedam.spring.manufacturing.plan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.manufacturing.plan.mapper.PlanMapper;
import com.yedam.spring.manufacturing.plan.service.PlanService;
import com.yedam.spring.sales.order.service.OrderVO;

@Service
public class PlanServiceImpl implements PlanService {

	@Autowired
	PlanMapper planMapper;
	
	@Override
	public List<OrderVO> getOrderlist() {
		return planMapper.selectOrderList();
	}

}
