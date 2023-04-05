package com.yedam.spring.manager.mapper;

import java.util.List;

import com.yedam.spring.manager.service.BasicCodeVO;
import com.yedam.spring.manager.service.DetailCodeVO;

public interface ManagerMapper {

	public List<BasicCodeVO> getAllBasicCode();
	public DetailCodeVO getDetailCode(DetailCodeVO detailCodeVO);

}
