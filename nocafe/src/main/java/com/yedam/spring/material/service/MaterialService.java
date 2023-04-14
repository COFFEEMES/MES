package com.yedam.spring.material.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MaterialService {
	
	//자재조회
	public List<MaterialVO> getMaterialList();
	
	//자재검색
	public List<MaterialLOTVO> materalSearch(@Param("rscNm") String rscNm);
	
	// 발주조회
	public List<MaterialOrderVO> getMaterialOrderList();
	
	// 발주디테일
	public List<MaterialOrderDetailVO> getMaterialOrderDetail(MaterialOrderDetailVO materialOrderDetailVO);

	//자재입고조회
	public List<MaterialReceivingVO> getMaterialReceivingList();

	//자재출고조회
	public List<MaterialShippingVO> getMaterialShippingList();

	//자재LOT조회
	public List<MaterialLOTVO> getMaterialLOTList();
	
	//자재입고검사조회
	public List<MaterialTestDetailVO> getMaterialTestList();
}
