package com.yedam.spring.sales.service;

import java.util.List;

public interface OrderService {

	//전체조회
	public List<OrderVO> searchOrder(String start, String end, String vendNm);
	
	//거래처 목록 조회 모달창
	public List<VendVO> searchVend(String vendNm);
	
	//주문서 삭제
	public void deleteOrder(String str);



}
