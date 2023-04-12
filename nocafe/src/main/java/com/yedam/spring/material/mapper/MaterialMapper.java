package com.yedam.spring.material.mapper;

import java.util.List;

import com.yedam.spring.material.service.MaterialLOTVO;
import com.yedam.spring.material.service.MaterialOrderDetailVO;
import com.yedam.spring.material.service.MaterialOrderVO;
import com.yedam.spring.material.service.MaterialReceivingVO;
import com.yedam.spring.material.service.MaterialShippingVO;
import com.yedam.spring.material.service.MaterialTestDetailVO;
import com.yedam.spring.material.service.MaterialVO;


public interface MaterialMapper {
	
	//자재관리
	public List<MaterialVO> selectMaterialList();
	
	//발주디테일
	public MaterialOrderDetailVO getMaterialOrderDetail(MaterialOrderDetailVO materialOrderDetailVO);
	
	//발주조회
	public List<MaterialOrderVO> selectMaterialOrderList();
	
	//자재입고조회
	public List<MaterialReceivingVO> selectMaterialReceivingList();
	
	//자재출고조회
	public List<MaterialShippingVO> selectMaterialShippingList();

	//자재LOT조회
	public List<MaterialLOTVO> selectMaterialLOTList();

	//자재입고검사조회
	public List<MaterialTestDetailVO> selectMaterialTestList();

}
