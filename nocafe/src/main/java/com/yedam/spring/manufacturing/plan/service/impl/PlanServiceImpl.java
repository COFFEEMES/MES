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
//	주문서 불러오기
	@Override
	public List<OrderVO> getOrderlist() {
		return planMapper.selectOrderList();
	}
//	주문서 번호로 생산할 제품, 총량 ,완제품 조회
	@Override
	public List<PlanVO> getOrderPro(String[] orderListAry) {
		return planMapper.getOrderPro(orderListAry);
	}
//	계획 코드 생성
	@Override
	public PlanVO getPlanCd(PlanVO planVO) {
		System.out.println(planVO);
		return planMapper.getPlanCd(planVO);
	}
//-----------------------------------------------------------------------------------	사용중
	



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
