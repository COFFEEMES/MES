package com.yedam.spring.manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.spring.manager.mapper.ManagerMapper;
import com.yedam.spring.manager.service.BasicCodeVO;
import com.yedam.spring.manager.service.BomVO;
import com.yedam.spring.manager.service.DetailCodeVO;
import com.yedam.spring.manager.service.EmpVO;
import com.yedam.spring.manager.service.ManagerService;
import com.yedam.spring.manager.service.PrcsVO;
import com.yedam.spring.manager.service.RscVO;
import com.yedam.spring.sales.service.EdctsVO;
import com.yedam.spring.sales.service.VendVO;

@Service
public class ManagerImpl implements ManagerService {
	
	@Autowired
	ManagerMapper managerMapper;

	@Override
	public List<BasicCodeVO> getAllBasicCode() {
		return managerMapper.getAllBasicCode();
	}

	@Override
	public List<DetailCodeVO> getDetailCode(DetailCodeVO detailCodeVO) {
		return managerMapper.getDetailCode(detailCodeVO);
	}

	@Override
	public void upsertDetailCode(List<DetailCodeVO> detailCodeVO) {
		for(DetailCodeVO temp : detailCodeVO) {
			managerMapper.upsertDetailCode(temp);
		}
	}

	@Override
	public int insertBasicCode(BasicCodeVO basicCodeVO) {
		return managerMapper.insertBasicCode(basicCodeVO);
	}

	@Override
	public List<VendVO> getAllVend() {
		return managerMapper.getAllVend();
	}

	@Override
	public void mergeVend(VendVO vendVO) {
		managerMapper.mergeVend(vendVO);
	}

	@Override
	public void delVend(VendVO vendVO) {
		managerMapper.delVend(vendVO);
	}

	@Override
	public List<EmpVO> getEmpList() {
		return managerMapper.getEmpList();
	}

	@Override
	public List<DetailCodeVO> getAllMat() {
		return managerMapper.getAllMat();
	}

	@Override
	public List<DetailCodeVO> getMatType() {
		return managerMapper.getMatType();
	}

	@Override
	public RscVO getRsc(RscVO rscVO) {
		return managerMapper.getRsc(rscVO);
	}

	@Override
	public void mergeRsc(RscVO rscVO) {
		managerMapper.mergeRsc(rscVO);
		
	}

	@Override
	public void delRsc(RscVO rscVO) {
		managerMapper.delRsc(rscVO);
	}

	@Override
	public List<DetailCodeVO> getAllPro() {
		return managerMapper.getAllPro();
	}

	@Override
	public EdctsVO getPro(EdctsVO edctsVO) {
		return managerMapper.getPro(edctsVO);
	}

	@Override
	public void mergePro(EdctsVO edctsVO) {
		managerMapper.mergePro(edctsVO);
	}

	@Override
	public void delPro(EdctsVO edctsVO) {
		managerMapper.delPro(edctsVO);
	}

	@Override
	public List<BomVO> getPrcs(EdctsVO edctsVO) {
		return managerMapper.getPrcs(edctsVO);
	}

	@Override
	public List<BomVO> getUseRsc(EdctsVO edctsVO) {
		return managerMapper.getUseRsc(edctsVO);
	}

	@Override
	public List<BomVO> getPrcsRsc(BomVO bomVO) {
		return managerMapper.getPrcsRsc(bomVO);
	}

	@Override
	public void delPrcs(List<BomVO> list) {
		for(BomVO temp : list) {
			managerMapper.delPrcs(temp);
		}
	}

	@Override
	public void savePrcs(List<BomVO> list) {
		for(BomVO temp : list) {
			managerMapper.savePrcs(temp);
		}
	}
	
	@Override
	public List<PrcsVO> getAllPrcs() {
		return managerMapper.getAllPrcs();
	}

	@Override
	public List<RscVO> getAllRsc() {
		return managerMapper.getAllRsc();
	}

	@Override
	public void saveNewPrcs(List<RscVO> list) {
		for(RscVO temp : list) {
			managerMapper.saveNewPrcs(temp);
		}
	}

}
