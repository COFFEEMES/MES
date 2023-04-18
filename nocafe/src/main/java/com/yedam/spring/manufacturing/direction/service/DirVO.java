package com.yedam.spring.manufacturing.direction.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class DirVO {
	
//	계획서 데이터
	
	private String 	planCd;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 	planDt;
	private String 	dirStatus;
	private String 	proCd;
	private String 	proNm;
	
	private int 	planCnt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 	exStartDt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 	exEndDt;
	
	
}
