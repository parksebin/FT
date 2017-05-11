package ac.kr.ft.com.persistance.mapper;

import java.util.List;

import ac.kr.ft.com.dto.NoticeComDTO;
import ac.kr.ft.com.dto.NoticeDTO;
import config.Mapper;

@Mapper("NoticeMapper")
public interface NoticeMapper {

    List<NoticeDTO> getNoticeList() 					throws Exception;
 

    NoticeDTO getNoticeDetail(NoticeDTO noticeDto)		throws Exception;

    
    int createNoticeInfo(NoticeDTO noticeDto)			throws Exception;

	int deleteNoticeInfo(NoticeDTO noticeDto)			throws Exception;

	int updateNoticeInfo(NoticeDTO noticeDto)			throws Exception;

	void updateCntUppder(NoticeDTO noticeDto) 		throws Exception;
	
	int deleteAllCheckList(NoticeDTO noticeDto)		throws Exception;
	
	int deleteCommentInfo(NoticeDTO noticeDto)		throws Exception; //댓글 삭제

	void updatecomUppder(NoticeComDTO noticee)			throws Exception; //댓글번호 증가
	
	
	int deleteAllCheckListComment(NoticeDTO noticeDto)  throws Exception;

	//댓글 등록
	int createComment(NoticeComDTO noticee)				 throws Exception;
		
	//댓글 삭제 한개한개 삭제
	int deleteComment(NoticeComDTO noticee) 			 throws Exception;

	//댓글 수정
	int updateComment(NoticeComDTO noticee) 			 throws Exception;

	
	//게시판 상세 댓글 리스트
	List<NoticeComDTO> getNoticeComList(NoticeComDTO noticee) throws Exception;
	
	//게시판 상세 댓글 크기 가져오기
	NoticeComDTO getNoticeComListCnt(NoticeComDTO noticee)   throws Exception;
	
	
	/*
	#############################################################################
	#							사업자 서비스 시작									#
	#############################################################################
	 */
	
	//게시판 리스트
	List<NoticeDTO> getBusiList(NoticeDTO noticeDto)			throws Exception;
	
	//게시판 리스트 크기 가져오기
	NoticeDTO getBusiListCnt(NoticeDTO noticeDto) 				throws Exception;
	
	//댓글 리스트
	List<NoticeComDTO> getBusiCommentList(NoticeComDTO noticee)	throws Exception;
	
	//댓글 리스트 크기 가져오기
	NoticeComDTO getBusiCommentListCnt(NoticeComDTO noticee)		throws Exception;	
	
	/*
	#############################################################################
	#							사업자 서비스 끝									#
	#############################################################################
	 */	
	
}