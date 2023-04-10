package com.yedam.spring.manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.manager.mapper.ManagerMapper;
import com.yedam.spring.manager.service.BasicCodeVO;
import com.yedam.spring.manager.service.DetailCodeVO;
import com.yedam.spring.manager.service.EmpVO;
import com.yedam.spring.manager.service.ManagerService;
import com.yedam.spring.sales.service.VendVO;

@Service
public class ManagerImpl implements ManagerService {
	
	@Autowired
	ManagerMapper managerMapper;

	@Override
	public List<BasicCodeVO> getAllBasicCode() {
		return managerMapper.getAllBasicCode();
	}

	@Override
	public List<DetailCodeVO> getDetailCode(DetailCodeVO detailCodeVO) {
		return managerMapper.getDetailCode(detailCodeVO);
	}

	@Override
	public void upsertDetailCode(List<DetailCodeVO> detailCodeVO) {
		for(DetailCodeVO temp : detailCodeVO) {
			managerMapper.upsertDetailCode(temp);
		}
	}

	@Override
	public int insertBasicCode(BasicCodeVO basicCodeVO) {
		return managerMapper.insertBasicCode(basicCodeVO);
	}

	@Override
	public List<VendVO> getAllVend() {
		return managerMapper.getAllVend();
	}

	@Override
	public void mergeVend(VendVO vendVO) {
		managerMapper.mergeVend(vendVO);
	}

	@Override
	public void delVend(VendVO vendVO) {
		managerMapper.delVend(vendVO);
	}

	@Override
	public List<EmpVO> getEmpList() {
		return managerMapper.getEmpList();
	}

}
