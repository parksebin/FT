package ac.kr.ft.com.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.ResizableByteArrayOutputStream;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ac.kr.ft.com.dto.NoticeComDTO;
import ac.kr.ft.com.dto.NoticeDTO;
import ac.kr.ft.com.service.INoticeService;
import ac.kr.ft.com.util.CmmUtil;

@Controller
public class NoticeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "NoticeService")
	private INoticeService notice;
	
	@RequestMapping("notice")
	public String add(@RequestParam Map<String, Object> map, ModelMap model) {
		
		return "/notice/samplePage";
	}
	
	//게시판 리스트 컨트롤러
	@RequestMapping("notice/noticeList")
	public String getNoticeList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		log.info("Welcome notice/noticeList !!");
		List<NoticeDTO> rList = notice.getNoticeList();
		model.addAttribute("rList", rList);
		return "/notice/noticeList";
	}

	//게시판 상세 보기 컨트롤러
	@RequestMapping("notice/noticeDetail")
	public String getNoticeDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome notice/noticeDetail !!");

		NoticeDTO noticeDto = new NoticeDTO();
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticeDto.setContents(CmmUtil.nvl(request.getParameter("contents")).replaceAll("<br>", "\r\n"));
	
		// 댓글 리스트
		NoticeComDTO noticee = new NoticeComDTO();
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setContents(CmmUtil.nvl(request.getParameter("contents")));

		noticeDto = notice.getNoticeDetail(noticeDto, noticee);
		
		model.addAttribute("noticeDto", noticeDto);	
		log.info("END notice/noticeDetail !!");
		return "/notice/noticeDetail";
	}

	
	/**
	 * 게시판 댓글 초기 리스트 가져오기
	 * */
	@RequestMapping("notice/CommentList")
	public String CommentList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome notice/CommentList !!");
		
		request.setCharacterEncoding("UTF-8");
		
		log.info("notice_seq : "+ CmmUtil.nvl(request.getParameter("notice_seq")));
		
		// 댓글 리스트
		NoticeComDTO pDTO = new NoticeComDTO();
				
		pDTO.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
	
		NoticeComDTO rDTO = notice.getNoticeComList(pDTO);
		
		model.addAttribute("rDTO", rDTO);
	
		log.info("End notice/CommentList !!");
		
		return "/notice/NoticeComJSON";
	}
	
	
	/**
	 * 등록화면 보여주기
	 */
	@RequestMapping("notice/noticeInsert")
	public String insertForm(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

		log.info("Welcome notice/noticeInsertForm");

		return "/notice/noticeInsert";
	}

	
	/**
	 * 등록데이터 db저장하기
	 * 
	 **/
	@RequestMapping("notice/insert")
	public String insertNoticeInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
				
		log.info("Welcome notice/noticeinsert");		
		NoticeDTO noticeDto = new NoticeDTO();
	
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
			
		String title =CmmUtil.nvl(request.getParameter("title"));
		
		title = title.replaceAll("\r\n", "<br>");
		title = title.replaceAll("& #39;","'");
		title = title.replaceAll("& #40;","(");
		title = title.replaceAll("& #41;",")");
		title = title.replaceAll("& lt;","<");
		title = title.replaceAll("& gt;",">");
		
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticeDto.setTitle(title);
		noticeDto.setContents(contents);
		noticeDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
		noticeDto.setUser_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		noticeDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		noticeDto.setReg_dt(CmmUtil.nvl(request.getParameter("reg_dt")));
		noticeDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
			
		// menuinfoDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
		//noticeDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("reg_user_no")));

		if (notice.createNoticeInfo(noticeDto)) {
			model.addAttribute("msg", "등록이 완료되었습니다");
		} else {
			model.addAttribute("msg", "등록이 실패하였습니다");
		}

		log.info("End notice/noticeInsert !!");

		return "/notice/noticeMsgToList";
	}

	//게시판 업데이트 하는 뷰단 보여주는 컨트롤러
	@RequestMapping("notice/noticeupdateForm")
	public String updateForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("hellow notice/updateForm !!");
		NoticeDTO noticeDto = new NoticeDTO();
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticeDto = notice.getNoticeDetailInfo(noticeDto);
		noticeDto.setContents(CmmUtil.nvl(noticeDto.getContents().replaceAll("<br>", "\r\n")));
		model.addAttribute("noticeDto", noticeDto);
		return "/notice/noticeUpdate";
	}

	//게시판 업데이트 컨트롤러
	@RequestMapping("notice/update")
	public String updateNoticeInfo(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model)
			throws Exception {
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		log.info("notice_seq=" + CmmUtil.nvl(request.getParameter("notice_seq")));
		log.info(CmmUtil.nvl(request.getParameter("title")));
		log.info(CmmUtil.nvl(request.getParameter("contents")).replaceAll("<br>", "\r\n"));
		log.info(CmmUtil.nvl(request.getParameter("read_cnt")));
		log.info(CmmUtil.nvl(request.getParameter("reg_user_no")));
		log.info(CmmUtil.nvl(request.getParameter("chg_dt")));
		log.info(CmmUtil.nvl(request.getParameter("fileGRP")));

		response.setCharacterEncoding("EUC-KR");
		NoticeDTO noticeDto = new NoticeDTO();
		
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		String title =CmmUtil.nvl(request.getParameter("title"));
		
		title = title.replaceAll("\r\n", "<br>");
		title = title.replaceAll("& #39;","'");
		title = title.replaceAll("& #40;","(");
		title = title.replaceAll("& #41;",")");
		title = title.replaceAll("& lt;","<");
		title = title.replaceAll("& gt;",">");

		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticeDto.setTitle(title);
		noticeDto.setContents(contents);
		noticeDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
		noticeDto.setChg_user_no(CmmUtil.nvl((String)session.getAttribute("ADMINUSER_NO")));
		noticeDto.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		noticeDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));

		log.info("byby notice/update !!");

		if (notice.updateNoticeInfo(noticeDto)) {
			model.addAttribute("msg", "수정이 완료되었습니다");
		} else {
			model.addAttribute("msg", "수정이 실패하였습니다");
		}
		model.addAttribute("url", "noticeList.do");
		return "/redirect";
	}

	//게시판 삭제 컨트롤러
	@RequestMapping("notice/delete")
	public String deleteNoticeInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		NoticeDTO noticeDto = new NoticeDTO();
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		if (notice.deleteNoticeInfo(noticeDto)) {
			model.addAttribute("msg", "삭제가 완료되었습니다");
		}else{
			model.addAttribute("msg", "삭제가 완료되었습니다");
		}
		model.addAttribute("url", "noticeList.do");
		return "/redirect";
	}
	
	//체크박스 삭제 컨트롤러
	@RequestMapping("notice/deleteCheck")
	public String deleteCheck(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		String[] del_chk = request.getParameterValues("del_chk");

		NoticeDTO pDTO = new NoticeDTO();

		pDTO.setAllCheckSeq(del_chk);

		if (notice.deleteAllCheckList(pDTO)) {
			model.addAttribute("msg", "삭제가 완료되었습니다");

		} else {
			model.addAttribute("msg", "삭제가 완료되었습니다");

		}

		pDTO = null;

		model.addAttribute("url", "/notice/noticeList.do");
		return "/redirect";
	}

	// 댓글 등록 컨트롤러
	@RequestMapping("notice/insertComment")
	public String insertComment(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
	
			
		log.info("Welcome notice/insertComment");
		request.setCharacterEncoding("UTF-8");
		String res = ""; //처리 결과
		NoticeComDTO noticee = new NoticeComDTO();

		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
				
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setContents(contents);
		noticee.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		noticee.setReg_dt(CmmUtil.nvl(request.getParameter("reg_dt")));
		noticee.setUser_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));

			if (notice.createComment(noticee)){
				//등록 성공
				res = "1";
				
			}else{
				
				//등록 실패
				res = "0";
				
			}
			log.info("Welcome byby/insertComment");
			model.addAttribute("res", res);
			return "/notice/CommentProc";
	}

	
		

	
	
	
	
	// 댓글 삭제 컨트롤러
	@RequestMapping("notice/deleteComment")
	public String deleteComment(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("hi notice/deleteComment ");
		
		log.info(CmmUtil.nvl(request.getParameter("notice_seq")));
		log.info(CmmUtil.nvl(request.getParameter("com_seq")));
		
		
		String res = ""; 
		
		NoticeComDTO noticee = new NoticeComDTO();
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		if (notice.deleteComment(noticee)) {
			//등록 성공
			res = "1";
			
		}else{
			//등록 실패
			res = "0";
			
		}		
		log.info("END notice/deleteComment ");
	
		model.addAttribute("res", res);
		
		return "/notice/CommentProc";
	}

	

	
	// 댓글 수정 컨트롤러
	@RequestMapping("notice/updateComment")
	public String updateComment(HttpSession session,HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
	
		request.setCharacterEncoding("UTF-8");
		log.info("hellow notice/updateComment");
		
		log.info("notice_seq=" + CmmUtil.nvl(request.getParameter("notice_seq")));
		log.info(CmmUtil.nvl(request.getParameter("com_seq")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));
		log.info("User_no=" +CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		log.info("Chg_dt="+CmmUtil.nvl(request.getParameter("chg_dt")));
		log.info("Chg_user_no"+CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		
		String res = ""; //처리 결과
	
	
		NoticeComDTO noticee = new NoticeComDTO();
	
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		noticee.setContents(contents);
		noticee.setUser_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		noticee.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		noticee.setChg_user_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		
		if (notice.updateComment(noticee)) {
			//수정 성공
			res = "1";
			
		}else{
			//수정 실패
			res = "0";
			
		}
		
		log.info("byby notice/update !!");
		model.addAttribute("res", res);
		return "/notice/CommentProc";
	}
	
	
	
	/*
	 * #########################################################################
	 * # # 관리자 용 끝 #
	 * #########################################################################
	 * #
	 * 
	 */

	/*
	 * #########################################################################
	 * # # 사업자용 시작 #
	 * #########################################################################
	 * 
	 * 
	 */

	
	// 사업자 공지사항 리스트 가져오기
	@RequestMapping("notice/businoticeList") // board.html
	public String getNotice(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		log.info("Welcome notice/busiNoticeList !!");
        
		request.setCharacterEncoding("EUC-KR");

		if (request.getParameter("searchBox") != null && !request.getParameter("searchBox").equals("")) {
			log.info("aaa");
			String searchBox = request.getParameter("searchBox");
			String searchText = request.getParameter("searchText");
			if (searchText == null) {
				searchText = "";
			}
			model.addAttribute("searchBox", searchBox);
			log.info("searchBox :" + searchBox);
			model.addAttribute("searchText", searchText);
			log.info("searchText :" + searchText);
		}

		
		
		log.info("End notice/busiNoticeList !!");

		return "/busi/notice/businoticeList";
	}

	
	/**
	 * 게시판 초기 리스트 가져오기
	 * */
	
	@RequestMapping("notice/busiNoticeIndex")
	public String getBusiIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome notice/busiNoticeIndex !!");
		
		request.setCharacterEncoding("UTF-8");

		
		// 게시판 리스트
		NoticeDTO pDTO = new NoticeDTO();
		
		pDTO.setStart_page(CmmUtil.nvl(request.getParameter("start_page"),"1"));
		pDTO.setEnd_page(CmmUtil.nvl(request.getParameter("end_page"),"6"));

		pDTO.setSearchBox(CmmUtil.nvl(request.getParameter("searchBox")));
		pDTO.setSearchText(CmmUtil.nvl(request.getParameter("searchText")));
		
		log.info("SearchBox : " + pDTO.getSearchBox());
		log.info("SearchText : " + pDTO.getSearchText());
	
		
		NoticeDTO rDTO= notice.getBusiList(pDTO);
		
		model.addAttribute("rDTO", rDTO);
		
		log.info("End notice/busiNoticeIndex !!");
	
		
		return "/busi/notice/NoticeListJSON";
	}
	
	
	//여기서 댓글시작
	//사업자 공지사항 보기
	@RequestMapping("notice/businoticeDetail")
	public String busiNoticeDetail(HttpSession session,HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception {

		log.info("Welcome notice/noticeDetail !!");

		NoticeDTO noticeDto = new NoticeDTO();
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticeDto.setUser_name(CmmUtil.nvl((String) session.getAttribute("USER_NAME")));
		
		// 댓글 리스트
		NoticeComDTO noticee = new NoticeComDTO();
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));

		noticeDto = notice.busiNoticeDetail(noticeDto);
		
		model.addAttribute("noticeDto", noticeDto);
		
		log.info("End notice/noticeDetail !!");
		
		return "/busi/notice/businoticeDetail";
	}

	
	
	/**
	 * 글쓰기 등록하기
	 */
	@RequestMapping("notice/businoticeForm")
	public String BusiMenuReg(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome notice/businoticeForm !!");

		return "/busi/notice/businoticeInsert";
	}

	/**
	 * 등록데이터 db 저장하기'
	 */
	@RequestMapping("notice/busiInsert")
	public String createBusiMenuInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		log.info("Welcome menu/BusiNoticeInsert !!");
		
		NoticeDTO noticeDto = new NoticeDTO();
		
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		String title =CmmUtil.nvl(request.getParameter("title"));
		
		title = title.replaceAll("\r\n", "<br>");
		title = title.replaceAll("& #39;","'");
		title = title.replaceAll("& #40;","(");
		title = title.replaceAll("& #41;",")");
		title = title.replaceAll("& lt;","<");
		title = title.replaceAll("& gt;",">");
		
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticeDto.setTitle(title);
		noticeDto.setContents(contents);
		noticeDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
		noticeDto.setReg_dt(CmmUtil.nvl(request.getParameter("reg_dt")));
		noticeDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
		noticeDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		noticeDto.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));

		// select seq로 값 받아와서 view딴의 detail로 보내면
		// 이거대신에 모델.에딧

		log.info("notice_seq : " + CmmUtil.nvl(request.getParameter("notice_seq")));
		log.info("title : " + CmmUtil.nvl(request.getParameter("title")));
		log.info("read_cnt : " + CmmUtil.nvl(request.getParameter("read_cnt")));
		log.info("user_no : " + CmmUtil.nvl(request.getParameter("user_no")));
		log.info("fileGRP : " + CmmUtil.nvl(request.getParameter("fileGRP")));
		log.info("reg_dt : " + CmmUtil.nvl(request.getParameter("reg_dt")));

		// select seq로 값 받아와서 view 딴의 detail로 보내면
		// 이거대신에 모델.에딧
		if (notice.createNoticeInfo(noticeDto)) {
			model.addAttribute("msg", "등록이 완료되었습니다");
		} else {
			model.addAttribute("msg", "등록을 실패하였습니다");
		}
		// request.setAttribute("url", "detail.do?ctr_seq=1");

		log.info("End menu/BusinoticeInsert !!");

		return "/busi/notice/noticeMsgToList";
	}	
	
	
	// 게시글 삭제
	@RequestMapping("notice/busidelete")
	public String deleteBusiNoticeInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {	
		log.info("hellow notice/busidelete!!");
		NoticeDTO noticeDto = new NoticeDTO();
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		if (notice.deleteNoticeInfo(noticeDto)) {
			model.addAttribute("msg", "삭제가 완료되었습니다");
		} else {
			model.addAttribute("msg", "삭제가 완료되었습니다");
		}
		model.addAttribute("url", "businoticeList.do");
		return "/redirect";
	
	}
	
	
	
	@RequestMapping("notice/businoticeupdateForm")
	public String busiupdateForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("hellow businotice/updateForm !!");
		NoticeDTO noticeDto = new NoticeDTO();
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticeDto = notice.getNoticeDetailInfo(noticeDto);
		noticeDto.setContents(noticeDto.getContents().replaceAll("<br>", "\r\n"));
		model.addAttribute("noticeDto", noticeDto);
		return "busi/notice/businoticeUpdate";
	}

	
	
	
	@RequestMapping("notice/busiupdate")
	public String busiupdateNoticeInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		log.info("notice_seq=" + CmmUtil.nvl(request.getParameter("notice_seq")));
		log.info(CmmUtil.nvl(request.getParameter("title")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));
		log.info(CmmUtil.nvl(request.getParameter("read_cnt")));
		log.info(CmmUtil.nvl(request.getParameter("chg_user_no")));
		log.info(CmmUtil.nvl(request.getParameter("chg_dt")));
		log.info(CmmUtil.nvl(request.getParameter("fileGRP")));

		response.setCharacterEncoding("EUC-KR");
		NoticeDTO noticeDto = new NoticeDTO();
		
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		String title =CmmUtil.nvl(request.getParameter("title"));
		
		title = title.replaceAll("\r\n", "<br>");
		title = title.replaceAll("& #39;","'");
		title = title.replaceAll("& #40;","(");
		title = title.replaceAll("& #41;",")");
		title = title.replaceAll("& lt;","<");
		title = title.replaceAll("& gt;",">");
		
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticeDto.setTitle(title);
		noticeDto.setContents(contents);
		noticeDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
		noticeDto.setChg_user_no(CmmUtil.nvl(request.getParameter("chg_user_no")));
		noticeDto.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		noticeDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));

		log.info("byby notice/update !!");

		if (notice.updateNoticeInfo(noticeDto)) {
			model.addAttribute("msg", "수정이 완료되었습니다");
		} else {
			model.addAttribute("msg", "수정에 실패하셨습니다");
		}
		model.addAttribute("url", "businoticeList.do");
		return "/redirect";
	}
	
	
	
	/**
	 * 댓글 초기 리스트 가져오기
	 * */
	@RequestMapping("notice/busiCommentList")
	public String getBusiCommentList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome notice/busiCommentList !!");
		
		request.setCharacterEncoding("UTF-8");
		
		log.info("notice_seq : "+ CmmUtil.nvl(request.getParameter("notice_seq")));
		log.info("start_page_size : "+ CmmUtil.nvl(request.getParameter("start_page_size")));
		log.info("end_page_size : "+ CmmUtil.nvl(request.getParameter("end_page_size")));
		
		// 댓글 리스트
		NoticeComDTO pDTO = new NoticeComDTO();
		pDTO.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		pDTO.setStart_page_size(CmmUtil.nvl(request.getParameter("start_page_size"),"1"));
		pDTO.setEnd_page_size(CmmUtil.nvl(request.getParameter("end_page_size"),"6"));

		NoticeComDTO rDTO = notice.getBusiCommentList(pDTO);
		
		model.addAttribute("rDTO", rDTO);
	
		log.info("End notice/busiCommentList !!");
		
		return "/busi/notice/CommentListJSON";
	}
	
	
	/**
	 * 댓글 등록
	 * */
	@RequestMapping("notice/busiInsertComment")
	public String busiinsertComment(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap model) throws Exception {
		request.setCharacterEncoding("UTF-8");
		log.info("Welcome notice/busiInsertComment");

		String res = ""; //처리 결과
		NoticeComDTO noticee = new NoticeComDTO();

		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
				
		log.info(CmmUtil.nvl(request.getParameter("notice_seq")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));
		log.info(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		log.info(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
			
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setContents(contents);
		noticee.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		noticee.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));

		if (notice.createComment(noticee)){
			//등록 성공
			res = "1";
			
		}else{
			
			//등록 실패
			res = "0";
			
		}
	
		model.addAttribute("res", res);
		
		return "/busi/notice/CommentProc";
	}
		
	/**
	 * 댓글 수정
	 * */	
	@RequestMapping("notice/busiUpdateComment")
	public String busiUpdateComment(HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		log.info("notice/busiUpdateComment");
		
		String res = ""; //처리 결과
		
		NoticeComDTO noticee = new NoticeComDTO();
		
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		noticee.setContents(contents);
		noticee.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		noticee.setChg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		noticee.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		
		if (notice.updateComment(noticee)){
			//수정 성공
			res = "1";
			
		}else{
			//수정 실패
			res = "0";
			
		}
		
		model.addAttribute("res", res);
		
		return "/busi/notice/CommentProc";
		
	}
	
	
	/**
	 * 댓글 삭제
	 * */	
	@RequestMapping("notice/busiDeleteComment")
	public String busideleteComment(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		log.info("hi notice/busideleteComment ");
		
		String res = ""; //처리 결과
		
		NoticeComDTO noticee = new NoticeComDTO();
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		
		if (notice.deleteComment(noticee)){
			//등록 성공
			res = "1";
			
		}else{
			//등록 실패
			res = "0";
			
		}
		
		model.addAttribute("res", res);
		
		return "/busi/notice/CommentProc";
		
	}	

	// 체크박스 삭제 컨트롤러
	@RequestMapping("notice/busideleteCheck")
	public String busideleteCheck(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Hellow notice/busideleteCheck");

		String[] del_chk = request.getParameterValues("del_chk");

		for (String a : del_chk) {
			System.out.println(a);
		}
		NoticeDTO pDTO = new NoticeDTO();

		pDTO.setAllCheckSeq(del_chk);

		if (notice.deleteAllCheckList(pDTO)) {
			model.addAttribute("msg", "삭제가 완료되었습니다");

		} else {
			model.addAttribute("msg", "삭제가 완료되었습니다");

		}
		log.info("byby notice/busideleteCheck");
		pDTO = null;

		model.addAttribute("url", "businoticeList.do");
		return "/redirect";
	}


