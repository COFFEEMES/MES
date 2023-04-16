package com.yedam.spring.sales.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class LotVO {
	
	private String proLotNo; //제품LOT번호
	private String proIstNo; //제품입고번호
	private String proCd; //제품코드
	private int lotCnt; //제품수량
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date proExp; //유통기한
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date proWdt; //제조일자
	

}
