package com.yedam.spring.sales.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface OrderService {

	//전체조회
	public List<OrderVO> searchOrder(String start, String end, String vendNm);
	
	//거래처 목록 조회 모달창
	public List<VendVO> searchVend(String vendNm);
	
	//주문서 삭제
	public int deleteOrder(String str);
	
	//주문서 상세 목록 모달
	public List<OrderVO> orderDetail(String orderNo);

	//주문서 디테일 수정
	public int saveOrder(List<OrderVO> orderVO);
	
	//제품명 목록 조회 모달창
	public List<EdctsVO> searchPro(String proNm);
	
	//주문서 전체 수정
	public int saveOrderTotal(List<OrderVO> orderVO);

}
