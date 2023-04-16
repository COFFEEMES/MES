package com.yedam.spring.sales.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.spring.sales.service.LotVO;

public interface LotMapper {
	
	//조회
	public List<LotVO> lotList(@Param("start")String start, @Param("end")String end, @Param("proNm")String proNm);
		
	// 삭제
	public int deleteLot(@Param("str")String str);
	
	
}
