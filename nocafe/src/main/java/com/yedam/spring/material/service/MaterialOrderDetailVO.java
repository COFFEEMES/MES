package com.yedam.spring.material.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MaterialOrderDetailVO {
	//자재발주 디테일
	private String rscCd;		
	private String rscNm;		
	private String vendCd;
	private String ordrCd;
	private int ordrCnt;
	private String safRtc;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date paprdCmndDt;
	
	
}
