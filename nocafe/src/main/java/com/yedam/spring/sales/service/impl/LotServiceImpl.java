package com.yedam.spring.sales.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.sales.mapper.LotMapper;
import com.yedam.spring.sales.service.LotService;
import com.yedam.spring.sales.service.LotVO;

@Service
public class LotServiceImpl implements LotService{

	@Autowired
	LotMapper lotMapper;
	
	@Override
	public List<LotVO> lotList(String start, String end, String proNm) {
		return lotMapper.lotList(start, end, proNm);
	}

	@Override
	public int deleteLot(String str) {
		String[] array = str.split(",");
		int result = 0;
		for(int i=0; i<array.length; i++) {
			result += lotMapper.deleteLot(array[i]);
		}
		if(result > 0) {
			return result;
		} else {
			return -1;
		}	
	}
}
