package com.yedam.spring.material.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.spring.material.service.MaterialLOTVO;
import com.yedam.spring.material.service.MaterialOrderDetailVO;
import com.yedam.spring.material.service.MaterialOrderVO;
import com.yedam.spring.material.service.MaterialTestDetailVO;
import com.yedam.spring.material.service.MaterialVO;

public interface MaterialMapper {
	
	//자재관리
	public List<MaterialVO> selectMaterialList();
	
	//자재검색
	public List<MaterialLOTVO> materalSearch(@Param("rscNm") String rscNm);
	
	//발주검색
	public List<MaterialOrderVO> materalOrderSearch(@Param("vendNm") String vendNm);
	
	//발주코드
	public List<MaterialOrderVO> materialOrderCd(MaterialOrderVO materialOrderVO);
	
	//발주조회페이지 디테일 모달
	public List<MaterialOrderDetailVO> orderDetailList (MaterialOrderDetailVO materialOrderDetailVO);
	
	//발주디테일
	public List<MaterialOrderDetailVO> getMaterialOrderDetail(MaterialOrderDetailVO materialOrderDetailVO);
	
	//발주조회
	public List<MaterialOrderVO> selectMaterialOrderList();
	
	//발주조회페이지 수정	
	public void materialOrderUpdate (MaterialOrderDetailVO materialOrderDetailVO);

	//자재LOT조회
	public List<MaterialLOTVO> selectMaterialLOTList();

	//자재입고검사조회
	public List<MaterialTestDetailVO> selectMaterialTestList();

}
