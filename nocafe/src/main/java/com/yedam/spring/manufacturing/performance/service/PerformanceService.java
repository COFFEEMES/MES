package com.yedam.spring.manufacturing.performance.service;

import java.util.List;

import com.yedam.spring.manager.service.EmpVO;

public interface PerformanceService {

	public List<InstVO> getAllInst();
	public List<InstVO> getPrOrderDetail(InstVO instVO);
	public List<ProcessVO> getPrcsBom(InstVO instVO);
	public List<EqmVO> getPrcsEqm(EqmVO eqmVO);
	public List<EmpVO> getEmpList();
	public void prcsStart(List<ProcessVO> list);
	public void prcsEnd(List<ProcessVO> list);
	public List<ProcessVO> getUseCnt(ProcessVO processVO);
	public List<ProcessVO> getAllInspection();
	public List<ProcessVO> getProTest(ProcessVO processVO);
}
