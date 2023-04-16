package com.yedam.spring.sales.service;

import java.util.List;

public interface LotService {
	//조회
	public List<LotVO> lotList(String start, String end,String proNm);

	//삭제
	public int deleteLot(String str);
}
