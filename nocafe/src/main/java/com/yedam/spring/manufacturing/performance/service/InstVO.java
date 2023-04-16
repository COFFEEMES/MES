package com.yedam.spring.manufacturing.performance.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class InstVO {
	
	private String prOrderCd;
	private String prOrderManager;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date   prOrderDt;
	private String formedDate;
	private String planNo;
	
	private String proCd;
	private String orderOutput;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date   prStartDt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date   prEndtDt;
	
	private String rscNm;
	private String proNm;

}
