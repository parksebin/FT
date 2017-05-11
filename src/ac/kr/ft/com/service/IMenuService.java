package ac.kr.ft.com.service;

import java.util.List;

import ac.kr.ft.com.dto.MenuComDTO;
import ac.kr.ft.com.dto.MenuInfoDTO;

public interface IMenuService {
	List<MenuInfoDTO> getMENUList() throws Exception;

	MenuInfoDTO getMENUDetail(MenuInfoDTO menuinfoDto, MenuComDTO menuu) throws Exception;

	boolean createMENUInfo(MenuInfoDTO menuinfoDto) throws Exception;

	boolean deleteMENUInfo(MenuInfoDTO menuinfoDto) throws Exception;

	boolean updateMENUInfo(MenuInfoDTO menuinfoDto) throws Exception;

	boolean deleteAllCheckList(MenuInfoDTO menuinfoDto) throws Exception;

	// 댓글번호 증가
	void updatecomUppder(MenuComDTO menuu) throws Exception;

	MenuInfoDTO getMenuDetailInfo(MenuInfoDTO menuinfoDto) throws Exception;

	boolean createComment(MenuComDTO menuu) throws Exception;

	boolean deleteComment(MenuComDTO menuu) throws Exception;

	boolean updateComment(MenuComDTO menuu) throws Exception;

	// 게시판과 댓글 함께 지우기
	boolean deleteCommentInfo(MenuInfoDTO menuinfoDto) throws Exception;

	// 댓글 리스트 가져오기
	MenuComDTO getMenuComList(MenuComDTO menuu) throws Exception;

	//메뉴상세
	MenuInfoDTO BusiMenuDetail(MenuInfoDTO menuinfoDto) throws Exception;

	MenuInfoDTO UserMenuDetail(MenuInfoDTO menuinfoDto) throws Exception;

	/*
	 * #########################################################################
	 * #### # 사업자 서비스 시작 (아작스) #
	 * #########################################################################
	 * ####
	 */

	

	MenuComDTO getBusiCommentList(MenuComDTO menuu) throws Exception;

	
	/*
	 * #########################################################################
	 * #### # 사업자 서비스 끝 #
	 * #########################################################################
	 * ####
	 */

	/*
	 * #########################################################################
	 * #### # 사용자 서비스 시작 (아작스) #
	 * #########################################################################
	 * ####
	 */

	

	MenuComDTO getUserCommentList(MenuComDTO menuu) throws Exception;

	
	/*
	 * #########################################################################
	 * #### # 사용자 서비스 끝 #
	 * #########################################################################
	 * ####
	 */
}
