package com.yedam.spring.manufacturing.performance.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class EqmVO {
	
	private String eqmCd;
	private String eqmNm;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date eqmIstDt;
	private int chkPrd;
	private String eqmType;
	private String eqmAvail;
	
	private String prcsCd;
}
