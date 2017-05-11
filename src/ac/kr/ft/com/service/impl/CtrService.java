package ac.kr.ft.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ac.kr.ft.com.dto.CtrDTO;
import ac.kr.ft.com.dto.EventDTO;
import ac.kr.ft.com.dto.MenuInfoDTO;
import ac.kr.ft.com.persistance.mapper.CtrMapper;
import ac.kr.ft.com.service.ICtrService;

@Service("CtrService")
public class CtrService implements ICtrService {

	@Resource(name="CtrMapper")
	private CtrMapper ctrMapper;
	
	@Override
	public List<CtrDTO> getCTRList() throws Exception{
		return ctrMapper.getCTRList();
	}


	@Override
	public CtrDTO getCTRDetail(CtrDTO ctrDto)throws Exception {
		return ctrMapper.getCTRDetail(ctrDto);
	}

	@Override
	public boolean createCTRInfo(CtrDTO ctrDto)throws Exception {
		int a =ctrMapper.createCTRInfo(ctrDto);
		if(a != 0){
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteCTRInfo(CtrDTO ctrDto)throws Exception {
	
		int a = ctrMapper.deleteCTRInfo(ctrDto); 
		if(a !=0){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateCTRInfo(CtrDTO ctrDto)throws Exception {
		int a =ctrMapper.updateCTRInfo(ctrDto);
		if(a != 0){
			return true;
		}
		return false;
	}
	
	@Override
	public boolean deleteAllCheckList(CtrDTO ctrDto) throws Exception{
		int a =ctrMapper.deleteAllCheckList(ctrDto);
		if(a != 0){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateCheck(CtrDTO ctrDto) throws Exception {
		int a = ctrMapper.updateCheck(ctrDto);
		if(a != 0){
			return true;
		}
		return false;
	}

	
/*	 ##########################################################################
	  #						사업자 시작										#
	  ########################################################################## */
	
	@Override
	public CtrDTO getBusiList(CtrDTO ctrDto) throws Exception {

		CtrDTO rDTO = ctrMapper.getBusiListCnt(ctrDto);

		rDTO.seteList(ctrMapper.getBusiList(ctrDto));

		return rDTO;

	}
	
	@Override
	public List<CtrDTO> getBusiCTRList() throws Exception{
		return ctrMapper.getBusiCTRList();
	}


	@Override
	public CtrDTO getBusiCTRDetail(CtrDTO ctrDto)throws Exception {
		return ctrMapper.getBusiCTRDetail(ctrDto);
	}

	@Override
	public boolean createBusiCTRInfo(CtrDTO ctrDto)throws Exception {
		int a =ctrMapper.createBusiCTRInfo(ctrDto);
		if(a != 0){
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteBusiCTRInfo(CtrDTO ctrDto)throws Exception {
	
		int a = ctrMapper.deleteBusiCTRInfo(ctrDto); 
		if(a !=0){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateBusiCTRInfo(CtrDTO ctrDto)throws Exception {
		int a =ctrMapper.updateBusiCTRInfo(ctrDto);
		if(a != 0){
			return true;
		}
		return false;
	}
	
	@Override
	public boolean deleteBusiAllCheckList(CtrDTO ctrDto) throws Exception{
		int a =ctrMapper.deleteBusiAllCheckList(ctrDto);
		if(a != 0){
			return true;
		}
		return false;
	}


	@Override
	public boolean updateBusiCheck(CtrDTO ctrDto) throws Exception {
		int a = ctrMapper.updateBusiCheck(ctrDto);
		if(a != 0){
			return true;
		}
		return false;
	}
	
/*	##########################################################################
	  #						사용자 시작										#
	  ##########################################################################*/
	
	@Override
	public CtrDTO getGuestList(CtrDTO ctrDto) throws Exception {

		CtrDTO rDTO = ctrMapper.getGuestListCnt(ctrDto);

		rDTO.seteList(ctrMapper.getGuestList(ctrDto));

		return rDTO;

	}
	
	@Override
	public List<CtrDTO> getGuestCTRList() throws Exception{
		return ctrMapper.getGuestCTRList();
	}


	@Override
	public CtrDTO getGuestCTRDetail(CtrDTO ctrDto)throws Exception {
		return ctrMapper.getGuestCTRDetail(ctrDto);
	}

	@Override
	public boolean createGuestCTRInfo(CtrDTO ctrDto)throws Exception {
		int a =ctrMapper.createGuestCTRInfo(ctrDto);
		if(a != 0){
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteGuestCTRInfo(CtrDTO ctrDto)throws Exception {
	
		int a = ctrMapper.deleteGuestCTRInfo(ctrDto); 
		if(a !=0){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateGuestCTRInfo(CtrDTO ctrDto)throws Exception {
		int a =ctrMapper.updateGuestCTRInfo(ctrDto);
		if(a != 0){
			return true;
		}
		return false;
	}
	
	@Override
	public boolean deleteGuestAllCheckList(CtrDTO ctrDto) throws Exception{
		int a =ctrMapper.deleteGuestAllCheckList(ctrDto);
		if(a != 0){
			return true;
		}
		return false;
	}


	@Override
	public boolean updateGuestCheck(CtrDTO ctrDto) throws Exception {
		int a = ctrMapper.updateGuestCheck(ctrDto);
		if(a != 0){
			return true;
		}
		return false;
	}

	
}
