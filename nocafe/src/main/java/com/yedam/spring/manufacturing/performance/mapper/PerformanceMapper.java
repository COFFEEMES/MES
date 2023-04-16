package com.yedam.spring.manufacturing.performance.mapper;

import java.util.List;

import com.yedam.spring.manufacturing.performance.service.InstVO;
import com.yedam.spring.manufacturing.performance.service.ProcessVO;

public interface PerformanceMapper {

	public List<InstVO> getAllInst();

	public List<InstVO> getPrOrderDetail(InstVO instVO);

	public List<ProcessVO> getPrcsBom(InstVO instVO);

}
