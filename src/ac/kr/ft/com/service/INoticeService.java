package ac.kr.ft.com.service;

import java.util.List;

import ac.kr.ft.com.dto.NoticeComDTO;
import ac.kr.ft.com.dto.NoticeDTO;

public interface INoticeService {
	//관리자 웹 게시판 리스트
	List<NoticeDTO> getNoticeList() throws Exception;

	//관리자 웹 게시판 상세보기
	NoticeDTO getNoticeDetail(NoticeDTO noticeDto, NoticeComDTO noticee) throws Exception;

	//글등록하기 리스트 
	boolean createNoticeInfo(NoticeDTO noticeDto) throws Exception;

	
	boolean deleteNoticeInfo(NoticeDTO noticeDto) throws Exception;

	boolean updateNoticeInfo(NoticeDTO noticeDto) throws Exception;

	void updateCntUpper(NoticeDTO noticeDto) throws Exception;

	boolean deleteAllCheckList(NoticeDTO noticeDto) throws Exception;

	// 댓글번호 증가
	void updatecomUppder(NoticeComDTO noticee) throws Exception;

	NoticeDTO getNoticeDetailInfo(NoticeDTO noticeDto) throws Exception;

	boolean createComment(NoticeComDTO noticee) throws Exception;

	boolean deleteComment(NoticeComDTO noticee) throws Exception;

	boolean updateComment(NoticeComDTO noticee) throws Exception;
	
	// 게시판과 댓글 함께 지우기
	boolean deleteCommentInfo(NoticeDTO noticeDto) throws Exception;
	
	//게시판 댓글 리스트 가져오기
	NoticeComDTO getNoticeComList(NoticeComDTO noticee) throws Exception;

	// 이벤트 상세보기
	NoticeDTO busiNoticeDetail(NoticeDTO noticeDto) throws Exception;
	

	/*
	#############################################################################
	#							사업자 서비스 시작									#
	#############################################################################
	 */
	
	
	NoticeDTO getBusiList(NoticeDTO noticeDto) throws Exception;
	
	
	NoticeComDTO getBusiCommentList(NoticeComDTO noticee) throws Exception;

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
	NoticeDTO getGuestList(NoticeDTO noticeDto) throws Exception;
	
	

	/*
	#############################################################################
	#							사용자 서비스 끝									#
	#############################################################################
	 */
	
	
}