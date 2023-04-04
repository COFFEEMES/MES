package com.yedam.spring.material.service;

import java.util.Date;

import lombok.Data;

@Data
public class MaterialShippingVO {
	//자재출고
	private String rsc_oust_cd;	//출고코드
	private String rsc_cd;		//자재코드
	private Date oust_dt;		//출고일자
	private String oust_typ;	//출고유형
	private int oust_cnt;		//출고수량
}
