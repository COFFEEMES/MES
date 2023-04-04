package com.yedam.spring.material.service;

import lombok.Data;

@Data
public class MaterialTestDetailVO {
	//자재입고검사상세
	private String rsc_insp_cd;	//검사코드
	private String ordr_cd;		//발주번호
	private String rsc_cd;		//자재코드
	private int insp_cnt;		//검사수량
	private int insp_pass_cnd;	//합격수량
	private int insp_fail_cnd;	//불량수량
	
	
	
}
