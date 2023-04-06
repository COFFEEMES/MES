package com.yedam.spring.material.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MaterialLOTVO {
	//자재LOT 관리
	private String rscLotCd;	//LOT번호
	private String rscCd;		//자재코드
	private String rscInspCd;	//검사코드
	private String ordrCd;		//발주번호
	private String istCd;		//입고코드
	private int lotCnt;			//LOT수량
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date expDt;			//유통기한
}
