package com.yedam.spring.manufacturing.performance.mapper;

import java.util.List;

import com.yedam.spring.manager.service.EmpVO;
import com.yedam.spring.manufacturing.performance.service.EqmVO;
import com.yedam.spring.manufacturing.performance.service.InstVO;
import com.yedam.spring.manufacturing.performance.service.ProcessVO;

public interface PerformanceMapper {

	public List<InstVO> getAllInst();
	public List<InstVO> getPrOrderDetail(InstVO instVO);
	public List<ProcessVO> getPrcsBom(InstVO instVO);
	public List<EqmVO> getPrcsEqm(EqmVO eqmVO);
	public List<EmpVO> getEmpList();
	public void prcsStart(ProcessVO processVO);
	public void prcsEnd(ProcessVO processVO);
	public List<ProcessVO> getUseCnt(ProcessVO processVO);
	public List<ProcessVO> getAllInspection();
	public List<ProcessVO> getProTest(ProcessVO processVO);
	public void testStart(ProcessVO processVO);
	public void testEnd(ProcessVO processVO);

}
