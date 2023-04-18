package com.yedam.spring.manufacturing.direction.service;

import java.util.List;

public interface DirService {

	public List<DirVO>getPlanList();
	
	public List<DirVO>getDataForGrid(String[] DirVO);
	
	
}
