package ac.kr.ft.com.service;

import java.util.List;

import ac.kr.ft.com.dto.CtrDTO;
import ac.kr.ft.com.dto.EventDTO;

public interface ICtrService {
	List<CtrDTO> getCTRList() throws Exception;

	CtrDTO getCTRDetail(CtrDTO ctrDto) throws Exception;

	boolean createCTRInfo(CtrDTO ctrDto) throws Exception;

	boolean deleteCTRInfo(CtrDTO ctrDto) throws Exception;

	boolean updateCTRInfo(CtrDTO ctrDto) throws Exception;

	boolean deleteAllCheckList(CtrDTO ctrDto) throws Exception;

	boolean updateCheck(CtrDTO ctrDto) throws Exception;

	
	
	List<CtrDTO> getBusiCTRList() throws Exception;

	CtrDTO getBusiCTRDetail(CtrDTO ctrDto) throws Exception;

	boolean createBusiCTRInfo(CtrDTO ctrDto) throws Exception;

	boolean deleteBusiCTRInfo(CtrDTO ctrDto) throws Exception;

	boolean updateBusiCTRInfo(CtrDTO ctrDto) throws Exception;

	boolean deleteBusiAllCheckList(CtrDTO ctrDto) throws Exception;

	boolean updateBusiCheck(CtrDTO ctrDto) throws Exception;
	
	CtrDTO getBusiList(CtrDTO ctrDto) throws Exception;
	
	
	
	List<CtrDTO> getGuestCTRList() throws Exception;

	CtrDTO getGuestCTRDetail(CtrDTO ctrDto) throws Exception;

	boolean createGuestCTRInfo(CtrDTO ctrDto) throws Exception;

	boolean deleteGuestCTRInfo(CtrDTO ctrDto) throws Exception;

	boolean updateGuestCTRInfo(CtrDTO ctrDto) throws Exception;

	boolean deleteGuestAllCheckList(CtrDTO ctrDto) throws Exception;

	boolean updateGuestCheck(CtrDTO ctrDto) throws Exception;

	CtrDTO getGuestList(CtrDTO ctrDto) throws Exception;

}
