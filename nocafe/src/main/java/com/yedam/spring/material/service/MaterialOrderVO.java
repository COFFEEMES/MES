package com.yedam.spring.material.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MaterialOrderVO {
	//자재발주
	private String ordrCd; 		//발주번호
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ordrReqDt;		//발주신청일
	private String formedDate;
	
	private String vendCd;		//거래처코드
	
	private String vendNm;		//거래처명
	
	private String rscCd;
	private String rscNm;
	
	private String ordrCnt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date paprdCmndDt;
	
	private String ordrSCnt;
}
