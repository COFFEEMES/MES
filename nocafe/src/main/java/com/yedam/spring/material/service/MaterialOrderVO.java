package com.yedam.spring.material.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MaterialOrderVO {
	//자재발주
	private String ordr_cd; 	//발주번호
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date ordr_req_dt;	//발주신청일
	private String vend_cd;		//거래처코드
	
}
