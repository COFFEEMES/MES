package com.yedam.spring.material.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.material.mapper.MaterialMapper;
import com.yedam.spring.material.service.MaterialLOTVO;
import com.yedam.spring.material.service.MaterialOrderDetailVO;
import com.yedam.spring.material.service.MaterialOrderVO;
import com.yedam.spring.material.service.MaterialService;
import com.yedam.spring.material.service.MaterialTestDetailVO;
import com.yedam.spring.material.service.MaterialVO;

@Service
public class MaterialServiceImpl implements MaterialService {

	@Autowired
	MaterialMapper materialMapper;
	
	//자재조회
	@Override
	public List<MaterialVO> getMaterialList() {
		return materialMapper.selectMaterialList();
	}

	//발주조회
	@Override
	public List<MaterialOrderVO> getMaterialOrderList() {
		return materialMapper.selectMaterialOrderList();
	}
	
	//발주디테일
	@Override
	public List<MaterialOrderDetailVO> getMaterialOrderDetail(MaterialOrderDetailVO materialOrderDetailVO) {
		return materialMapper.getMaterialOrderDetail(materialOrderDetailVO);
	}


	//자재LOT조회
	@Override
	public List<MaterialLOTVO> getMaterialLOTList() {
		return materialMapper.selectMaterialLOTList();
	}
	
	//자재입고검사조회
	@Override
	public List<MaterialTestDetailVO> getMaterialTestList() {
		return materialMapper.selectMaterialTestList();
	}

	
	//자재검색
	@Override
	public List<MaterialLOTVO> materalSearch(@Param("rscNm") String rscNm) {
		return materialMapper.materalSearch(rscNm);
	}

	//발주검색
	@Override
	public List<MaterialOrderVO> materalOrderSearch(@Param("vendNm") String vendNm) {
		return materialMapper.materalOrderSearch(vendNm);
	}

	//발주디테일 모달
	@Override
	public List<MaterialOrderDetailVO> orderDetailList(MaterialOrderDetailVO materialOrderDetailVO) {
		return materialMapper.orderDetailList(materialOrderDetailVO);
	}

	//발주조회페이지 수정
	@Override
	public void materialOrderUpdate(List<MaterialOrderDetailVO> materialOrderUpdate) {
		for(MaterialOrderDetailVO materialOrderDetailVO : materialOrderUpdate) {
			materialMapper.materialOrderUpdate(materialOrderDetailVO);
		}
	}
	
	//발주관리페이지 발주코드
	@Override
	public List<MaterialOrderVO> materialOrderCd(MaterialOrderVO materialOrderVO) {
		return materialMapper.materialOrderCd(materialOrderVO);
	}

	@Override
	public List<MaterialVO> getResources(MaterialVO materialVO) {
		return materialMapper.getResources(materialVO);
	}

	//발주버튼
	@Override
	public void rscOrdrInsert(List<MaterialOrderVO> ordrList) {
		MaterialOrderVO vo = ordrList.get(0);
		materialMapper.rscOrdrFInsert(vo);
		for (MaterialOrderVO ordrDtl : ordrList) {
			materialMapper.rscOrdrInsert(ordrDtl);
		}
	}
	@Override
	public void rscOrdrFInsert(List<MaterialOrderVO> ordrList) {
		MaterialOrderVO vo = ordrList.get(0);
		materialMapper.rscOrdrFInsert(vo);
	}
	
}
