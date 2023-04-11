package com.yedam.spring.sales.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.sales.mapper.ReceiveMapper;
import com.yedam.spring.sales.service.ReceiveService;
import com.yedam.spring.sales.service.ReceiveVO;

@Service
public class ReceiveServiceImpl  implements ReceiveService{
	
	@Autowired
	ReceiveMapper receiveMapper;
	
	@Override
	public List<ReceiveVO> testComplete(String start, String end) {
		return receiveMapper.testComplete(start, end);
	}

}
