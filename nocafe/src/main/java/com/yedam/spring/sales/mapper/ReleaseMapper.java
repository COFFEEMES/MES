package com.yedam.spring.sales.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.spring.sales.service.ReleaseVO;

public interface ReleaseMapper {

	//진행중 주문서 조회
	public List<ReleaseVO> getOrder();
	
	//재고량 조회 모달창
	public List<ReleaseVO> getInven(@Param("proNm")String proNm);
	
}
