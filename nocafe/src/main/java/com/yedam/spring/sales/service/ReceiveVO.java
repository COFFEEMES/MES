package com.yedam.spring.sales.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReceiveVO {
	
	//제품 LOT 재고 DB
	private String proLotNo; //제품 LOT 번호
	private String proIstNo; //제품 입고 번호
	private String proCd; // 제품코드
	private int lotCnt; //제품LOT수량
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date proExp; //유통기한
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date proWdt; //제조일자
	
	//제품입고 DB
	//제품입고번호
	//제품코드
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date proIstDt;//제품입고일자
	private int proIstCnt;//제품입고수량
	
	//검사완료제품 모달창에 담을 변수
	//제품코드
	private String proNm; //제품명
	private int output; //검사합격량
	//private String prcsTblCd;//공정진행코드
	private String prOrderCd; //생산지시코드
	private String prcsCd; //공정코드
}
