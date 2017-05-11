package ac.kr.ft.com.persistance.mapper;

import java.util.List;

import ac.kr.ft.com.dto.EventComDTO;
import ac.kr.ft.com.dto.EventDTO;
import config.Mapper;

@Mapper("EventMapper")
public interface EventMapper {

    List<EventDTO> getEventList() 					throws Exception;
 

    EventDTO getEventDetail(EventDTO eventDto)		throws Exception;

    
    int createEventInfo(EventDTO eventDto)			throws Exception;

	int deleteEventInfo(EventDTO eventDto)			throws Exception;

	int updateEventInfo(EventDTO eventDto)			throws Exception;

	void updateCntUppder(EventDTO eventDto) 		throws Exception;
	
	int deleteAllCheckList(EventDTO eventDto)		throws Exception;
	
	int deleteCommentInfo(EventDTO eventDto)		throws Exception; //댓글 삭제

	void updatecomUppder(EventComDTO evee)			throws Exception; //댓글번호 증가
	
	
	int deleteAllCheckListComment(EventDTO eventDto)  throws Exception;

	//댓글 등록
	int createComment(EventComDTO evee)				 throws Exception;
		
	//댓글 삭제 한개한개 삭제
	int deleteComment(EventComDTO evee) 			 throws Exception;

	//댓글 수정
	int updateComment(EventComDTO evee) 			 throws Exception;

	
	//게시판 상세 댓글 리스트
	List<EventComDTO> getEventComList(EventComDTO evee) throws Exception;
	
	//게시판 상세 댓글 크기 가져오기
	EventComDTO getEventComListCnt(EventComDTO evee)   throws Exception;
	
	
	/*
	#############################################################################
	#							사업자 서비스 시작									#
	#############################################################################
	 */
	
	//게시판 리스트
	List<EventDTO> getBusiList(EventDTO eventDto)			throws Exception;
	
	//게시판 리스트 크기 가져오기
	EventDTO getBusiListCnt(EventDTO eventDto) 				throws Exception;
	
	//댓글 리스트
	List<EventComDTO> getBusiCommentList(EventComDTO evee)	throws Exception;
	
	//댓글 리스트 크기 가져오기
	EventComDTO getBusiCommentListCnt(EventComDTO evee)		throws Exception;	
	
	/*
	#############################################################################
	#							사업자 서비스 끝									#
	#############################################################################
	 */	
	
}
