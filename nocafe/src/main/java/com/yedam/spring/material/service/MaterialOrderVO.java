package com.yedam.spring.material.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MaterialOrderVO {
	//자재발주
	private String ordrCd; 		//발주번호
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date ordrReqDt;		//발주신청일
	private String vendCd;		//거래처코드
	
}
