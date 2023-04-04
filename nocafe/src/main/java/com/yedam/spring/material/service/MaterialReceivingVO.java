package com.yedam.spring.material.service;

import java.util.Date;

import lombok.Data;

@Data
public class MaterialReceivingVO {
	//자재입고
	private String ist_cd;	//입고코드
	private String rsc_cd;	//자재코드
	private int ist_cnt;	//입고수량
	private Date ist_dt;	//입고일자
	private String ist_typ;	//입고유형
}
