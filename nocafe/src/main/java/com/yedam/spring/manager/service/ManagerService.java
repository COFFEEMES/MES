package com.yedam.spring.manager.service;

import java.util.List;

import com.yedam.spring.sales.service.EdctsVO;
import com.yedam.spring.sales.service.VendVO;

public interface ManagerService {

	public List<BasicCodeVO> getAllBasicCode();
	public List<DetailCodeVO> getDetailCode(DetailCodeVO detailCodeVO);
	public void upsertDetailCode(List<DetailCodeVO> detailCodeVO);
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
	public List<DetailCodeVO> getAllPro();
	public EdctsVO getPro(EdctsVO edctsVO);
	public void mergePro(EdctsVO edctsVO);
	public void delPro(EdctsVO edctsVO);
	public List<BomVO> getPrcs(EdctsVO edctsVO);
	public List<BomVO> getUseRcs(EdctsVO edctsVO);
	public List<BomVO> getPrcsRcs(BomVO bomVO);
	public void delPrcs(List<BomVO> list);
	public void savePrcs(List<BomVO> list);
	public List<PrcsVO> getAllPrcs();
	public List<RscVO> getAllRsc();

}
