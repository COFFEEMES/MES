package com.yedam.spring.manufacturing.direction.service.Impl;

import java.util.ArrayList;
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
	public List<DirVO> getDataForGrid(String dirVO) {
		return dirMap.getDataForGrid(dirVO);
	}


	
	@Override
	public List<DirVO> getPrcsEndcnt(List<DirVO>dirVO) {
		
		List<DirVO> result = new ArrayList<>() ;
		
		for(int i = 0; i<dirVO.size();i++) {
			 result.add(dirMap.getPrcsEndCnt(dirVO.get(i)));
		}
		return result;
	}


	@Override
	public List<List<DirVO>> getDataForSecGrid(List<DirVO> dirVO) {
		List<List<DirVO>>result = new ArrayList<>();
		
		for(int i = 0; i<dirVO.size();i++) {
			  result.add(dirMap.getDataForSecGrid(dirVO.get(i)));              
		}
		
		return result;
	}


	@Override
	public void insertAll(List<DirVO> dirVO) {
		for(int i=0;i<dirVO.size();i++) {
			
			dirMap.insertAll(dirVO.get(i));
		}
	}
	
	
}
