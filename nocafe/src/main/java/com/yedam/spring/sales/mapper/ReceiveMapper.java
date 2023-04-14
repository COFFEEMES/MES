package com.yedam.spring.sales.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.spring.sales.service.OrderVO;
import com.yedam.spring.sales.service.ReceiveVO;

public interface ReceiveMapper {

	//검사완료 제품 조회 모달창
	//@Param("start")String start, @Param("end")String end
	public List<ReceiveVO> testComplete();
	
	//입고등록
	public int signUp(ReceiveVO receiveVO);
	
	//입고조회
	public List<ReceiveVO> search();

	//주문번호 만들기
	public String number();
	
	//입고조회 페이지
	public List<ReceiveVO> reCheck(@Param("start")String start, @Param("end")String end, @Param("proNm")String proNm);
}
