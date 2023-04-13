package com.yedam.spring.manager.service;

import lombok.Data;

@Data
public class RscVO {
	private String rscCd;
	private String rscNm;
	private String rscTyp;
	private String rscSpec;
	private String rscUnit;
	private String safRtc;
	private String rscAvail;
	
	private String hInput;
	private String prcsCd;
	private String proCd;
	private String unit;
	private String useCnt;
}
