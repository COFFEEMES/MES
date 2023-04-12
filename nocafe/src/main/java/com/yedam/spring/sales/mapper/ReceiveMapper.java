package com.yedam.spring.sales.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.spring.sales.service.OrderVO;
import com.yedam.spring.sales.service.ReceiveVO;

public interface ReceiveMapper {

	//검사완료 제품 조회 모달창
	public List<ReceiveVO> testComplete(@Param("start")String start, @Param("end")String end);
	
	//입고등록
	public int signUp(ReceiveVO receiveVO);
	
	//입고조회
	public List<ReceiveVO> search();
}
