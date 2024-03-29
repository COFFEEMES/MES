package com.yedam.spring.manufacturing.plan.mapper;

import java.util.HashMap;
import java.util.List;

import com.yedam.spring.manufacturing.plan.service.PlanVO;
import com.yedam.spring.sales.service.OrderVO;

public interface PlanMapper {
	
//	미계획 주문서 조회
	public List<OrderVO> selectOrderList();
	
//	주문서 번호로 생산할 제품, 총량 ,완제품 조회
	public List<PlanVO> getOrderPro(String[] orderListAry);
	
//	생산계획 코드 생성
	public PlanVO getPlanCd(PlanVO planVO);
	

	
//	bom 통해서 필요 공정 호출 
	public List<PlanVO> getBomCd(PlanVO planVO);
	


//	불량률 불러오기 
	public List<PlanVO> getInferPct(PlanVO planVO);
	
//	자재 수량 불러오기
	public List<PlanVO> getRscNeed(HashMap<String,Object> map);
	
//	각 자재별 LOT 단위로 불러 오기
	public List<PlanVO> getRscDetil(PlanVO planVO);
	
//	자재 이름으로 완제품이름 받아오기
	public List<PlanVO> getProNm(PlanVO planVO);
	//-----------------------------------------------------------------------------------	사용중
//	public List<String> getProCd(Map<String,Object>map);
	
	public int insertTest(PlanVO plan);
	
	public int updateTest(PlanVO obj);
	
	public int insertHeader(PlanVO plan);
}