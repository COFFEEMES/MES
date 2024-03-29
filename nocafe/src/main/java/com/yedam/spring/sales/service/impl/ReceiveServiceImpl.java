package com.yedam.spring.sales.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.sales.mapper.ReceiveMapper;
import com.yedam.spring.sales.service.ReceiveService;
import com.yedam.spring.sales.service.ReceiveVO;
import com.yedam.spring.sales.service.ReleaseVO;

@Service
public class ReceiveServiceImpl  implements ReceiveService{
	
	@Autowired
	ReceiveMapper receiveMapper;
	
	@Override
	//String start, String end
	public List<ReceiveVO> testComplete() {
		return receiveMapper.testComplete();
	}

	@Override
	public int signUp(List<ReceiveVO> receiveVO) {
		// 제품입고번호 생성하는select문 만들고 
		String num = receiveMapper.number();
		int result = 0;
		for(int i=0; i<receiveVO.size(); i++) {
			//반환된 값을 receiveVO.get(i).set제품입고번호
			receiveVO.get(i).setProIstNo(num);
			receiveMapper.signUp(receiveVO.get(i));
			result++;
		}
		return result;
		
	}

	@Override
	public List<ReceiveVO> search() {
		return receiveMapper.search();
	}

	//제품입고번호 생성
	@Override
	public String number() {
		return receiveMapper.number();
	}

	//입출고 조회 페이지 -> 입고
	@Override
	public List<ReceiveVO> reCheck(String start, String end, String proNm) {
		return receiveMapper.reCheck(start, end, proNm);
	}


	//입출고 조회 페이지 -> 출고
	@Override
	public List<ReleaseVO> releaseCheck(String start, String end, String proNm) {
		return receiveMapper.releaseCheck(start, end, proNm);
	}
}
