package com.yedam.spring.manufacturing.performance.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.manager.service.EmpVO;
import com.yedam.spring.manufacturing.performance.mapper.PerformanceMapper;
import com.yedam.spring.manufacturing.performance.service.EqmVO;
import com.yedam.spring.manufacturing.performance.service.InstVO;
import com.yedam.spring.manufacturing.performance.service.PerformanceService;
import com.yedam.spring.manufacturing.performance.service.ProcessVO;

@Service
public class PerformanceServiceImpl implements PerformanceService {

	@Autowired
	PerformanceMapper mapper;

	@Override
	public List<InstVO> getAllInst() {
		SimpleDateFormat tranSimpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
		List<InstVO> list = mapper.getAllInst();
		try {
			for(InstVO temp : list) {
				String strDate = null;
				Date data = temp.getPrOrderDt();
				strDate = tranSimpleFormat.format(data);
				temp.setFormedDate(strDate);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<InstVO> getPrOrderDetail(InstVO instVO) {
		return mapper.getPrOrderDetail(instVO);
	}

	@Override
	public List<ProcessVO> getPrcsBom(InstVO instVO) {
		return mapper.getPrcsBom(instVO);
	}

	@Override
	public List<EqmVO> getPrcsEqm(EqmVO eqmVO) {
		return mapper.getPrcsEqm(eqmVO);
	}
	
	@Override
	public List<EmpVO> getEmpList() {
		return mapper.getEmpList();
	}

	@Override
	public void prcsStart(List<ProcessVO> list) {
		for(ProcessVO processVO : list) {
			mapper.prcsStart(processVO);
		}
	}

	@Override
	public void prcsEnd(List<ProcessVO> list) {
		for(ProcessVO processVO : list) {
			mapper.prcsEnd(processVO);
		}
	}

	@Override
	public List<ProcessVO> getUseCnt(ProcessVO processVO) {
		return mapper.getUseCnt(processVO);
	}

	@Override
	public List<ProcessVO> getAllInspection() {
		return mapper.getAllInspection();
	}

	@Override
	public List<ProcessVO> getProTest(ProcessVO processVO) {
		List<ProcessVO> list = new ArrayList<>();
		for(ProcessVO temp : mapper.getProTest(processVO)) {
			list.add(mapper.getProTest2(temp));
		};
		return list;
	}

	@Override
	public void testStart(ProcessVO processVO) {
		mapper.testStart(processVO);
	}

	@Override
	public void testEnd(ProcessVO processVO) {
		mapper.testEnd(processVO);
	}

}
