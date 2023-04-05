package com.yedam.spring.sales.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.spring.sales.order.service.OrderVO;
import com.yedam.spring.sales.order.service.VendVO;

public interface OrderMapper {

	//주문서 조회
	public List<OrderVO> searchOrder(@Param("start")String start, @Param("end")String end, @Param("vendNm")String vendNm);
	
	//거래처 목록 조회 모달창
	public List<VendVO> searchVend(@Param("vendNm")String vendNm);
	
	//주문서 삭제
	public void deleteOrder(@Param("str")String str);
}
