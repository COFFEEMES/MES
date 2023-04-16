package com.yedam.spring.manufacturing.performance.service;

import java.util.List;

public interface PerformanceService {

	public List<InstVO> getAllInst();

	public List<InstVO> getPrOrderDetail(InstVO instVO);

	public List<ProcessVO> getPrcsBom(InstVO instVO);

}
