package ac.kr.ft.com.persistance.mapper;

import java.util.List;

import ac.kr.ft.com.dto.MenuComDTO;
import ac.kr.ft.com.dto.MenuInfoDTO;
import config.Mapper;
//기존 ICtrDao와 같음

@Mapper("MenuMapper")
public interface MenuMapper {
//	@Autowired
//	private SqlSessionTctrlate sqlSession;
//	private final String NS = "ac.kr.ft.com.persistance.sqlmap.ComSqlMap.";
	
	List<MenuInfoDTO> getMENUList();

	MenuInfoDTO getMENUDetail(MenuInfoDTO menuinfoDto)throws Exception;

	int createMENUInfo(MenuInfoDTO menuinfoDto)throws Exception;

	int deleteMENUInfo(MenuInfoDTO menuinfoDto)throws Exception;

	int updateMENUInfo(MenuInfoDTO menuinfoDto)throws Exception;
	
	int deleteAllCheckList(MenuInfoDTO menuinfoDto)throws Exception;

	

	int deleteCommentInfo(MenuInfoDTO menuinfoDto)throws Exception; //글과댓글 삭제

	void updatecomUppder(MenuComDTO menuu)throws Exception; //댓글번호 증가
	
	
	int deleteAllCheckListComment(MenuInfoDTO menuinfoDto)throws Exception;
	
	
	//상세댓글 리스트
	List<MenuComDTO> getMenuComList(MenuComDTO menuu)throws Exception;
	// 댓글 리스트 크기 가져오기
	MenuComDTO getMenuComListCnt(MenuComDTO menuu)throws Exception;
	
	//댓글 등록
	int createComment(MenuComDTO menuu) throws Exception;
		
	//댓글 삭제 한개한개 삭제
	int deleteComment(MenuComDTO menuu) throws Exception;

	//댓글 수정
	int updateComment(MenuComDTO menuu) throws Exception;



	
	
	
	List<MenuInfoDTO> getBusiList()throws Exception; 
	


	/*
	#############################################################################
	#							사업자 서비스 시작									#
	#############################################################################
	 */
	
	//댓글 리스트
	List<MenuComDTO> getBusiCommentList(MenuComDTO menuu)throws Exception;
	
	//댓글 리스트 크기 가져오기
	MenuComDTO getBusiCommentListCnt(MenuComDTO menuu)throws Exception;	
	

	/*
	#############################################################################
	#							사업자 서비스 끝									#
	#############################################################################
	 */	
	
	/*
	#############################################################################
	#							사용자 서비스 시작									#
	#############################################################################
	 */
	
	//댓글 리스트
	List<MenuComDTO> getUserCommentList(MenuComDTO menuu)throws Exception;
	
	//댓글 리스트 크기 가져오기
	MenuComDTO getUserCommentListCnt(MenuComDTO menuu)throws Exception;	
	

	/*
	#############################################################################
	#							사용자 서비스 끝									#
	#############################################################################
	 */	
	


}



