package com.yedam.spring.sales.service;

import java.util.List;

public interface MaterialWareService {

	//자재발주 목록
	public List<MaterialWareVO> reList(String start, String end, String vendNm);
	
	//자재발주 상세 목록
	public List<MaterialWareVO> detailList(String ordrCd);
	
	//검사 모달 
	public List<MaterialWareVO> testPoor();
	
	//사원 검색
	public List<MaterialWareVO> empList();
	
	//검사코드 만들기
	public String makeTr();
	
	//검사상세 저장
	public int saveDetail(List<MaterialWareVO> materialWareVO);
}
