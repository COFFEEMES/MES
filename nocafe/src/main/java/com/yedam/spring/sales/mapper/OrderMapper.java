package com.yedam.spring.sales.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.spring.sales.service.EdctsVO;
import com.yedam.spring.sales.service.OrderVO;
import com.yedam.spring.sales.service.VendVO;

public interface OrderMapper {

	//주문서 조회
	public List<OrderVO> searchOrder(@Param("start")String start, @Param("end")String end, @Param("vendNm")String vendNm);
	
	//거래처 목록 조회 모달창
	public List<VendVO> searchVend(@Param("vendNm")String vendNm);
	
	//주문서 삭제
	public int deleteOrder(@Param("str")String str);
	
	//주문서 상세 목록 모달
	public List<OrderVO> orderDetail(@Param("orderNo")String orderNo);
	
	//주문서 디테일 수정입력
	public int saveOrder(OrderVO orderVO);
	
	//제품명 검색 모달창 
	public List<EdctsVO> searchPro(@Param("proNm")String proNm);
	
	//주문서 수정입력
	public int saveOrderTotal(OrderVO orderVO);
}
