package com.yedam.spring.sales.service;

import java.util.List;

public interface ReceiveService {

	//검사완료 제품 모달창 조회
	public List<ReceiveVO> testComplete(String start, String end);
}
