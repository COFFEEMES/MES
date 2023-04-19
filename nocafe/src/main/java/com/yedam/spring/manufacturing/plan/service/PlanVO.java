package com.yedam.spring.manufacturing.plan.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PlanVO {
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date   planDt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date   exStart;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date   exEnd;
	
	private String planHdCd;
	
//	날짜를 스트링으로 받아서 보내 줄 필드
	private String planDtFormat;
	
	private String planManager;
	private String oderNo;
	private String planCd;
	private int	   planCnt;
	private String proCd;
	
	private String prOrderCd;
	private String prOrderManager;

//	총 재고수량
	private int stockCnt;
//	주문량
	private int orderCnt;
	private String orderNo;
	
//	자재 정보 받아올 field
	private String rscNm;
	private String exUsed;
	private String lotCnt;
	private String rscLotCd;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date expDt;
	
	
	private	int exCnt;
	
	
//	받아올 공정정보
	private int useCnt;
	private String bomCd;
	private int bomSq;
	private String prcsCd;
	private String rscCd;
	private String prcsNm;
	private String inferPct;
	private String proNm;
	
	
	

}
