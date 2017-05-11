package ac.kr.ft.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import ac.kr.ft.com.dto.MenuComDTO;
import ac.kr.ft.com.dto.MenuInfoDTO;
import ac.kr.ft.com.persistance.mapper.MenuMapper;
import ac.kr.ft.com.service.IMenuService;

@Service("MenuService")
public   class MenuService implements IMenuService {
	private Logger log = Logger.getLogger(this.getClass());
	

	@Resource(name = "MenuMapper")
	private MenuMapper menuMapper;
	
	@Override
	public List<MenuInfoDTO> getMENUList() throws Exception {
		return menuMapper.getMENUList();
	}

	@Override
	public MenuInfoDTO getMENUDetail(MenuInfoDTO menuinfoDto, MenuComDTO menuu) throws Exception {

		// 상세정보 가져오기
		MenuInfoDTO rDTO = menuMapper.getMENUDetail(menuinfoDto);

		// 댓글 리스트 가져오기
		rDTO.setrList(menuMapper.getMenuComList(menuu));

		return rDTO;

	}

	@Override
	public MenuInfoDTO getMenuDetailInfo(MenuInfoDTO menuInfoDTO) throws Exception {

		return menuMapper.getMENUDetail(menuInfoDTO);
	}

	@Override
	public boolean createMENUInfo(MenuInfoDTO menuinfoDto) throws Exception {
		int a = menuMapper.createMENUInfo(menuinfoDto);
		if (a != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteMENUInfo(MenuInfoDTO menuinfoDto) throws Exception {
		int b = menuMapper.deleteCommentInfo(menuinfoDto);
		int a = menuMapper.deleteMENUInfo(menuinfoDto);
		if (a != 0 && b != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateMENUInfo(MenuInfoDTO menuinfoDto) throws Exception {
		int a = menuMapper.updateMENUInfo(menuinfoDto);
		if (a != 0) {
			return true;
		}
		return false;
	}
	@Override
	public void updatecomUppder(MenuComDTO menuu) throws Exception {
		menuMapper.updatecomUppder(menuu);
	}

	@Override
	public boolean deleteAllCheckList(MenuInfoDTO menuinfoDto) throws Exception {
		int b = menuMapper.deleteAllCheckListComment(menuinfoDto);
		int a = menuMapper.deleteAllCheckList(menuinfoDto);
		if (a != 0 && b != 0) {
			return true;
		}
		return false;
	}

	// 댓글 리스트
	@Override
	
	 public MenuComDTO getMenuComList(MenuComDTO menuu) throws Exception {
		//댓글 리스트 수 가져오기
		MenuComDTO rDTO = menuMapper.getMenuComListCnt(menuu);
		
		//댓글 리스트 가져오기
		rDTO.setrList(menuMapper.getMenuComList(menuu));
		
		return rDTO;
	 }

	
	// 댓글 삭제
		@Override
		public boolean deleteCommentInfo(MenuInfoDTO menuinfoDto) throws Exception {
			int a = menuMapper.deleteCommentInfo(menuinfoDto);
			if (a != 0) {
				return true;
			}
			return false;
		}
		
		@Override
		public boolean createComment(MenuComDTO menuu) throws Exception {
			log.info("Service : createComment Start!");
			
			  int a = menuMapper.createComment(menuu);

			  log.info("Service a : " + a);
			  log.info("Service : createComment End!");

			  if (a != 0) {
			   return true;
			  }
			  return false;
			 }

		@Override
		public boolean updateComment(MenuComDTO menuu) throws Exception {

			int a = menuMapper.updateComment(menuu);
			if (a != 0) {
				return true;
			}
			return false;
		}

		@Override
		public boolean deleteComment(MenuComDTO menuu) throws Exception {
			int a = menuMapper.deleteComment(menuu);
			if (a != 0) {
				return true;
			}
			return false;
		}
		@Override
		 public MenuInfoDTO BusiMenuDetail(MenuInfoDTO menuInfoDTO) throws Exception {

		  
		  // 상세정보 가져오기
			MenuInfoDTO rDTO = menuMapper.getMENUDetail(menuInfoDTO);

		  return rDTO;
		 }
		
		
		@Override
		 public MenuInfoDTO UserMenuDetail(MenuInfoDTO menuInfoDTO) throws Exception {

		  
		  // 상세정보 가져오기
			MenuInfoDTO rDTO = menuMapper.getMENUDetail(menuInfoDTO);

		  return rDTO;
		 }

		 /*
		  * #########################################################################
		  * #### # 사업자 서비스 시작 #
		  * #########################################################################
		  * ####
		  */

		

	

		 // 댓글 리스트(사업자)
		 @Override
		 public MenuComDTO getBusiCommentList(MenuComDTO menuu) throws Exception {
			
		  // 게시판 리스트 수 가져오기
			 
		  MenuComDTO rDTO = menuMapper.getBusiCommentListCnt(menuu);

		  // 게시판 리스트 가져오기
		  rDTO.setrList(menuMapper.getBusiCommentList(menuu));

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

		

	

		 // 댓글 리스트(사업자)
		 @Override
		 public MenuComDTO getUserCommentList(MenuComDTO menuu) throws Exception {
			
		  // 게시판 리스트 수 가져오기
			 
		  MenuComDTO rDTO = menuMapper.getUserCommentListCnt(menuu);

		  // 게시판 리스트 가져오기
		  rDTO.setrList(menuMapper.getUserCommentList(menuu));

		  return rDTO;
		 }

		
}

		

		 /*
		  * #########################################################################
		  * #### # 사용자 서비스 끝 #
		  * #########################################################################
		  * ####
		  */
		 
		 
		 
		 
		 
		 

	



