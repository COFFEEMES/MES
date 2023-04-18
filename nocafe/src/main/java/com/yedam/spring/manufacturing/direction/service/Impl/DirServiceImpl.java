package com.yedam.spring.manufacturing.direction.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.manufacturing.direction.mapper.DirMapper;
import com.yedam.spring.manufacturing.direction.service.DirService;
import com.yedam.spring.manufacturing.direction.service.DirVO;

@Service
public class DirServiceImpl implements DirService {

	@Autowired
	DirMapper dirMap;
	
	
	@Override
	public List<DirVO>getPlanList() {
		return dirMap.getPlanList() ;
	}


	@Override
	public List<DirVO> getDataForGrid(String[] DirVO) {
		return dirMap.getDataForGrid(DirVO);
	}
	
	
}
