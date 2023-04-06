package com.yedam.spring.manager.service;

import java.util.List;

public interface ManagerService {

	public List<BasicCodeVO> getAllBasicCode();
	public List<DetailCodeVO> getDetailCode(DetailCodeVO detailCodeVO);

}
