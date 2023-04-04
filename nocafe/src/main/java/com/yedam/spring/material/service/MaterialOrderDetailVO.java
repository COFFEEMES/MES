package com.yedam.spring.material.service;



import java.util.Date;

import lombok.Data;

@Data
public class MaterialOrderDetailVO {
	//자재발주 디테일
	private String ordr_cd;		//발주번호
	private String rsc_cd;		//자재코드
	private int ordr_cnt;		//발주량
	private int rmn_cnt;		//미입고잔량
	private Date paprd_cmnd_dt;	//납기요청일
	
}
