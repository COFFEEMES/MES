package com.yedam.spring.material.mapper;

import java.util.List;

import com.yedam.spring.material.service.MaterialOrderVO;


public interface MaterialMapper {

	//발주조회
	public List<MaterialOrderVO> selectMaterialOrderList();
}
