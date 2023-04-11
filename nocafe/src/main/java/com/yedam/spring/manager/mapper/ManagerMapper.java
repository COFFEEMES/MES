package com.yedam.spring.manager.mapper;

import java.util.List;

import com.yedam.spring.manager.service.BasicCodeVO;
import com.yedam.spring.manager.service.DetailCodeVO;
import com.yedam.spring.manager.service.EmpVO;
import com.yedam.spring.manager.service.RscVO;
import com.yedam.spring.sales.service.VendVO;

public interface ManagerMapper {

	public List<BasicCodeVO> getAllBasicCode();
	public List<DetailCodeVO> getDetailCode(DetailCodeVO detailCodeVO);
	public void upsertDetailCode(DetailCodeVO detailCodeVO);
	public int insertBasicCode(BasicCodeVO basicCodeVO);
	public List<VendVO> getAllVend();
	public void mergeVend(VendVO vendVO);
	public void delVend(VendVO vendVO);
	public List<EmpVO> getEmpList();
	public List<DetailCodeVO> getAllMat();
	public List<DetailCodeVO> getMatType();
	public RscVO getRsc(RscVO rscVO);
	public void mergeRsc(RscVO rscVO);
	public void delRsc(RscVO rscVO);

}
