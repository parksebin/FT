package ac.kr.ft.com.service;

import java.util.List;

import ac.kr.ft.com.dto.CommunityComDTO;
import ac.kr.ft.com.dto.CommunityDTO;

public interface ICommunityService {
	//관리자 웹 게시판 리스트
	List<CommunityDTO> getCommunityList() throws Exception;

	//관리자 웹 게시판 상세보기
	CommunityDTO getCommunityDetail(CommunityDTO communityDto, CommunityComDTO comDto) throws Exception;

	//글등록하기 리스트 
	boolean createCommunityInfo(CommunityDTO communityDto) throws Exception;

	
	boolean deleteCommunityInfo(CommunityDTO communityDto) throws Exception;

	boolean updateCommunityInfo(CommunityDTO communityDto) throws Exception;

	void updateCntUpper(CommunityDTO communityDto) throws Exception;

	boolean deleteAllCheckList(CommunityDTO communityDto) throws Exception;

	// 댓글번호 증가
	void updatecomUppder(CommunityComDTO comDto) throws Exception;

	CommunityDTO getCommunityDetailInfo(CommunityDTO communityDto) throws Exception;

	boolean createComment(CommunityComDTO comDto) throws Exception;

	boolean deleteComment(CommunityComDTO comDto) throws Exception;

	boolean updateComment(CommunityComDTO comDto) throws Exception;
	
	// 게시판과 댓글 함께 지우기
	boolean deleteCommentInfo(CommunityDTO communityDto) throws Exception;
	

	//게시판 댓글 리스트 가져오기
	CommunityComDTO getCommunityComList(CommunityComDTO comDto) throws Exception;


	// 이벤트 상세보기
	CommunityDTO busiCommunityDetail(CommunityDTO communityDto) throws Exception;
	

	

	
	/*
	#############################################################################
	#							사업자 서비스 시작									#
	#############################################################################
	 */
	
	CommunityDTO getBusiList(CommunityDTO communityDto) throws Exception;
	
	
	CommunityComDTO getBusiCommentList(CommunityComDTO comDto) throws Exception;

	/*
	#############################################################################
	#							사업자 서비스 끝									#
	#############################################################################
	 */
	
}
