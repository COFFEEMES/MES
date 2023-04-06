package com.yedam.spring.material.service;

import java.util.Date;

import lombok.Data;

@Data
public class MaterialTestVO {
	//자재입고검사
	private String inspCd;		//검사코드
	private Date inspDt;		//검사일자
	private String inspTstr;	//검사자
}
