package com.yedam.spring.material.service;

import lombok.Data;

@Data
public class MaterialTestErrorVO {
	//자재입고검사불량
	private String infCd;	//불량코드
	private String inspCd;	//검사코드
	private String ordrCd;	//발주번호
	private String rscCd;	//자재코드
	private int infCnt;		//불량수량
}
