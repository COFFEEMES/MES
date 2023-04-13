package com.yedam.spring.material.service;

import lombok.Data;

@Data
public class MaterialVO {
	private String rscCd;		//자재코드
	private String rscNm;		//자재명
	private String rscTyp;		//자재유형
	private String rscSpec;		//자재규격
	private String rscUnit;		//관리단위
	private String safRtc;		//안전재고
	private String rscAvail;	//사용여부
	
	
	private int lotCnt;	
	

}
