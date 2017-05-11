package ac.kr.ft.com.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import ac.kr.ft.com.dto.UserDTO;
import ac.kr.ft.com.service.IUserService;
import ac.kr.ft.com.util.CmmUtil;

@Controller
public class UserController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "UserService")
	private IUserService user;


	/*
	 * #########################################################################
	 * #########################################################################
	 * #
	 * 
	 */

	@RequestMapping("user/userlist")
	public String getUserList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Wellcom user/userlist");

		List<UserDTO> rList = user.getUserList();

		log.info(rList);

		model.addAttribute("rList", rList);

		log.info(rList);
		log.info("End user/userlist");

		return "/user/userlist";
	}

	@RequestMapping("user/userdetail")
	public String getUserDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Wellcom user/userdetail");

		UserDTO userDto = new UserDTO();
		userDto.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));

		log.info(CmmUtil.nvl(request.getParameter("user_no")));

		userDto = user.getUserDetail(userDto);
		model.addAttribute("userDTO", userDto);
		log.info("End user/userdetail");
		return "/user/userdetail";
	}

	@RequestMapping("user/userinsertForm")
	public String insertForm(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		log.info("Wellcom and End user/userinsertForm");
		return "user/userinsert";
	}

	@RequestMapping("user/userinsert")
	public String insertUserInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Wellcom user/userinsert");

		UserDTO userDto = new UserDTO();

		log.info(CmmUtil.nvl(request.getParameter("user_id")));
		log.info(CmmUtil.nvl(request.getParameter("user_name")));
		log.info(CmmUtil.nvl(request.getParameter("password")));
		log.info(CmmUtil.nvl(request.getParameter("checkpassword")));
		log.info(CmmUtil.nvl(request.getParameter("tel_1")));
		log.info(CmmUtil.nvl(request.getParameter("tel_2")));
		log.info(CmmUtil.nvl(request.getParameter("tel_3")));
		log.info(CmmUtil.nvl(request.getParameter("email1")));
		log.info(CmmUtil.nvl(request.getParameter("email2")));
		log.info(CmmUtil.nvl(request.getParameter("birthday")));

		userDto.setUser_id(CmmUtil.nvl(request.getParameter("user_id")));
		userDto.setUser_name(CmmUtil.nvl(request.getParameter("user_name")));
		userDto.setPassword(CmmUtil.nvl(request.getParameter("password")));
		userDto.setCheckpassword(CmmUtil.nvl(request.getParameter("checkpassword")));
		userDto.setTel_1(CmmUtil.nvl(request.getParameter("tel_1")));
		userDto.setTel_2(CmmUtil.nvl(request.getParameter("tel_2")));
		userDto.setTel_3(CmmUtil.nvl(request.getParameter("tel_3")));
		userDto.setEmail1(CmmUtil.nvl(request.getParameter("email1")));
		userDto.setEmail2(CmmUtil.nvl(request.getParameter("email2")));
		userDto.setBirthday(CmmUtil.nvl(request.getParameter("birthday")));

		if (user.createUserInfo(userDto)) {
			model.addAttribute("msg", "가입이 완료되었습니다");
		} else {
			model.addAttribute("msg", "가입이 실패되었습니다");
		}

		log.info("End user/userinset");

		return "/openerClose";
	}

	@RequestMapping("user/delete")
	public String deleteUserInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Wellcom user/delete");
		UserDTO userDto = new UserDTO();

		log.info(CmmUtil.nvl(request.getParameter("user_no")));

		userDto.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));

		if (user.deleteUserInfo(userDto)) {
			model.addAttribute("msg", "삭제가 완료되었습니다");
		} else {
			model.addAttribute("msg", "삭제가 실패되었습니다");
		}
		request.setAttribute("url", "userlist.do");
		log.info("End user/delete");
		return "/redirect";
	}

	@RequestMapping("user/userupdateForm")
	public String updateForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Wellcom user/userupdateForm");
		UserDTO userDto = new UserDTO();
		userDto.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));
		log.info(CmmUtil.nvl(request.getParameter("user_no")));
		userDto = user.getUserDetail(userDto);
		model.addAttribute("userDto", userDto);

		log.info("End user/userupdateForm");

		return "/user/userupdateForm";
	}

	@RequestMapping("user/userupdate")
	public String updateUserInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Wellcom user/userupdate");
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		response.setCharacterEncoding("EUC-KR");
		UserDTO userDto = new UserDTO();

		log.info(CmmUtil.nvl(request.getParameter("user_no")));
		log.info(CmmUtil.nvl(request.getParameter("user_id")));
		log.info(CmmUtil.nvl(request.getParameter("user_name")));
		log.info(CmmUtil.nvl(request.getParameter("password")));
		log.info(CmmUtil.nvl(request.getParameter("checkpassword")));
		log.info(CmmUtil.nvl(request.getParameter("tel_1")));
		log.info(CmmUtil.nvl(request.getParameter("tel_2")));
		log.info(CmmUtil.nvl(request.getParameter("tel_3")));
		log.info(CmmUtil.nvl(request.getParameter("email1")));
		log.info(CmmUtil.nvl(request.getParameter("email2")));
		log.info(CmmUtil.nvl(request.getParameter("birthday")));
		log.info(CmmUtil.nvl(request.getParameter("mileage")));
		
		userDto.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));
		userDto.setUser_id(CmmUtil.nvl(request.getParameter("user_id")));
		userDto.setUser_name(CmmUtil.nvl(request.getParameter("user_name")));
		userDto.setPassword(CmmUtil.nvl(request.getParameter("password")));
		userDto.setCheckpassword(CmmUtil.nvl(request.getParameter("checkpassword")));
		userDto.setTel_1(CmmUtil.nvl(request.getParameter("tel_1")));
		userDto.setTel_2(CmmUtil.nvl(request.getParameter("tel_2")));
		userDto.setTel_3(CmmUtil.nvl(request.getParameter("tel_3")));
		userDto.setEmail1(CmmUtil.nvl(request.getParameter("email1")));
		userDto.setEmail2(CmmUtil.nvl(request.getParameter("email2")));
		userDto.setBirthday(CmmUtil.nvl(request.getParameter("birthday")));

		if (user.updateUserInfo(userDto)) {
			model.addAttribute("msg", "수정이 완료되었습니다");
		} else {
			model.addAttribute("msg", "수정이 실패되었습니다");
		}
		model.addAttribute("url", "userlist.do");
		log.info("End user/userupdate");
		return "/redirect";
	}

	@RequestMapping("user/loginform")
	public String login(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		log.info("Wellcom and End user/loginform");
		return "/user/loginform";
	}

	@RequestMapping("user/loginproc")
	public String loginproc(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		log.info("Wellcom user/loginproc");
		UserDTO loginDto = new UserDTO();

		log.info(CmmUtil.nvl(request.getParameter("user_id")));
		log.info(CmmUtil.nvl(request.getParameter("password")));

		loginDto.setUser_id(CmmUtil.nvl(request.getParameter("user_id")));
		loginDto.setPassword(CmmUtil.nvl(request.getParameter("password")));

		loginDto = user.getLogin(loginDto);
		model.addAttribute("loginDto", loginDto);
		if (loginDto == null) {
			model.addAttribute("msg", "권한이 없거나 로그인이 실패하였습니다.");
			model.addAttribute("url", "loginform.do");
		} else {
			request.getSession().setAttribute("ADMINAUTH", loginDto.getAuth());
			request.getSession().setAttribute("ADMINUSER_NAME", loginDto.getUser_name());
			request.getSession().setAttribute("ADMINUSER_NO", loginDto.getUser_no());
			model.addAttribute("msg", "로그인 되었습니다.");
			model.addAttribute("url", "/index.jsp");
		}
		log.info("End user/loginproc");
		return "/redirect";
	}

	@RequestMapping("user/logout")
	public String logout(HttpSession session) {//
		log.info("Wellcom user/logout");
		session.setAttribute("ADMINAUTH", "");
		session.setAttribute("ADMINUSER_NAME", "");
		session.setAttribute("ADMINUSER_NO", "");
		log.info("End user/logout");
		return "/user/logout";//
	}

	@RequestMapping("user/idfindform")
	public String idfindform(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		log.info("Wellcom and End user/idfindform");
		return "/user/idfindform";
	}

	@RequestMapping("user/idfindproc")
	public String idfindproc(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Wellcom user/idfindproc");

		UserDTO idfindDto = new UserDTO();

		log.info(CmmUtil.nvl(request.getParameter("user_name")));
		log.info(CmmUtil.nvl(request.getParameter("user_id")));
		log.info(CmmUtil.nvl(request.getParameter("email1")));
		log.info(CmmUtil.nvl(request.getParameter("email2")));

		idfindDto.setUser_name(CmmUtil.nvl(request.getParameter("user_name")));
		idfindDto.setUser_id(CmmUtil.nvl(request.getParameter("user_id")));
		idfindDto.setEmail1(CmmUtil.nvl(request.getParameter("email1")));
		idfindDto.setEmail2(CmmUtil.nvl(request.getParameter("email2")));

		UserDTO rDTO = user.getIdfind(idfindDto);
		model.addAttribute("rDTO", rDTO);
		if (rDTO == null) {
			rDTO = new UserDTO();
		}

		idfindDto = null;
		rDTO = null;

		log.info("End user/IdFindProc");
		return "/user/idSearchResult";

	}
	
	@RequestMapping("user/pwfindform")
	public String pwfindform(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		log.info("Wellcom and End user/pwfindform");
		return "/user/pwfindform";
	}

	@RequestMapping("user/pwfindproc")
	public String pwfindproc(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Wellcom user/pwfindproc");

		UserDTO pwfindDto = new UserDTO();

		log.info(CmmUtil.nvl(request.getParameter("user_name")));
		log.info(CmmUtil.nvl(request.getParameter("email1")));
		log.info(CmmUtil.nvl(request.getParameter("email2")));
		log.info(CmmUtil.nvl(request.getParameter("user_id")));

		pwfindDto.setUser_name(CmmUtil.nvl(request.getParameter("user_name")));
		pwfindDto.setEmail1(CmmUtil.nvl(request.getParameter("email1")));
		pwfindDto.setEmail2(CmmUtil.nvl(request.getParameter("email2")));
		pwfindDto.setUser_id(CmmUtil.nvl(request.getParameter("user_id")));

		UserDTO rDTO = user.getpwfind(pwfindDto);

		model.addAttribute("rDTO", rDTO);

		if (rDTO == null) {
			rDTO = new UserDTO();
		}

		pwfindDto = null;
		rDTO = null;

		log.info("End user/pwfindproc!!");
		return "/user/pwSearchResult";

	}

	@RequestMapping("user/pwchangeproc")
	public String pwfind(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		log.info("Wellcom user/pwchangeproc !!");

		UserDTO pwchangeDto = new UserDTO();

		log.info(CmmUtil.nvl(request.getParameter("user_no")));
		log.info(CmmUtil.nvl(request.getParameter("password")));
		log.info(CmmUtil.nvl(request.getParameter("checkpassword")));

		pwchangeDto.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));
		pwchangeDto.setPassword(CmmUtil.nvl(request.getParameter("password")));
		pwchangeDto.setCheckpassword(CmmUtil.nvl(request.getParameter("checkpassword")));
		if (user.getpwchange(pwchangeDto)) {
			model.addAttribute("msg", "비밀번호가 변경 되었습니다");
		} else {
			model.addAttribute("msg", "비밀번호가 변경 실패하였습니다");// 비밀번호가 이전과 같다면 넘어가지
															// 않게
		}

		pwchangeDto = null;

		model.addAttribute("url", "loginform.do");
		log.info("End user/pwchangeproc !!");

		return "/close";

	}

	/*
	 */
	@RequestMapping("user/UserDupInfo")
	public String getUserDupInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Wellcom getUserDupInfo");

		UserDTO checkDto = new UserDTO();

		log.info(CmmUtil.nvl(request.getParameter("user_id")));

		checkDto.setUser_id(CmmUtil.nvl(request.getParameter("user_id")));

		UserDTO rDTO = user.getUserDupInfo(checkDto);

		model.addAttribute("rDTO", rDTO);

		rDTO = null;
		checkDto = null;

		log.info("End getUserDupInfo!!");

		return "/user/UserDupInfo";
	}

	@RequestMapping("user/deleteCheck")
	public String deleteCheck(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Wellcom user/deleteCheck!!");
		String[] del_chk = request.getParameterValues("del_chk");

		UserDTO allcheckDto = new UserDTO();
		allcheckDto.setAllCheckSeq(del_chk);

		if (user.deleteAllUserInfo(allcheckDto)) {
			model.addAttribute("msg", "전체삭제가 완료되었습니다");
		} else {
			model.addAttribute("msg", "전체삭제가 실패되었습니다");
		}

		allcheckDto = null;

		model.addAttribute("url", "/user/userlist.do");
		log.info("End user/deleteCheck!!");
		return "/redirect";

	}

	/*
	 * #########################################################################
	 * #########################################################################
	 * #
	 * 
	 */

	/*
	 * #########################################################################
	 * #########################################################################
	 * #
	 * 
	 */

	@RequestMapping("/user/busiUserList")
	public String getbusiUserList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Wellcom user/busiUserList");
		if (request.getParameter("searchBox") != null && !request.getParameter("searchBox").equals("")) {
			log.info("aaa");
			String searchBox = request.getParameter("searchBox");
			String searchText = request.getParameter("searchText");
			if (searchText == null) {
				searchText = "";
			}
			model.addAttribute("searchBox", searchBox);
			log.info(searchBox);
			model.addAttribute("searchText", searchText);
			log.info(searchText);
		}
		return "/busi/user/busiUserList";

	}

	@RequestMapping("/user/busiUserIndex")
	public String getBusiIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info(">>>> page home start!!");

		log.info("Welcome /user/busiUserIndex !!");

		request.setCharacterEncoding("UTF-8");
		UserDTO pDTO = new UserDTO();

		pDTO.setStart_page(CmmUtil.nvl(request.getParameter("start_page"), "1"));
		pDTO.setEnd_page(CmmUtil.nvl(request.getParameter("end_page"), "6"));
		pDTO.setSearchBox(CmmUtil.nvl(request.getParameter("searchBox")));
		pDTO.setSearchText(CmmUtil.nvl(request.getParameter("searchText")));

		log.info("SearchBox : " + pDTO.getSearchBox());
		log.info("SearchText : " + pDTO.getSearchText());

		UserDTO rDTO = user.getbusiUserList(pDTO);
		log.info(CmmUtil.nvl(request.getParameter("start_page")));
		log.info(CmmUtil.nvl(request.getParameter("end_page")));
		log.info(CmmUtil.nvl(request.getParameter("user_no")));
		log.info(CmmUtil.nvl(request.getParameter("user_id")));
		log.info(CmmUtil.nvl(request.getParameter("email1")));
		log.info(CmmUtil.nvl(request.getParameter("email2")));
		log.info(rDTO);

		model.addAttribute("rDTO", rDTO);

		log.info("End /user/busiUserIndex !!");

		return "/busi/user/busiUserListJSON";
	}

	@RequestMapping("user/busiUserDetail")
	public String getBusiUserDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Wellcom user/userdetail");

		UserDTO userDto = new UserDTO();
		userDto.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));

		log.info(CmmUtil.nvl(request.getParameter("user_no")));

		userDto = user.getUserDetail(userDto);
		model.addAttribute("userDTO", userDto);
		log.info("End user/userdetail");
		return "/busi/user/busiUserDetail";
	}

	@RequestMapping("user/busiUserInsertForm")
	public String BusiinsertForm(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		log.info("Wellcom and End user/userinsertForm");
		return "/busi/user/busiUserInsert";
	}

	@RequestMapping("user/busiUserInsert")
	public String BusiinsertUserInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Wellcom user/userinsert");

		UserDTO userDto = new UserDTO();

		log.info(CmmUtil.nvl(request.getParameter("user_id")));
		log.info(CmmUtil.nvl(request.getParameter("user_name")));
		log.info(CmmUtil.nvl(request.getParameter("password")));
		log.info(CmmUtil.nvl(request.getParameter("checkpassword")));
		log.info(CmmUtil.nvl(request.getParameter("tel_1")));
		log.info(CmmUtil.nvl(request.getParameter("tel_2")));
		log.info(CmmUtil.nvl(request.getParameter("tel_3")));
		log.info(CmmUtil.nvl(request.getParameter("email1")));
		log.info(CmmUtil.nvl(request.getParameter("email2")));
		log.info(CmmUtil.nvl(request.getParameter("birthday")));

		userDto.setUser_id(CmmUtil.nvl(request.getParameter("user_id")));
		userDto.setUser_name(CmmUtil.nvl(request.getParameter("user_name")));
		userDto.setPassword(CmmUtil.nvl(request.getParameter("password")));
		userDto.setCheckpassword(CmmUtil.nvl(request.getParameter("checkpassword")));
		userDto.setTel_1(CmmUtil.nvl(request.getParameter("tel_1")));
		userDto.setTel_2(CmmUtil.nvl(request.getParameter("tel_2")));
		userDto.setTel_3(CmmUtil.nvl(request.getParameter("tel_3")));
		userDto.setEmail1(CmmUtil.nvl(request.getParameter("email1")));
		userDto.setEmail2(CmmUtil.nvl(request.getParameter("email2")));
		userDto.setBirthday(CmmUtil.nvl(request.getParameter("birthday")));

		if (user.createUserInfo(userDto)) {
			model.addAttribute("msg", "가입이 완료되었습니다");
			model.addAttribute("url", "/appmain.do");
		} else {
			model.addAttribute("msg", "가입이 실패되었습니다");
			model.addAttribute("url", "/user/busiUserInsertForm.do");
		}
		log.info("End user/userinset");
		return "/redirect";

	}

	@RequestMapping("user/busiDelete")
	public String BusideleteUserInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		log.info("Wellcom user/delete");
		UserDTO userDto = new UserDTO();

		log.info(CmmUtil.nvl(request.getParameter("user_no")));

		userDto.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));

		if (user.deleteUserInfo(userDto)) {
			model.addAttribute("msg", "삭제가 완료되었습니다");
			model.addAttribute("url", "busiUserList.do");
		} else {
			model.addAttribute("msg", "삭제가 실패되었습니다");
			model.addAttribute("url", "busiUserList.do");
		}

		log.info("End user/delete");
		return "/redirect";
	}

	@RequestMapping("user/busiUserUpdateForm")
	public String BusiupdateForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Wellcom user/userupdateForm");
		UserDTO userDto = new UserDTO();
		userDto.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));
		log.info(CmmUtil.nvl(request.getParameter("user_no")));
		userDto = user.getUserDetail(userDto);
		model.addAttribute("userDto", userDto);

		log.info("End user/busiUserUpdateForm");

		return "/busi/user/busiUserUpdateForm";
	}

	@RequestMapping("user/busiUserUpdate")
	public String BusiupdateUserInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Wellcom user/userupdate");
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		response.setCharacterEncoding("EUC-KR");
		UserDTO userDto = new UserDTO();

		log.info(CmmUtil.nvl(request.getParameter("user_no")));
		log.info(CmmUtil.nvl(request.getParameter("user_id")));
		log.info(CmmUtil.nvl(request.getParameter("user_name")));
		log.info(CmmUtil.nvl(request.getParameter("password")));
		log.info(CmmUtil.nvl(request.getParameter("tel_1")));
		log.info(CmmUtil.nvl(request.getParameter("tel_2")));
		log.info(CmmUtil.nvl(request.getParameter("tel_3")));
		log.info(CmmUtil.nvl(request.getParameter("email1")));
		log.info(CmmUtil.nvl(request.getParameter("email2")));
		log.info(CmmUtil.nvl(request.getParameter("birthday")));
		log.info(CmmUtil.nvl(request.getParameter("mileage")));

		userDto.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));
		userDto.setUser_id(CmmUtil.nvl(request.getParameter("user_id")));
		userDto.setUser_name(CmmUtil.nvl(request.getParameter("user_name")));
		userDto.setPassword(CmmUtil.nvl(request.getParameter("password")));
		userDto.setCheckpassword(CmmUtil.nvl(request.getParameter("checkpassword")));
		userDto.setTel_1(CmmUtil.nvl(request.getParameter("tel_1")));
		userDto.setTel_2(CmmUtil.nvl(request.getParameter("tel_2")));
		userDto.setTel_3(CmmUtil.nvl(request.getParameter("tel_3")));
		userDto.setEmail1(CmmUtil.nvl(request.getParameter("email1")));
		userDto.setEmail2(CmmUtil.nvl(request.getParameter("email2")));
		userDto.setBirthday(CmmUtil.nvl(request.getParameter("birthday")));
		userDto.setMileage(CmmUtil.nvl(request.getParameter("mileage")));
		if (user.updateUserInfo(userDto)) {
			model.addAttribute("msg", "수정이 완료되었습니다");
		} else {
			model.addAttribute("msg", "수정이 실패되었습니다");
		}
		model.addAttribute("url", "busiUserList.do");
		log.info("End user/userupdate");
		return "/redirect";
	}

	@RequestMapping("user/appLoginForm")
	public String applogin(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		log.info("Wellcom and End user/loginform");
		return "/busi/user/appLoginForm";
	}

	@RequestMapping("user/appLoginproc")
	public String apploginproc(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		log.info("Wellcom user/loginproc");
		UserDTO loginDto = new UserDTO();

		loginDto.setUser_id(CmmUtil.nvl(request.getParameter("user_id")));
		loginDto.setPassword(CmmUtil.nvl(request.getParameter("password")));

		log.info(CmmUtil.nvl(request.getParameter("user_id")));
		log.info(CmmUtil.nvl(request.getParameter("password")));
		log.info(CmmUtil.nvl(request.getParameter("auth")));

		loginDto = user.getappLogin(loginDto);
		model.addAttribute("loginDto", loginDto);
		if (loginDto == null) {
			model.addAttribute("msg", "로그인이 실패하였습니다");
			model.addAttribute("url", "appLoginForm.do");
		} else {
			session.setAttribute("AUTH", CmmUtil.nvl((String)loginDto.getAuth()));
			session.setAttribute("USER_NAME", CmmUtil.nvl((String)loginDto.getUser_name()));
			session.setAttribute("USER_NO", CmmUtil.nvl((String)loginDto.getUser_no()));
			session.setAttribute("MILEAGE", CmmUtil.nvl((String)loginDto.getMileage()));
			if (session.getAttribute("AUTH").equals("A")) {
				model.addAttribute("msg", "관리자는 PC로 로그인 해주시길 바랍니다");
				session.setAttribute("AUTH", "");
				session.setAttribute("USER_NAME", "");
				session.setAttribute("USER_NO", "");
				session.setAttribute("MILEAGE", "");
				model.addAttribute("url", "/index.jsp");
			} else {
				model.addAttribute("msg", "로그인이 성공하였습니다");
				model.addAttribute("url", "/appmain.do");
			}
		}
		log.info("End user/apploginproc");
		return "/redirect";
	}

	@RequestMapping("user/appLogout")
	public String applogout(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) {
		log.info("Wellcom user/logout");
		// String curTime = new SimpleDateFormat("yyyy/MM/dd/HH:mm").format(new
		// Date());

		session.setAttribute("AUTH", "");
		session.setAttribute("USER_NAME", "");
		session.setAttribute("USER_NO", "");
		session.setAttribute("MILEAGE", "");
		model.addAttribute("url", "/appmain.do");
		log.info("End user/applogout");
		return "/redirect";
	}

	@RequestMapping("user/appIdFindForm")
	public String appidfindform(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		log.info("Wellcom and End user/appidfindform");
		return "/busi/user/appIdFindForm";
	}

	@RequestMapping("user/appIdFindProc")
	public String appidfindproc(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Wellcom user/appidfindproc");

		UserDTO idfindDto = new UserDTO();

		log.info(CmmUtil.nvl(request.getParameter("user_name")));
		log.info(CmmUtil.nvl(request.getParameter("email1")));
		log.info(CmmUtil.nvl(request.getParameter("email2")));

		idfindDto.setUser_name(CmmUtil.nvl(request.getParameter("user_name")));
		idfindDto.setEmail1(CmmUtil.nvl(request.getParameter("email1")));
		idfindDto.setEmail2(CmmUtil.nvl(request.getParameter("email2")));

		UserDTO rDTO = user.getIdfind(idfindDto);

		model.addAttribute("rDTO", rDTO);
		if (rDTO == null) {
			rDTO = new UserDTO();
		}

		idfindDto = null;
		rDTO = null;

		log.info("End user/appIdFindProc");
		return "/busi/user/appIdSearchResult";

	}

	@RequestMapping("user/appPwFindForm")
	public String apppwfindform(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		log.info("Wellcom and End user/pwfindform");
		return "/busi/user/appPwFindForm";
	}

	@RequestMapping("user/appPwFindProc")
	public String apppwfindproc(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Wellcom user/pwfindproc");

		UserDTO pwfindDto = new UserDTO();

		log.info(CmmUtil.nvl(request.getParameter("user_name")));
		log.info(CmmUtil.nvl(request.getParameter("email1")));
		log.info(CmmUtil.nvl(request.getParameter("email2")));
		log.info(CmmUtil.nvl(request.getParameter("user_id")));

		pwfindDto.setUser_name(CmmUtil.nvl(request.getParameter("user_name")));
		pwfindDto.setEmail1(CmmUtil.nvl(request.getParameter("email1")));
		pwfindDto.setEmail2(CmmUtil.nvl(request.getParameter("email2")));
		pwfindDto.setUser_id(CmmUtil.nvl(request.getParameter("user_id")));

		UserDTO rDTO = user.getpwfind(pwfindDto);

		model.addAttribute("rDTO", rDTO);

		if (rDTO == null) {
			rDTO = new UserDTO();
		}

		pwfindDto = null;
		rDTO = null;

		log.info("End user/apppwfindproc!!");
		return "/busi/user/appPwSearchResult";

	}

	@RequestMapping("user/apppwchangeproc")
	public String apppwfind(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		log.info("Wellcom user/pwchangeproc !!");

		UserDTO pwchangeDto = new UserDTO();

		log.info(CmmUtil.nvl(request.getParameter("user_no")));
		log.info(CmmUtil.nvl(request.getParameter("password")));
		log.info(CmmUtil.nvl(request.getParameter("checkpassword")));

		pwchangeDto.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));
		pwchangeDto.setPassword(CmmUtil.nvl(request.getParameter("password")));
		pwchangeDto.setCheckpassword(CmmUtil.nvl(request.getParameter("checkpassword")));
		if (user.getpwchange(pwchangeDto)) {
			model.addAttribute("msg", "비밀번호 변경이 성공하였습니다");
			model.addAttribute("url", "/user/appLoginForm.do");
		} else {
			model.addAttribute("msg", "비밀번호 변경이 실패하였습니다");
			model.addAttribute("url", "/appmain.do");
		}

		pwchangeDto = null;

		log.info("End user/pwchangeproc !!");
		return "/redirect";

	}

	@RequestMapping("user/busiDeleteCheck")
	public String BusideleteCheck(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Wellcom user/deleteCheck!!");
		String[] del_chk = request.getParameterValues("del_chk");

		UserDTO allcheckDto = new UserDTO();
		allcheckDto.setAllCheckSeq(del_chk);

		if (user.deleteAllUserInfo(allcheckDto)) {
			model.addAttribute("msg", "삭제가 완료되었습니다");

		} else {
			model.addAttribute("msg", "삭제가 실패되었습니다");

		}

		allcheckDto = null;

		model.addAttribute("url", "/user/busiUserList.do");
		log.info("End user/deleteCheck!!");
		return "/redirect";

	}

	/*
	 * #########################################################################
	 * #########################################################################
	 * #
	 * 
	 */

	/*
	 * #########################################################################
	 * #########################################################################
	 * #
	 * 
	 */

	@RequestMapping("user/guestUserInsertForm")
	public String guestinsertForm(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		log.info("Wellcom and End user/userinsertForm");
		return "/guest/user/guestUserInsert";
	}

	@RequestMapping("user/guestUserInsert")
	public String guestinsertUserInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Wellcom user/userinsert");

		UserDTO userDto = new UserDTO();

		log.info(CmmUtil.nvl(request.getParameter("user_id")));
		log.info(CmmUtil.nvl(request.getParameter("user_name")));
		log.info(CmmUtil.nvl(request.getParameter("password")));
		log.info(CmmUtil.nvl(request.getParameter("checkpassword")));
		log.info(CmmUtil.nvl(request.getParameter("tel_1")));
		log.info(CmmUtil.nvl(request.getParameter("tel_2")));
		log.info(CmmUtil.nvl(request.getParameter("tel_3")));
		log.info(CmmUtil.nvl(request.getParameter("email1")));
		log.info(CmmUtil.nvl(request.getParameter("email2")));
		log.info(CmmUtil.nvl(request.getParameter("birthday")));

		userDto.setUser_id(CmmUtil.nvl(request.getParameter("user_id")));
		userDto.setUser_name(CmmUtil.nvl(request.getParameter("user_name")));
		userDto.setPassword(CmmUtil.nvl(request.getParameter("password")));
		userDto.setCheckpassword(CmmUtil.nvl(request.getParameter("checkpassword")));
		userDto.setTel_1(CmmUtil.nvl(request.getParameter("tel_1")));
		userDto.setTel_2(CmmUtil.nvl(request.getParameter("tel_2")));
		userDto.setTel_3(CmmUtil.nvl(request.getParameter("tel_3")));
		userDto.setEmail1(CmmUtil.nvl(request.getParameter("email1")));
		userDto.setEmail2(CmmUtil.nvl(request.getParameter("email2")));
		userDto.setBirthday(CmmUtil.nvl(request.getParameter("birthday")));

		if (user.createUserInfo(userDto)) {
			model.addAttribute("msg", "가입이 완료되었습니다");
			model.addAttribute("url", "/appmain.do");
		} else {
			model.addAttribute("msg", "가입이 실패되었습니다");
			model.addAttribute("url", "/user/guestUserInsertForm.do");
		}
		log.info("End user/userinset");
		return "/redirect";

	}

	@RequestMapping("user/guestUserDetail")
	public String getguestUserDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Wellcom user/userdetail");

		UserDTO userDto = new UserDTO();
		userDto.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));

		log.info(CmmUtil.nvl(request.getParameter("user_no")));

		userDto = user.getUserDetail(userDto);
		model.addAttribute("userDTO", userDto);
		log.info("End user/userdetail");
		return "/guest/user/guestUserDetail";
	}

	@RequestMapping("user/guestDelete")
	public String guestdeleteUserInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		log.info("Wellcom user/delete");
		UserDTO userDto = new UserDTO();

		log.info(CmmUtil.nvl(request.getParameter("user_no")));

		userDto.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));

		if (user.deleteUserInfo(userDto)) {
			model.addAttribute("msg", "탈퇴가 성공하였습니다");
			session.setAttribute("AUTH", "");
			session.setAttribute("USER_NAME", "");
			session.setAttribute("USER_NO", "");
		} else {
			model.addAttribute("msg", "탈퇴가 실패하였습니다");
		}
		request.setAttribute("url", "/appmain.do");
		log.info("End user/delete");
		return "/redirect";
	}

	@RequestMapping("user/guestUserUpdateForm")
	public String guestupdateForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Wellcom user/userupdateForm");
		UserDTO userDto = new UserDTO();
		userDto.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));
		log.info(CmmUtil.nvl(request.getParameter("user_no")));
		userDto = user.getUserDetail(userDto);
		model.addAttribute("userDto", userDto);

		log.info("End user/busiUserUpdateForm");

		return "/guest/user/guestUserUpdateForm";
	}

	@RequestMapping("user/guestUserUpdate")
	public String guestupdateUserInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Wellcom user/userupdate");
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		response.setCharacterEncoding("EUC-KR");
		UserDTO userDto = new UserDTO();

		log.info(CmmUtil.nvl(request.getParameter("user_no")));
		log.info(CmmUtil.nvl(request.getParameter("user_id")));
		log.info(CmmUtil.nvl(request.getParameter("user_name")));
		log.info(CmmUtil.nvl(request.getParameter("password")));
		log.info(CmmUtil.nvl(request.getParameter("tel_1")));
		log.info(CmmUtil.nvl(request.getParameter("tel_2")));
		log.info(CmmUtil.nvl(request.getParameter("tel_3")));
		log.info(CmmUtil.nvl(request.getParameter("email1")));
		log.info(CmmUtil.nvl(request.getParameter("email2")));
		log.info(CmmUtil.nvl(request.getParameter("birthday")));
		log.info(CmmUtil.nvl(request.getParameter("mileage")));
		
		userDto.setBirthday(CmmUtil.nvl(request.getParameter("mileage")));
		userDto.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));
		userDto.setUser_id(CmmUtil.nvl(request.getParameter("user_id")));
		userDto.setUser_name(CmmUtil.nvl(request.getParameter("user_name")));
		userDto.setPassword(CmmUtil.nvl(request.getParameter("password")));
		userDto.setCheckpassword(CmmUtil.nvl(request.getParameter("checkpassword")));
		userDto.setTel_1(CmmUtil.nvl(request.getParameter("tel_1")));
		userDto.setTel_2(CmmUtil.nvl(request.getParameter("tel_2")));
		userDto.setTel_3(CmmUtil.nvl(request.getParameter("tel_3")));
		userDto.setEmail1(CmmUtil.nvl(request.getParameter("email1")));
		userDto.setEmail2(CmmUtil.nvl(request.getParameter("email2")));
		userDto.setBirthday(CmmUtil.nvl(request.getParameter("birthday")));
		userDto.setMileage(CmmUtil.nvl(request.getParameter("mileage")));
		
		if (user.updateUserInfo(userDto)) {
			model.addAttribute("msg", "수정이 완료되었습니다");
		} else {
			model.addAttribute("msg", "수정이 실패되었습니다");
		}
		model.addAttribute("url", "/appmain.do");
		log.info("End user/userupdate");
		return "/redirect";
	}

	/*
	 * #########################################################################
	 * #########################################################################
	 * #
	 * 
	 */

}
