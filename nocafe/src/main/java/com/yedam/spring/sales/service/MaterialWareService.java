package com.yedam.spring.sales.service;

import java.util.List;

public interface MaterialWareService {

	//자재발주 목록
	public List<MaterialWareVO> reList(String start, String end, String vendNm);
	
	//자재발주 상세 목록
	public List<MaterialWareVO> detailList(String ordrCd);
}
