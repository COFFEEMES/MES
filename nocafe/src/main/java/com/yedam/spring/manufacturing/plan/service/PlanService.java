package com.yedam.spring.manufacturing.plan.service;

import java.util.HashMap;
import java.util.List;

import com.yedam.spring.sales.service.OrderVO;

public interface PlanService {
	
//	미등록 주문서 조회
	public List<OrderVO> getOrderlist();
	
//	주문서 번호로 생산할 제품, 총량 ,완제품 조회
	public List<PlanVO> getOrderPro(String[] orderListAry);

//	생산계획 코드 생성
	public PlanVO getPlanCd(PlanVO planVO);
	

	
//	bom코드 조회
	public List<PlanVO> getBomCd(PlanVO planVO);
	
	
//	불량률 조회
	public List<PlanVO> getInferPct(PlanVO planVO);
//-----------------------------------------------------------------------------------	사용중	
	
//	자재 조회
	public List<PlanVO> getRsc(HashMap<String,Object> map);
	
//	각 자재별 LOT 단위로 불러 오기
	public List<PlanVO> getRscDetail(PlanVO planVO);

	
}
