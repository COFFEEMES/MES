package com.yedam.spring.manufacturing.plan.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PlanVO {
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date   planDt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date   exStartDt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date   exEndDt;
	
	private String planHdCd;
	
//	날짜를 스트링으로 받아서 보내 줄 필드
	private String planDtFormat;
	
	private String planManager;
	private String oderNo;
	private String planCd;
	private int	   planCnt;
	private String proCd;

//	총 재고수량
	private int stockCnt;
	
	
//	자재 정보 받아올 field
	private String rscNm;
	private String exUsed;
	

}
