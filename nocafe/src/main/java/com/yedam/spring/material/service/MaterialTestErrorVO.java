package com.yedam.spring.material.service;

import lombok.Data;

@Data
public class MaterialTestErrorVO {
	//자재입고검사불량
	private String inf_cd;	//불량코드
	private String insp_cd;	//검사코드
	private String ordr_cd;	//발주번호
	private String rsc_cd;	//자재코드
	private int inf_cnt;	//불량수량
}
