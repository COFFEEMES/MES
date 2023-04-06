package com.yedam.spring.material.service;

import lombok.Data;

@Data
public class MaterialTestDetailVO {
	//자재입고검사상세
	private String rscInspCd;	//검사코드
	private String ordrCd;		//발주번호
	private String rscCd;		//자재코드
	private int inspCnt;		//검사수량
	private int inspPassCnd;	//합격수량
	private int inspFailCnd;	//불량수량
	
	
	
}
