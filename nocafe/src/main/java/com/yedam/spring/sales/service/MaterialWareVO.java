package com.yedam.spring.sales.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MaterialWareVO {
	//자재발주 테이블
	private String ordrCd;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ordrReqDt;
	private String vendCd;
	
	//자재발주 디테일
	private String rscCd;
	private int ordrCnt;
	private int rmnCnt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date paprdCmndDt;
	
}
