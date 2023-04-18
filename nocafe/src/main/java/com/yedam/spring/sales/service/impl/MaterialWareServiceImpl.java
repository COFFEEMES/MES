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

	@Override
	public List<MaterialWareVO> testPoor() {
		return materialWareMapper.testPoor();
	}

	/*
	 * @Override public int saveRsc(List<MaterialWareVO> materialWareVO) { int
	 * result = 0; for(int i=0; i<materialWareVO.size(); i++) { result +=
	 * materialWareMapper.saveRsc(materialWareVO.get(i)); } return result; }
	 */

	@Override
	public List<MaterialWareVO> empList() {
		return materialWareMapper.empList();
	}

	//전체저장
	@Override
	public int saveTotal(MaterialWareVO materialwareVO) {
		return materialWareMapper.saveTotal(materialwareVO);
	}



}
