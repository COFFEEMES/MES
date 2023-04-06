package com.yedam.spring.material.service;



import java.util.Date;

import lombok.Data;

@Data
public class MaterialOrderDetailVO {
	//자재발주 디테일
	private String ordrCd;		//발주번호
	private String rscCd;		//자재코드
	private int ordrCnt;		//발주량
	private int rmnCnt;			//미입고잔량
	private Date paprdCmndDt;	//납기요청일
	
}
