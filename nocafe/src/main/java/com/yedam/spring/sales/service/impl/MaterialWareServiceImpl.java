package com.yedam.spring.sales.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.sales.mapper.MaterialWareMpper;
import com.yedam.spring.sales.service.MaterialWareService;
import com.yedam.spring.sales.service.MaterialWareVO;

@Service
public class MaterialWareServiceImpl implements MaterialWareService {

	@Autowired
	MaterialWareMpper materialWareMapper;
	
	@Override
	public List<MaterialWareVO> reList(String start, String end, String proNm) {
		return materialWareMapper.reList(start, end, proNm);
	}

}
