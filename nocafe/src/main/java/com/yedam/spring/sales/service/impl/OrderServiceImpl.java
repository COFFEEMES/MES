package com.yedam.spring.sales.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.sales.mapper.OrderMapper;
import com.yedam.spring.sales.service.EdctsVO;
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
		return orderMapper.searchVend(vendNm);
	}

	//삭제버튼
	@Override
	public int deleteOrder(String str) {
		String[] array = str.split(",");
		int result = 0;
		for(int i=0; i<array.length; i++) {
			result += orderMapper.deleteOrder(array[i]);
		}
		
		if(result > 0) {
			return result;
		} else {
			return -1;
		}
	}

	//주문서 상세조회
	@Override
	public List<OrderVO> orderDetail(String orderNo) {
		return orderMapper.orderDetail(orderNo);
	}

	//주문서 디테일 수정 
	@Override
	public int saveOrder(List<OrderVO> orderVO) { 
		int result = 0;
		for(int i=0 ; i<orderVO.size(); i++) {
			System.out.println(orderVO.get(i));
			orderMapper.saveOrder(orderVO.get(i));
			result ++;
			
		}
		return result;
	}

	//제품명 가져오기
	@Override
	public List<EdctsVO> searchPro(String proNm) {
		return orderMapper.searchPro(proNm);
	}

	//주문서 수정
	@Override
	public int saveOrderTotal(List<OrderVO> orderVO) {
		int result = 0;
		for(int i=0 ; i<orderVO.size(); i++) {
			System.out.println(orderVO.get(i));
			orderMapper.saveOrderTotal(orderVO.get(i));
			result ++;
			
		}
		return result;
	}
	
}
