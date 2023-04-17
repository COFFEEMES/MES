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
	public List<MaterialWareVO> reList(String start, String end, String vendNm) {
		return materialWareMapper.reList(start, end, vendNm);
	}

	@Override
	public List<MaterialWareVO> detailList(String ordrCd) {
		return materialWareMapper.detailList(ordrCd);
	}

}
