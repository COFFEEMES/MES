package com.yedam.spring.manufacturing.direction.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class DirVO {
	
//	계획서 데이터
	
	private String 	planCd;
	private String  planNo;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 	planDt;
	
	private String 	dirStatus;
	private String 	proCd;
	private String 	proNm;
	private String	rscCd;
	private String 	prcsCd;
	private String	rscNm;
	private String	prcsNm;
	
	
	
	private int 	planCnt;
	private int 	bomSq;
	private int		lotCnt;
	private int 	exCnt;
	private int 	orderOutput;
	private int		output;
	
	
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 	exStartDt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 	exEndDt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 	indicaDt;
}
