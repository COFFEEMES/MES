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

	@Override
	public List<MaterialWareVO> empList() {
		return materialWareMapper.empList();
	}

	@Override
	public String makeTr() {
		return materialWareMapper.makeCd();
	}

	@Override
	public int saveDetail(List<MaterialWareVO> materialWareVO) {
		String cd = materialWareMapper.makeCd(); //검사코드 생성
		int result = 0;
		for(int i=0; i<materialWareVO.size(); i++) {
			materialWareVO.get(i).setInspCd(cd);
			result += materialWareMapper.saveDetail(materialWareVO.get(i));	
		}
		return result;
	}


}
