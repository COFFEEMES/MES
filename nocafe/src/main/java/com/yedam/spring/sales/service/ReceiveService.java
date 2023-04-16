package com.yedam.spring.sales.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ReceiveService {

	//검사완료 제품 모달창 조회
	//String start, String end
	public List<ReceiveVO> testComplete();
	
	//입고등록
	public int signUp(List<ReceiveVO> receiveVO);
	
	//입고조회
	public List<ReceiveVO> search();
	
	//주문번호 만들기
	public String number();
	
	//입출고 조회 페이지 -> 입고
	public List<ReceiveVO> reCheck(String start, String end, String proNm);
	
	//입출고 조회 페이지 -> 출고
	public List<ReleaseVO> releaseCheck(String start, String end, String proNm);
}
