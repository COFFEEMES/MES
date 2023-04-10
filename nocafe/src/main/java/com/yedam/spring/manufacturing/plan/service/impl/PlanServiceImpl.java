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

	@Override
	public PlanVO getStock(PlanVO planVO) {
		return planMapper.getLotRestore(planVO);
	}

	@Override
	public List<PlanVO> getBomCd(PlanVO planVO) {
		return planMapper.getBomCd(planVO);
	}

	@Override
	public List<PlanVO> getInferPct(PlanVO planVO) {
		return planMapper.getInferPct(planVO);
	}

	@Override
	public List<PlanVO> getRsc(PlanVO planVO) {
		return planMapper.getRscNeed(planVO);
	}

	@Override
	public List<PlanVO> getRscDetail(PlanVO planVO) {
		return planMapper.getRscDetil(planVO);
	}

	
}
