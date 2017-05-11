package ac.kr.ft.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ac.kr.ft.com.dto.CommunityComDTO;
import ac.kr.ft.com.dto.CommunityDTO;
import ac.kr.ft.com.persistance.mapper.CommunityMapper;
import ac.kr.ft.com.service.ICommunityService;

@Service("CommunityService")
public class CommunityService implements ICommunityService {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "CommunityMapper")
	private CommunityMapper communitydao;

	@Override
	public List<CommunityDTO> getCommunityList() throws Exception {

		return communitydao.getCommunityList();
	}

	@Override
	public CommunityDTO getCommunityDetail(CommunityDTO communityDto, CommunityComDTO comDto) throws Exception {

		// 조회수 올리기
		communitydao.updateCntUppder(communityDto);

		// 상세정보 가져오기
		CommunityDTO rDTO = communitydao.getCommunityDetail(communityDto);

		// 댓글 리스트 가져오기
		rDTO.setrList(communitydao.getCommunityComList(comDto));

		return rDTO;
	}

	@Override
	public CommunityDTO getCommunityDetailInfo(CommunityDTO communityDto) throws Exception {

		return communitydao.getCommunityDetail(communityDto);
	}

	@Override
	public boolean createCommunityInfo(CommunityDTO communityDto) throws Exception {

		int a = communitydao.createCommunityInfo(communityDto);
		if (a != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteCommunityInfo(CommunityDTO communityDto) throws Exception {
		int b = communitydao.deleteCommentInfo(communityDto);
		int a = communitydao.deleteCommunityInfo(communityDto);

		if (a != 0 && b != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateCommunityInfo(CommunityDTO communityDto) throws Exception {
		int a = communitydao.updateCommunityInfo(communityDto);
		if (a != 0) {
			return true;
		}
		return false;
	}

	@Override
	public void updateCntUpper(CommunityDTO communityDto) throws Exception {
		communitydao.updateCntUppder(communityDto);
	}

	@Override
	public void updatecomUppder(CommunityComDTO comDto) throws Exception {
		communitydao.updatecomUppder(comDto);
	}

	@Override
	public boolean deleteAllCheckList(CommunityDTO communityDto) throws Exception {
		int b = communitydao.deleteAllCheckListComment(communityDto);
		int a = communitydao.deleteAllCheckList(communityDto);
		if (a != 0 && b != 0) {
			return true;
		}
		return false;
	}



	// 댓글 삭제
	@Override
	public boolean deleteCommentInfo(CommunityDTO communityDto) throws Exception {
		int a = communitydao.deleteCommentInfo(communityDto);
		if (a != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean createComment(CommunityComDTO comDto) throws Exception {

		log.info("Service : createComment Start!");
		int a = communitydao.createComment(comDto);

		log.info("Service a : " + a);
		log.info("Service : createComment End!");

		if (a != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateComment(CommunityComDTO comDto) throws Exception {

		int a = communitydao.updateComment(comDto);
		if (a != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteComment(CommunityComDTO comDto) throws Exception {
		int a = communitydao.deleteComment(comDto);
		if (a != 0) {
			return true;
		}
		return false;
	}

	
	
	// 댓글 리스트
	@Override
	public CommunityComDTO getCommunityComList(CommunityComDTO comDto) throws Exception {

		// 댓글 리스트 수 가져오기
		CommunityComDTO rDTO = communitydao.getCommunityComListCnt(comDto);

		// 댓글 리스트 가져오기
		rDTO.setrList(communitydao.getCommunityComList(comDto));

		return rDTO;
	}
	
	
	
	@Override
	public CommunityDTO busiCommunityDetail(CommunityDTO communityDto) throws Exception {

		// 조회수 올리기
		communitydao.updateCntUppder(communityDto);

		// 상세정보 가져오기
		CommunityDTO rDTO = communitydao.getCommunityDetail(communityDto);

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
	public CommunityDTO getBusiList(CommunityDTO communityDto) throws Exception {

		CommunityDTO rDTO = communitydao.getBusiListCnt(communityDto);

		rDTO.seteList(communitydao.getBusiList(communityDto));
		
		return rDTO;

	}

	// 댓글 리스트(사업자)
	@Override
	public CommunityComDTO getBusiCommentList(CommunityComDTO comDto) throws Exception {

		// 게시판 리스트 수 가져오기
		CommunityComDTO rDTO = communitydao.getBusiCommentListCnt(comDto);

		// 게시판 리스트 가져오기
		rDTO.setrList(communitydao.getBusiCommentList(comDto));

		return rDTO;
	}

	/*
	 * #########################################################################
	 * #### # 사업자 서비스 끝 #
	 * #########################################################################
	 * ####
	 */

}

	