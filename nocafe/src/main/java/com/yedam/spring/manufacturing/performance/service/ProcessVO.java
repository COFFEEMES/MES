package com.yedam.spring.manufacturing.performance.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProcessVO {
	
	private String prOrderCd;
	private String proCd;
	private String prcsCd;
	private int bomSq;
	private int stock;
	private int output;
	private int badQuantity;
	private String completed;
	
	private String worker;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date wkFrDttm;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date wkToDttm;
	private int inferCnt;
	private int prodCnt;
	private String note;
	
	private String rscCd;
	private String rscLotCd;
	private String rscTotal;
	
	private String prcsNm;
	private String empCode;
	private String empName;
	private String eqmCd;

}
