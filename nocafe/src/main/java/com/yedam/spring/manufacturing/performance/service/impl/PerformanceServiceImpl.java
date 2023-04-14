package com.yedam.spring.manufacturing.performance.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.manufacturing.performance.mapper.PerformanceMapper;
import com.yedam.spring.manufacturing.performance.service.InstVO;
import com.yedam.spring.manufacturing.performance.service.PerformanceService;

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

}
