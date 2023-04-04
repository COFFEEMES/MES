package com.yedam.spring.material.service;

import java.util.Date;

import lombok.Data;

@Data
public class MaterialTestVO {
	//자재입고검사
	private String insp_cd;		//검사코드
	private Date insp_dt;		//검사일자
	private String insp_tstr;	//검사자
}
