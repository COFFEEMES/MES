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

	//주문서 조회
	@Override
	public List<ReleaseVO> getOrder() {
		return releaseMapper.getOrder();
	}

	//재고 모달창
	@Override
	public List<ReleaseVO> getInven(String proNm) {
		return releaseMapper.getInven(proNm);
	}

	//출고조회
	@Override
	public List<ReleaseVO> getOust() {
		return releaseMapper.getOust();
	}

	@Override
	public int reAdd(String orderNo, String orderDetailNo, int orderCnt, String proLotNo, String proNm) {
		return releaseMapper.reAdd(orderNo, orderDetailNo, orderCnt, proLotNo, proNm);
	}
	
}
