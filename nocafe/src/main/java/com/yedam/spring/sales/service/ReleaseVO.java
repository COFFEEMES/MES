package com.yedam.spring.sales.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReleaseVO {

	//진행중 주문서 조회
	private String orderNo;
	private String orderDetailNo;
	private String vendNm;
	private String proNm;
	private int orderCnt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date parrdDt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date orderDt;

	//완제품재고 모달창
	private String proCd;
	private String proLotNo;
	private int lotCnt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date proWdt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date proExp;
	
	//출고등록현황
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date proOustDt;
	private int proOustCnt;
	
	private String proOustNo;
	
	private int sum;
	
	
	
	
}
