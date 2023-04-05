package com.yedam.spring.sales.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrderVO {
	
	//Order 테이블
	private String orderNo;
	private String vendCd;
	private String vendNm;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date orderDt;
	private String orderSit;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date parrdDt;
	
	//Order Detail 테이블
	private String orderDateilNo;
	//private String orderNo;
	private String proCd;
	private String proNm;
	private String orderSitDetail;
	private int orderCnt;
	
}
