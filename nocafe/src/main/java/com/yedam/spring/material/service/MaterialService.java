package com.yedam.spring.material.service;

import java.util.List;

public interface MaterialService {
	
	//자재조회
	public List<MaterialVO> getMaterialList();
	
	// 발주조회
	public List<MaterialOrderVO> getMaterialOrderList();
	
	// 발주디테일
	public MaterialOrderDetailVO getMaterialOrderDetail(MaterialOrderDetailVO materialOrderDetailVO);

	//자재입고조회
	public List<MaterialReceivingVO> getMaterialReceivingList();

	//자재출고조회
	public List<MaterialShippingVO> getMaterialShippingList();

	//자재LOT조회
	public List<MaterialLOTVO> getMaterialLOTList();
	
	//자재입고검사조회
	public List<MaterialTestDetailVO> getMaterialTestList();
}
