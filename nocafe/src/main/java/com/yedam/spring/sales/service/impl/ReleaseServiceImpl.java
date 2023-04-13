package com.yedam.spring.sales.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.sales.mapper.ReleaseMapper;
import com.yedam.spring.sales.service.ReleaseService;
import com.yedam.spring.sales.service.ReleaseVO;

@Service
public class ReleaseServiceImpl implements ReleaseService {

	@Autowired
	ReleaseMapper releaseMapper;

	@Override
	public List<ReleaseVO> getOrder() {
		return releaseMapper.getOrder();
	}

	@Override
	public List<ReleaseVO> getInven(String proNm) {
		return releaseMapper.getInven(proNm);
	}
	
}
