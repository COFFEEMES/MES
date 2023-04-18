package com.yedam.spring.manufacturing.direction.mapper;

import java.util.List;

import com.yedam.spring.manufacturing.direction.service.DirVO;

public interface DirMapper {

	public List<DirVO>getPlanList();
	
	public List<DirVO>getDataForGrid(String[] DirVO);
	
}
