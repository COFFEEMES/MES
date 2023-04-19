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
	
	//사원 검색
	public List<MaterialWareVO> empList();
	
	//검사코드 만들기
	public String makeCd();
	
	//검사상세 저장
	public int saveDetail(MaterialWareVO materialWareVO);
	
	//전체 검사 저장
	public int saveTotal(MaterialWareVO materialWareVO);
	
	//발주테이블에 검사여부 1로 UPDATE
	public int rscUp(String ordrCd);
	
	//불량
	public int errorData(MaterialWareVO materialWareVO);
	
	
	//입고등록 페이지 시작
	//검사완료 조회 
	public  List<MaterialWareVO> comSearch();
	
	//입고완료 조회
	public  List<MaterialWareVO> comInput();
	
	//입고코드 만들기
	public String istCd();
	
	//입고테이블에 insert
	public int istInput(MaterialWareVO materialWareVO);
	
	//LOT번호 생성
	public String lotNm(String rscCd);
	
	//자재 LOT테이블 insert
	public int lotInput(MaterialWareVO materialWareVO);
}
