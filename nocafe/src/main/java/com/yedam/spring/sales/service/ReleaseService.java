package com.yedam.spring.sales.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ReleaseService {

	//진행중 주문서 조회
	public List<ReleaseVO> getOrder();
	
	//재고량 조회 모달창
	public List<ReleaseVO> getInven(String proNm);
	
	//출고조회
	public List<ReleaseVO> getOust();
	
	//등록버튼 누르면 
	public int reAdd(String orderNo, String orderDetailNo, 
					int orderCnt, String proLotNo, String proNm);
		
	
}
