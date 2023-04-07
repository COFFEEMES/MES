package com.yedam.spring.material.service;

import lombok.Data;

@Data
public class MaterialShippingDetailVO {
	//자재출고상세
	private String rscOustCd; 	//출고코드
	private String lotCd;		//LOT번호
	private String rscCd;		//자재코드
	private int oustCnt;		//출고수량
	
}
