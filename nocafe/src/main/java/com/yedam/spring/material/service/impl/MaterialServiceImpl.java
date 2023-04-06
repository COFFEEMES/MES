package com.yedam.spring.material.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.material.mapper.MaterialMapper;
import com.yedam.spring.material.service.MaterialLOTVO;
import com.yedam.spring.material.service.MaterialOrderDetailVO;
import com.yedam.spring.material.service.MaterialOrderVO;
import com.yedam.spring.material.service.MaterialReceivingVO;
import com.yedam.spring.material.service.MaterialService;
import com.yedam.spring.material.service.MaterialShippingVO;
import com.yedam.spring.material.service.MaterialTestDetailVO;
import com.yedam.spring.material.service.MaterialVO;

@Service
public class MaterialServiceImpl implements MaterialService {

	@Autowired
	MaterialMapper materialMapper;
	
	//자재조회
	@Override
	public List<MaterialVO> getMaterialList() {
		return materialMapper.selectMaterialList();
	}

	//발주조회
	@Override
	public List<MaterialOrderVO> getMaterialOrderList() {
		return materialMapper.selectMaterialOrderList();
	}
	
	//발주디테일
	@Override
	public MaterialOrderDetailVO getMaterialOrderDetail(MaterialOrderDetailVO materialOrderDetailVO) {
		return materialMapper.getMaterialOrderDetail(materialOrderDetailVO);
	}

	//자재입고조회
	@Override
	public List<MaterialReceivingVO> getMaterialReceivingList() {
		return materialMapper.selectMaterialReceivingList();
	}

	//자재출고조회
	@Override
	public List<MaterialShippingVO> getMaterialShippingList() {
		return materialMapper.selectMaterialShippingList();
	}
	//자재LOT조회
	@Override
	public List<MaterialLOTVO> getMaterialLOTList() {
		return materialMapper.selectMaterialLOTList();
	}
	//자재입고검사조회
	@Override
	public List<MaterialTestDetailVO> getMaterialTestList() {
		return materialMapper.selectMaterialTestList();
	}




}
