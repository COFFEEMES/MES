package com.yedam.spring.material.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MaterialService {
	
	//자재조회
	public List<MaterialVO> getMaterialList();
	
	//자재검색
	public List<MaterialLOTVO> materalSearch(@Param("rscNm") String rscNm);
	
	//발주검색
	public List<MaterialOrderVO> materalOrderSearch(@Param("vendNm") String vendNm);
	
	//발주코드
	public List<MaterialOrderVO> materialOrderCd(MaterialOrderVO materialOrderVO);
	
	//발주조회페이지 디테일 모달
	public List<MaterialOrderDetailVO> orderDetailList (MaterialOrderDetailVO materialOrderDetailVO);
	
	//발주조회페이지 수정
	public void materialOrderUpdate (List<MaterialOrderDetailVO> materialOrderUpdate);
	
	// 발주조회
	public List<MaterialOrderVO> getMaterialOrderList();
	
	// 발주디테일
	public List<MaterialOrderDetailVO> getMaterialOrderDetail(MaterialOrderDetailVO materialOrderDetailVO);

	//자재LOT조회
	public List<MaterialLOTVO> getMaterialLOTList();
	
	//자재입고검사조회
	public List<MaterialTestDetailVO> getMaterialTestList();
}
