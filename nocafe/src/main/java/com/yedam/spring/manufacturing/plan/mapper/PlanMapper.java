package com.yedam.spring.manufacturing.plan.mapper;

import java.util.List;

import com.yedam.spring.manufacturing.plan.service.PlanVO;
import com.yedam.spring.sales.service.OrderVO;

public interface PlanMapper {
	
//	미계획 주문서 조회
	public List<OrderVO> selectOrderList();
	
//	생산계획 코드 생성
	public PlanVO getPlanCd(PlanVO planVO);
	
//	bom 통해서 필요 자재 호출 
	public PlanVO getBomCd(PlanVO planVO);
	
}