/*
 * ########################################################################## 
 * 
 * 사업자 용 끝
 * 
 * ##########################################################################
 * 
 */
	/*
	 * #########################################################################
	 * #
	 * 
	 * 사용자 용 시작
	 * 
	 * #########################################################################
	 * #
	 * 
	 */

	
	
	
	
	// 사업자 공지사항 리스트 가져오기
	@RequestMapping("notice/guestnoticeList") // board.html
	public String getguestNotice(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome notice/guestnoticeList !!");

		request.setCharacterEncoding("EUC-KR");

		if (request.getParameter("searchBox") != null && !request.getParameter("searchBox").equals("")) {
			log.info("aaa");
			String searchBox = request.getParameter("searchBox");
			String searchText = request.getParameter("searchText");
			if (searchText == null) {
				searchText = "";
			}
			model.addAttribute("searchBox", searchBox);
			log.info("searchBox :" + searchBox);
			model.addAttribute("searchText", searchText);
			log.info("searchText :" + searchText);
		}

		log.info("End notice/guestnoticeList !!");

		return "/guest/notice/guestnoticeList";
	}

	/**
	 * 게시판 초기 리스트 가져오기
	 */

	@RequestMapping("notice/guestNoticeIndex")
	public String getguestIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome notice/guestNoticeIndex !!");

		request.setCharacterEncoding("UTF-8");

		// 게시판 리스트
		NoticeDTO pDTO = new NoticeDTO();

		pDTO.setStart_page(CmmUtil.nvl(request.getParameter("start_page"), "1"));
		pDTO.setEnd_page(CmmUtil.nvl(request.getParameter("end_page"), "6"));
		pDTO.setSearchBox(CmmUtil.nvl(request.getParameter("searchBox")));
		pDTO.setSearchText(CmmUtil.nvl(request.getParameter("searchText")));

		log.info("SearchBox : " + pDTO.getSearchBox());
		log.info("SearchText : " + pDTO.getSearchText());

		NoticeDTO rDTO = notice.getBusiList(pDTO);

		model.addAttribute("rDTO", rDTO);

		log.info("End notice/guestNoticeIndex !!");

		return "/guest/notice/guestNoticeListJSON";
	}

	
	// 게시판 상세 보기 컨트롤러
	@RequestMapping("notice/guestnoticeDetail")
	public String guestNoticeDetail(HttpSession session,HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Welcome notice/guestnoticeDetail !!");

		NoticeDTO noticeDto = new NoticeDTO();
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));

		
		// 댓글 리스트
		NoticeComDTO noticee = new NoticeComDTO();
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		
		
		//log.info(CmmUtil.nvl(request.()));
		
		noticeDto = notice.getNoticeDetail(noticeDto,noticee);

		model.addAttribute("noticeDto", noticeDto);

		log.info("End notice/guestnoticeDetail !!");

		return "/guest/notice/guestnoticeDetail";
	
	}
	

	/**
	 * 댓글 초기 리스트 가져오기
	 */
	@RequestMapping("notice/guestCommentList")
	public String getguestCommentList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome notice/guestCommentList !!");

		request.setCharacterEncoding("UTF-8");

		// 댓글 리스트
		NoticeComDTO pDTO = new NoticeComDTO();

		pDTO.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		pDTO.setStart_page_size(CmmUtil.nvl(request.getParameter("start_page_size"), "1"));
		pDTO.setEnd_page_size(CmmUtil.nvl(request.getParameter("end_page_size"), "6"));

		log.info("notice_seq : " + CmmUtil.nvl(request.getParameter("notice_seq")));
		log.info("start_page_size : " + CmmUtil.nvl(request.getParameter("start_page_size")));
		log.info("end_page_size : " + CmmUtil.nvl(request.getParameter("end_page_size")));
	
		NoticeComDTO rDTO = notice.getBusiCommentList(pDTO);
			
		model.addAttribute("rDTO", rDTO);

		log.info("End notice/guestCommentList !!");

		return "/guest/notice/guestCommentListJSON";
	}

	
	// 게시글 삭제
	@RequestMapping("notice/guestdelete")
	public String deleteguestNoticeInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {	
		log.info("hellow notice/guestdelete!!");
		NoticeDTO noticeDto = new NoticeDTO();
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		if (notice.deleteNoticeInfo(noticeDto)) {
			model.addAttribute("msg", "삭제가 완료되었습니다");
		} else {
			model.addAttribute("msg", "삭제가 완료되었습니다");
		}
		model.addAttribute("url", "guestnoticeList.do");
		return "/redirect";
	
	}
	
	// 게시글 업데이트 뷰단 보여주는컨트롤러
	@RequestMapping("notice/guestnoticeupdateForm")
	public String guestUpdateForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("hellow busiontice/updateForm !!");
		NoticeDTO noticeDto = new NoticeDTO();
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticeDto = notice.getNoticeDetailInfo(noticeDto);
		noticeDto.setContents(noticeDto.getContents().replaceAll("<br>", "\r\n"));
		model.addAttribute("noticeDto", noticeDto);
		return "/guest/notice/guestnoticeUpdate";
	}

	@RequestMapping("notice/guestUpdate")
	public String guestupdateNoticeInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		log.info("notice_seq=" + CmmUtil.nvl(request.getParameter("notice_seq")));
		log.info(CmmUtil.nvl(request.getParameter("title")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));
		log.info(CmmUtil.nvl(request.getParameter("read_cnt")));
		log.info(CmmUtil.nvl(request.getParameter("chg_user_no")));
		log.info(CmmUtil.nvl(request.getParameter("chg_dt")));
		log.info(CmmUtil.nvl(request.getParameter("fileGRP")));


		NoticeDTO noticeDto = new NoticeDTO();	
		
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		String title =CmmUtil.nvl(request.getParameter("title"));
		
		title = title.replaceAll("\r\n", "<br>");
		title = title.replaceAll("& #39;","'");
		title = title.replaceAll("& #40;","(");
		title = title.replaceAll("& #41;",")");
		title = title.replaceAll("& lt;","<");
		title = title.replaceAll("& gt;",">");
		
		noticeDto.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticeDto.setTitle(title);
		noticeDto.setContents(contents);
		noticeDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
		noticeDto.setChg_user_no(CmmUtil.nvl(request.getParameter("chg_user_no")));
		noticeDto.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		noticeDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));

		log.info("byby notice/update !!");

		if (notice.updateNoticeInfo(noticeDto)) {
			model.addAttribute("msg", "수정이 완료되었습니다");
		} else {
			model.addAttribute("msg", "수정에 실패하셨습니다");
		}
		model.addAttribute("url", "guestnoticeList.do");
		return "/redirect";
	}


	/**
	 * 댓글 등록
	 */
	@RequestMapping("notice/guestInsertComment")
	public String guestinsertComment(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap model) throws Exception {
		request.setCharacterEncoding("UTF-8");
		log.info("Welcome notice/guestInsertComment");

		String res = ""; // 처리 결과
		NoticeComDTO noticee = new NoticeComDTO();
		
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		log.info(CmmUtil.nvl(request.getParameter("notice_seq")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));

		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setContents(contents);
		noticee.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		noticee.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));

		if (notice.createComment(noticee)) {
			// 등록 성공
			res = "1";

		} else {

			// 등록 실패
			res = "0";

		}

		model.addAttribute("res", res);

		return "/guest/notice/CommentProc";
	}

	/**
	 * 댓글 수정
	 */
	@RequestMapping("notice/guestUpdateComment")
	public String guestUpdateComment(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		request.setCharacterEncoding("UTF-8");
		log.info("hihi notice/guestUpdateComment");
	
		String res = ""; // 처리 결과

		NoticeComDTO noticee = new NoticeComDTO();
		
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		noticee.setContents(contents);
		noticee.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		noticee.setChg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		noticee.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));

		if (notice.updateComment(noticee)) {
			// 수정 성공
			res = "1";

		} else {
			// 수정 실패
			res = "0";

		}

		model.addAttribute("res", res);

		return "/guest/notice/CommentProc";

	}

	/**
	 * 댓글 삭제
	 */
	@RequestMapping("notice/guestDeleteComment")
	public String guestdeleteComment(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("hi notice/guestdeleteComment ");

		String res = ""; // 처리 결과

		NoticeComDTO noticee = new NoticeComDTO();
		noticee.setNotice_seq(CmmUtil.nvl(request.getParameter("notice_seq")));
		noticee.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));

		if (notice.deleteComment(noticee)) {
			// 등록 성공
			res = "1";

		} else {
			// 등록 실패
			res = "0";

		}

		model.addAttribute("res", res);

		return "/guest/notice/CommentProc";

	}

}
/*
 * ##########################################################################
 * 
 * 사용자 용 끝
 * 
 * ##########################################################################
 * 
 */
 