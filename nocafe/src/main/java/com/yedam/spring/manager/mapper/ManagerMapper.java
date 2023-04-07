package com.yedam.spring.manager.mapper;

import java.util.List;

import com.yedam.spring.manager.service.BasicCodeVO;
import com.yedam.spring.manager.service.DetailCodeVO;
import com.yedam.spring.sales.service.VendVO;

public interface ManagerMapper {

	public List<BasicCodeVO> getAllBasicCode();
	public List<DetailCodeVO> getDetailCode(DetailCodeVO detailCodeVO);
	public void upsertDetailCode(DetailCodeVO detailCodeVO);
	public int insertBasicCode(BasicCodeVO basicCodeVO);
	public List<VendVO> getAllVend();

}
