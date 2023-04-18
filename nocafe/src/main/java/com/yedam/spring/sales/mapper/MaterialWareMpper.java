package com.yedam.spring.sales.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.spring.sales.service.LotVO;
import com.yedam.spring.sales.service.MaterialWareVO;

public interface MaterialWareMpper {
	
	//자재발주 목록
	public List<MaterialWareVO> reList(@Param("start")String start, @Param("end")String end, @Param("vendNm")String vendNm);
	
	//자재발주 상세목록
	public List<MaterialWareVO> detailList(@Param("ordrCd")String ordrCd);
	
	//검사 모달 
	public List<MaterialWareVO> testPoor();
	
	//저장--?
	//spublic int saveRsc(MaterialWareVO materialwareVO);
	
	//사원 검색
	public List<MaterialWareVO> empList();
	
	//자재입고 검사 저장
	public int saveTotal(MaterialWareVO materialwareVO);
}
