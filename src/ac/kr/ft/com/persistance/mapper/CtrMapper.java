package ac.kr.ft.com.persistance.mapper;

import java.util.List;

import ac.kr.ft.com.dto.CtrDTO;
import ac.kr.ft.com.dto.EventDTO;
import ac.kr.ft.com.dto.MenuInfoDTO;
import config.Mapper;
//기존 ICtrDao와 같음

@Mapper("CtrMapper")
public interface CtrMapper {
	// @Autowired
	// private SqlSessionTctrlate sqlSession;
	// private final String NS = "ac.kr.ft.com.persistance.sqlmap.ComSqlMap.";

	List<CtrDTO> getCTRList() throws Exception;

	CtrDTO getCTRDetail(CtrDTO ctrDto) throws Exception;

	int createCTRInfo(CtrDTO ctrDto) throws Exception;

	int deleteCTRInfo(CtrDTO ctrDto) throws Exception;

	int updateCTRInfo(CtrDTO ctrDto) throws Exception;

	int deleteAllCheckList(CtrDTO ctrDto) throws Exception;

	int updateCheck(CtrDTO ctrDto) throws Exception;

	List<CtrDTO> getBusiCTRList() throws Exception;

	CtrDTO getBusiCTRDetail(CtrDTO ctrDto) throws Exception;

	int createBusiCTRInfo(CtrDTO ctrDto) throws Exception;

	int deleteBusiCTRInfo(CtrDTO ctrDto) throws Exception;

	int updateBusiCTRInfo(CtrDTO ctrDto) throws Exception;

	int deleteBusiAllCheckList(CtrDTO ctrDto) throws Exception;

	int updateBusiCheck(CtrDTO ctrDto) throws Exception;

	// 게시판 리스트
	List<CtrDTO> getBusiList(CtrDTO ctrDto) throws Exception;

	// 게시판 리스트 크기 가져오기
	CtrDTO getBusiListCnt(CtrDTO ctrDto) throws Exception;

	List<CtrDTO> getGuestCTRList() throws Exception;

	CtrDTO getGuestCTRDetail(CtrDTO ctrDto) throws Exception;

	int createGuestCTRInfo(CtrDTO ctrDto) throws Exception;

	int deleteGuestCTRInfo(CtrDTO ctrDto) throws Exception;

	int updateGuestCTRInfo(CtrDTO ctrDto) throws Exception;

	int deleteGuestAllCheckList(CtrDTO ctrDto) throws Exception;

	int updateGuestCheck(CtrDTO ctrDto) throws Exception;

	// 게시판 리스트
	List<CtrDTO> getGuestList(CtrDTO ctrDto) throws Exception;

	// 게시판 리스트 크기 가져오기
	CtrDTO getGuestListCnt(CtrDTO ctrDto) throws Exception;

}
