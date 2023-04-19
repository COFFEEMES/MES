package com.yedam.spring.sales.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MaterialWareVO {
	//자재발주 테이블
	private String ordrCd; //발주번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ordrReqDt; //발주신청일
	private String vendCd; //거래처코드
	
	//자재발주 디테일
	private String rscCd; //자재코드
	private int ordrCnt; //발주량
	private int rmnCnt; //미입고잔량
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date paprdCmndDt; //납기요청일
	
	//자재테이블
	private String vendNm; //거래처명
	private String rscNm; //자재명
	private String rscSpec; // 자재규격
	private String rscUnit; //관리단위
	
	private String detailCode; //상세코드
	private String detailName; //상세코드명
	private String fullCode; //풀코드
	
	//자재입고검사
	private String inspCd; //검사코드
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date inspDt; //검사일자
	private String inspTstr; //검사자
	
	//자재입고검사상세
	private int inspCnt; //자재코드
	private int inspPassCnt; //합격수량
	private int inspFailCnt; //불량수량
	
	//사원
	private String empCode; //사원코드
	private String empName; //사원명
	
	private int inferCnt; //불량량
	
	//입고등록
	private String istCd; //입고코드
	private String istCnt; //입고수량
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date istDt; //입고일자
	
	//lot관리 
	private String rscLotCd; //lot번호
	private String rscInspCd; //검사코드
	private int lotCnt; //lot수량
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date expDt; //유통기한
	
	
}
