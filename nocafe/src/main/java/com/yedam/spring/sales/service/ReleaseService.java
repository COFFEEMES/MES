package com.yedam.spring.sales.service;

import java.util.List;

public interface ReleaseService {

	//진행중 주문서 조회
	public List<ReleaseVO> getOrder();
	
	//재고량 조회 모달창
	public List<ReleaseVO> getInven(String proNm);
	
}
