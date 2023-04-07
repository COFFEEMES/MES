package com.yedam.spring.manager.service;

import java.util.List;

import com.yedam.spring.sales.service.VendVO;

public interface ManagerService {

	public List<BasicCodeVO> getAllBasicCode();
	public List<DetailCodeVO> getDetailCode(DetailCodeVO detailCodeVO);
	public void upsertDetailCode(List<DetailCodeVO> detailCodeVO);
	public int insertBasicCode(BasicCodeVO basicCodeVO);
	public List<VendVO> getAllVend();

}
