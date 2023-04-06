package com.yedam.spring.material.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MaterialShippingVO {
	//자재출고
	private String rscOustCd;	//출고코드
	private String rscCd;		//자재코드
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date oustDt;		//출고일자
	private String oustTyp;		//출고유형
	private int oustCnt;		//출고수량
}
