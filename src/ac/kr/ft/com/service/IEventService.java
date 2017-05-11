package ac.kr.ft.com.service;

import java.util.List;

import ac.kr.ft.com.dto.EventComDTO;
import ac.kr.ft.com.dto.EventDTO;

public interface IEventService {
	//관리자 웹 게시판 리스트
	List<EventDTO> getEventList() throws Exception;

	//관리자 웹 게시판 상세보기
	EventDTO getEventDetail(EventDTO eventDto, EventComDTO evee) throws Exception;

	//글등록하기 리스트 
	boolean createEventInfo(EventDTO eventDto) throws Exception;

	
	boolean deleteEventInfo(EventDTO eventDto) throws Exception;

	boolean updateEventInfo(EventDTO eventDto) throws Exception;

	void updateCntUpper(EventDTO eventDto) throws Exception;

	boolean deleteAllCheckList(EventDTO eventDto) throws Exception;

	// 댓글번호 증가
	void updatecomUppder(EventComDTO evee) throws Exception;

	EventDTO getEventDetailInfo(EventDTO eventDto) throws Exception;

	boolean createComment(EventComDTO evee) throws Exception;

	boolean deleteComment(EventComDTO evee) throws Exception;

	boolean updateComment(EventComDTO evee) throws Exception;
	
	// 게시판과 댓글 함께 지우기
	boolean deleteCommentInfo(EventDTO eventDto) throws Exception;
	
	//게시판 댓글 리스트 가져오기
	EventComDTO getEventComList(EventComDTO evee) throws Exception;

	// 이벤트 상세보기
	EventDTO busiEventDetail(EventDTO eventDto) throws Exception;
	
	
	/*
	#############################################################################
	#							사업자 서비스 시작									#
	#############################################################################
	 */
	
	EventDTO getBusiList(EventDTO eventDto) throws Exception;
	
	
	EventComDTO getBusiCommentList(EventComDTO evee) throws Exception;

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
	
	EventDTO getGuestList(EventDTO eventDto) throws Exception;
	
	
	
		
	/*
	#############################################################################
	#							사용자 서비스 끝									#
	#############################################################################
	 */
	
	
}
