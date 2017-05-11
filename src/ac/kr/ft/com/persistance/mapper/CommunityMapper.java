package ac.kr.ft.com.persistance.mapper;

import java.util.List;

import ac.kr.ft.com.dto.CommunityComDTO;
import ac.kr.ft.com.dto.CommunityDTO;
import config.Mapper;

@Mapper("CommunityMapper")
public interface CommunityMapper {

    List<CommunityDTO> getCommunityList() 					throws Exception;
 

    CommunityDTO getCommunityDetail(CommunityDTO communityDto)		throws Exception;

    
    int createCommunityInfo(CommunityDTO communityDto)			throws Exception;

	int deleteCommunityInfo(CommunityDTO communityDto)			throws Exception;

	int updateCommunityInfo(CommunityDTO communityDto)			throws Exception;

	void updateCntUppder(CommunityDTO communityDto) 		throws Exception;
	
	int deleteAllCheckList(CommunityDTO communityDto)		throws Exception;
	
	int deleteCommentInfo(CommunityDTO communityDto)		throws Exception; //댓글 삭제

	void updatecomUppder(CommunityComDTO comDto)			throws Exception; //댓글번호 증가
	
	
	int deleteAllCheckListComment(CommunityDTO communityDto)  throws Exception;

	//댓글 등록
	int createComment(CommunityComDTO comDto)				 throws Exception;
		
	//댓글 삭제 한개한개 삭제
	int deleteComment(CommunityComDTO comDto) 			 throws Exception;

	//댓글 수정
	int updateComment(CommunityComDTO comDto) 			 throws Exception;

	
	//게시판 상세 댓글 리스트
	List<CommunityComDTO> getCommunityComList(CommunityComDTO comDto) throws Exception;
	
	//게시판 상세 댓글 크기 가져오기
	CommunityComDTO getCommunityComListCnt(CommunityComDTO comDto)   throws Exception;
	
	
	/*
	#############################################################################
	#							사업자 서비스 시작									#
	#############################################################################
	 */
	
	//게시판 리스트
	List<CommunityDTO> getBusiList(CommunityDTO communityDto)			throws Exception;
	
	//게시판 리스트 크기 가져오기
	CommunityDTO getBusiListCnt(CommunityDTO communityDto) 				throws Exception;
	
	//댓글 리스트
	List<CommunityComDTO> getBusiCommentList(CommunityComDTO comDto)	throws Exception;
	
	//댓글 리스트 크기 가져오기
	CommunityComDTO getBusiCommentListCnt(CommunityComDTO comDto)		throws Exception;	
	
	/*
	#############################################################################
	#							사업자 서비스 끝									#
	#############################################################################
	 */	
	
}
