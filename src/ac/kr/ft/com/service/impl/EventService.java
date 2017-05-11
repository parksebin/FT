package ac.kr.ft.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ac.kr.ft.com.dto.EventComDTO;
import ac.kr.ft.com.dto.EventDTO;
import ac.kr.ft.com.persistance.mapper.EventMapper;
import ac.kr.ft.com.service.IEventService;

@Service("EventService")
public class EventService implements IEventService {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "EventMapper")
	private EventMapper eventdao;

	@Override
	public List<EventDTO> getEventList() throws Exception {

		return eventdao.getEventList();
	}

	@Override
	public EventDTO getEventDetail(EventDTO eventDto, EventComDTO evee) throws Exception {

		// 조회수 올리기
		eventdao.updateCntUppder(eventDto);

		// 상세정보 가져오기
		EventDTO rDTO = eventdao.getEventDetail(eventDto);

		// 댓글 리스트 가져오기
		rDTO.setrList(eventdao.getEventComList(evee));

		return rDTO;
	}

	@Override
	public EventDTO getEventDetailInfo(EventDTO eventDto) throws Exception {

		return eventdao.getEventDetail(eventDto);
	}

	
	@Override
	public boolean createEventInfo(EventDTO eventDto) throws Exception {

		int a = eventdao.createEventInfo(eventDto);
		if (a != 0) {
			return true;
		}
		return false;
	}

	
	@Override
	public boolean deleteEventInfo(EventDTO eventDto) throws Exception {
		int b = eventdao.deleteCommentInfo(eventDto);
		int a = eventdao.deleteEventInfo(eventDto);

		if (a != 0 && b != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateEventInfo(EventDTO eventDto) throws Exception {
		int a = eventdao.updateEventInfo(eventDto);
		if (a != 0) {
			return true;
		}
		return false;
	}

	//댓글올리기
	@Override
	public void updateCntUpper(EventDTO eventDto) throws Exception {
		eventdao.updateCntUppder(eventDto);
	}

	
	@Override
	public void updatecomUppder(EventComDTO evee) throws Exception {
		eventdao.updatecomUppder(evee);
	}

	@Override
	public boolean deleteAllCheckList(EventDTO eventDto) throws Exception {
		int b = eventdao.deleteAllCheckListComment(eventDto);
		int a = eventdao.deleteAllCheckList(eventDto);
		if (a != 0 && b != 0) {
			return true;
		}
		return false;
	}



	// 댓글 삭제
	@Override
	public boolean deleteCommentInfo(EventDTO eventDto) throws Exception {
		int a = eventdao.deleteCommentInfo(eventDto);
		if (a != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean createComment(EventComDTO evee) throws Exception {

		log.info("Service : createComment Start!");
		int a = eventdao.createComment(evee);

		log.info("Service a : " + a);
		log.info("Service : createComment End!");

		if (a != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateComment(EventComDTO evee) throws Exception {

		int a = eventdao.updateComment(evee);
		if (a != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteComment(EventComDTO evee) throws Exception {
		int a = eventdao.deleteComment(evee);
		if (a != 0) {
			return true;
		}
		return false;
	}

	
	
	// 댓글 리스트
	@Override
	public EventComDTO getEventComList(EventComDTO evee) throws Exception {

		// 댓글 리스트 수 가져오기
		EventComDTO rDTO = eventdao.getEventComListCnt(evee);

		// 댓글 리스트 가져오기
		rDTO.setrList(eventdao.getEventComList(evee));

		return rDTO;
	}
	
	
	
	@Override
	public EventDTO busiEventDetail(EventDTO eventDto) throws Exception {

		// 조회수 올리기
		eventdao.updateCntUppder(eventDto);

		// 상세정보 가져오기
		EventDTO rDTO = eventdao.getEventDetail(eventDto);

		return rDTO;
	}

	
	
	/*
	 * #########################################################################
	 * #### # 사업자 서비스 시작 #
	 * #########################################################################
	 * ####
	 */

	// 게시판 리스트(사업자)
	@Override
	public EventDTO getBusiList(EventDTO eventDto) throws Exception {

		EventDTO rDTO = eventdao.getBusiListCnt(eventDto);

		
		rDTO.seteList(eventdao.getBusiList(eventDto));

		return rDTO;

	}

	// 댓글 리스트(사업자)
	@Override
	public EventComDTO getBusiCommentList(EventComDTO evee) throws Exception {

		// 게시판 리스트 수 가져오기
		EventComDTO rDTO = eventdao.getBusiCommentListCnt(evee);

		// 게시판 리스트 가져오기
		rDTO.setrList(eventdao.getBusiCommentList(evee));

		return rDTO;
	}

	/*
	 * #########################################################################
	 * #### # 사업자 서비스 끝 #
	 * #########################################################################
	 * ####
	 */

	/*
	 * #########################################################################
	 * #### # 사용자 서비스 시작 #
	 * #########################################################################
	 * ####
	 */

	 @Override
	public EventDTO getGuestList(EventDTO eventDto) throws Exception {
		
		 
		 
		 
		return null;
	}
	
	/*
	 * #########################################################################
	 * #### # 사용자 서비스 끝 #
	 * #########################################################################
	 * ####
	 */
	
	
}
