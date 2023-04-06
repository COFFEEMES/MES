package com.yedam.spring.manufacturing.plan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.manufacturing.plan.mapper.PlanMapper;
import com.yedam.spring.manufacturing.plan.service.PlanService;
import com.yedam.spring.manufacturing.plan.service.PlanVO;
import com.yedam.spring.sales.service.OrderVO;

@Service
public class PlanServiceImpl implements PlanService {

	@Autowired
	PlanMapper planMapper;
	
	@Override
	public List<OrderVO> getOrderlist() {
		return planMapper.selectOrderList();
	}

	@Override
	public PlanVO getPlanCd(PlanVO planVO) {
		System.out.println(planVO);
		return planMapper.getPlanCd(planVO);
	}

	
}
