package com.yedam.spring.material.service;

import java.util.Date;

import lombok.Data;

@Data
public class MaterialLOTVO {
	//자재LOT 관리
	private String rsc_lot_cd;	//LOT번호
	private String rsc_cd;		//자재코드
	private String rsc_insp_cd;	//검사코드
	private String ordr_cd;		//발주번호
	private String ist_cd;		//입고코드
	private int lot_cnt;		//LOT수량
	private Date exp_dt;		//유통기한
}
