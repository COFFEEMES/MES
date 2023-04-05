package com.yedam.spring.sales.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.sales.mapper.OrderMapper;
import com.yedam.spring.sales.service.OrderService;
import com.yedam.spring.sales.service.OrderVO;
import com.yedam.spring.sales.service.VendVO;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderMapper orderMapper;
	
	//주문서 조회
	@Override
	public List<OrderVO> searchOrder(String start, String end, String vendNm) {
		return orderMapper.searchOrder(start, end, vendNm);
	}
	
	//거래처 가져오기
	@Override
	public List<VendVO> searchVend(String vendNm) {
		// TODO Auto-generated method stub
		return null;
	}

	//삭제버튼
	@Override
	public void deleteOrder(String str) {
		String[] array = str.split(",");
		
		for(int i=0; i<array.length; i++) {
			orderMapper.deleteOrder(array[0]);
		}	
	}
	
}
