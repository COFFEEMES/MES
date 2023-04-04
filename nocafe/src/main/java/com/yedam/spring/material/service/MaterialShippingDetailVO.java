package com.yedam.spring.material.service;

import lombok.Data;

@Data
public class MaterialShippingDetailVO {
	//자재출고상세
	private String rsc_oust_cd; //출고코드
	private String lot_cd;		//LOT번호
	private String rsc_cd;		//자재코드
	private int oust_cnt;		//출고수량
	
}
