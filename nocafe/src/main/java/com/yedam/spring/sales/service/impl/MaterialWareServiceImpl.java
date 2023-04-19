package com.yedam.spring.sales.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.sales.mapper.MaterialWareMpper;
import com.yedam.spring.sales.service.MaterialWareService;
import com.yedam.spring.sales.service.MaterialWareVO;

@Service
public class MaterialWareServiceImpl implements MaterialWareService {

	@Autowired
	MaterialWareMpper materialWareMapper;
	
	@Override
	public List<MaterialWareVO> reList(String start, String end, String vendNm) {
		return materialWareMapper.reList(start, end, vendNm);
	}

	@Override
	public List<MaterialWareVO> detailList(String ordrCd) {
		return materialWareMapper.detailList(ordrCd);
	}

	@Override
	public List<MaterialWareVO> testPoor() {
		return materialWareMapper.testPoor();
	}

	@Override
	public List<MaterialWareVO> empList() {
		return materialWareMapper.empList();
	}

	@Override
	public String makeCd() {
		return materialWareMapper.makeCd();
	}

	@Override
	public int saveDetail(List<MaterialWareVO> materialWareVO) {
		String cd = materialWareMapper.makeCd(); //검사코드 생성
		int result = 0;
		for(int i=0; i<materialWareVO.size(); i++) {
			materialWareVO.get(i).setInspCd(cd);
			materialWareMapper.rscUp(materialWareVO.get(i).getOrdrCd());
			if(i==0) {
				materialWareMapper.saveTotal(materialWareVO.get(i));
			}
			result += materialWareMapper.saveDetail(materialWareVO.get(i));	
		}
		return result;
	}

	@Override
	public int errorData(List<MaterialWareVO> materialWareVO) {
		for(int i=0; i<materialWareVO.size(); i++) {
			if(materialWareVO.get(i).getInferCnt()!= 0)  {
				materialWareMapper.errorData(materialWareVO.get(i));
			}
		}
		return 1;
	}

	@Override
	public List<MaterialWareVO> comSearch() {
		return materialWareMapper.comSearch();
	}

	@Override
	public List<MaterialWareVO> comInput() {
		return materialWareMapper.comInput();
	}

	@Override
	public int allSave(List<MaterialWareVO> materialWareVO) {
		String istCd = materialWareMapper.istCd();
		
		for(int i=0; i<materialWareVO.size(); i++) {
			materialWareVO.get(i).setIstCd(istCd);
			materialWareMapper.istInput(materialWareVO.get(i));
			
			String rscCd = materialWareVO.get(i).getRscCd();
			String rscLotCd = materialWareMapper.lotNm(rscCd);
			materialWareVO.get(i).setRscLotCd(rscLotCd);
			
			materialWareMapper.lotInput(materialWareVO.get(i));
		}
		return 1;
	}




}
