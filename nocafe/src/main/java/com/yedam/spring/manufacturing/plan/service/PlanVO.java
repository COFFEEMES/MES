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
	
	private String planDtFormat;
	
	private String planManager;
	private String oderNo;
	private String planCd;
	private int	   planCnt;
	private String proCd;
}
