package com.yedam.spring.manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.manager.mapper.ManagerMapper;
import com.yedam.spring.manager.service.BasicCodeVO;
import com.yedam.spring.manager.service.ManagerService;

@Service
public class ManagerImpl implements ManagerService {
	
	@Autowired
	ManagerMapper managerMapper;

	@Override
	public List<BasicCodeVO> getAllBasicCode() {
		return managerMapper.getAllBasicCode();
	}

}
