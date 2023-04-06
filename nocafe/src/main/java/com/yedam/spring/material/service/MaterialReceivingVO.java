package com.yedam.spring.material.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MaterialReceivingVO {
	//자재입고
	private String istCd;	//입고코드
	private String rscCd;	//자재코드
	private int istCnt;		//입고수량
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date istDt;		//입고일자
	private String istTyp;	//입고유형
}
