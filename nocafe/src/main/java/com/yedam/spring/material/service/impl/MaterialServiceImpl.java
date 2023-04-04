package com.yedam.spring.material.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.material.mapper.MaterialMapper;
import com.yedam.spring.material.service.MaterialOrderVO;
import com.yedam.spring.material.service.MaterialService;

@Service
public class MaterialServiceImpl implements MaterialService {

	@Autowired
	MaterialMapper materialMapper;
	
	@Override
	public List<MaterialOrderVO> getMaterialOrderList() {
		return materialMapper.selectMaterialOrderList();
	}

}
