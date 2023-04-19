package com.yedam.spring.manufacturing.direction.service;

import java.util.List;

public interface DirService {

	public List<DirVO>getPlanList();
	
	public List<DirVO>getDataForGrid(String dirVO);
	
	public List<DirVO>getPrcsEndcnt(List<DirVO>dirVO);
	
	public List<List<DirVO>>getDataForSecGrid(List<DirVO>dirVO);
	
	public void insertAll(List<DirVO>dirVO);
}
