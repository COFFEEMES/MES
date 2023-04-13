package com.yedam.spring.sales.service;

import java.util.List;

public interface ReceiveService {

	//검사완료 제품 모달창 조회
	public List<ReceiveVO> testComplete(String start, String end);
	
	//입고등록
	public int signUp(List<ReceiveVO> receiveVO);
	
	//입고조회
	public List<ReceiveVO> search();
	
	//주문번호 만들기
	public String number();
}
