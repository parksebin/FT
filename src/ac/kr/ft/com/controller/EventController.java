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

import ac.kr.ft.com.dto.EventComDTO;
import ac.kr.ft.com.dto.EventDTO;
import ac.kr.ft.com.service.IEventService;
import ac.kr.ft.com.util.CmmUtil;

@Controller
public class EventController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "EventService")
	private IEventService eve;

	@RequestMapping("event")
	public String add(@RequestParam Map<String, Object> map, ModelMap model) {

		return "/event/samplePage";
	}

	// 게시판 리스트 컨트롤러
	@RequestMapping("event/eventList")
	public String getEventList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Welcome event/eventList !!");
		List<EventDTO> rList = eve.getEventList();
		model.addAttribute("rList", rList);
		return "/event/eventList";
	}

	// 게시판 상세 보기 컨트롤러
	@RequestMapping("event/eventDetail")
	public String getEventDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome event/eventDetail !!");

		EventDTO eventDto = new EventDTO();
		eventDto.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));

		// 댓글 리스트
		EventComDTO evee = new EventComDTO();
		evee.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		
		eventDto = eve.getEventDetail(eventDto, evee);

		model.addAttribute("eventDto", eventDto);
		log.info("END event/eventDetail !!");
		return "/event/eventDetail";
	}

	/**
	 * 게시판 댓글 초기 리스트 가져오기
	 */
	@RequestMapping("event/CommentList")
	public String CommentList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome event/CommentList !!");

		request.setCharacterEncoding("UTF-8");

		log.info("ent_seq : " + CmmUtil.nvl(request.getParameter("ent_seq")));

		// 댓글 리스트
		EventComDTO pDTO = new EventComDTO();

		pDTO.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));

		EventComDTO rDTO = eve.getEventComList(pDTO);

		model.addAttribute("rDTO", rDTO);

		log.info("End event/CommentList !!");

		return "/event/EventComJSON";
	}

	/**
	 * 등록화면 보여주기
	 */
	@RequestMapping("event/eventInsert")
	public String insertForm(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

		log.info("Welcome event/eventInsertForm");

		return "/event/eventInsert";
	}

	/**
	 * 등록데이터 db저장하기
	 * 
	 **/
	@RequestMapping("event/insert")
	public String insertEventInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		log.info("Welcome event/eventinsert");
		EventDTO eventDto = new EventDTO();
		
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
			
		// request.getParameter("ent_seq") 원래 1 대신에 들어갔었던 값임.
		eventDto.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		eventDto.setTitle(title);
		eventDto.setContents(contents);
		eventDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
		eventDto.setUser_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		eventDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		eventDto.setReg_dt(CmmUtil.nvl(request.getParameter("reg_dt")));
		eventDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));

		// menuinfoDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
		// eventDto.setReg_user_no(CmmUtil.nvl((String)
		// session.getAttribute("reg_user_no")));

		if (eve.createEventInfo(eventDto)) {
			model.addAttribute("msg", "등록이 완료되셨습니다");
		} else {
			model.addAttribute("msg", "등록이 실패하셨습니다");
		}

		log.info("End event/eventInsert !!");

		return "/event/eventMsgToList";
	}

	// 게시판 업데이트 하는 뷰단 보여주는 컨트롤러
	@RequestMapping("event/eventupdateForm")
	public String updateForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("hellow event/updateForm !!");
		EventDTO eventDto = new EventDTO();
		eventDto.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq"))); 
		eventDto = eve.getEventDetailInfo(eventDto);
	
		eventDto.setContents(CmmUtil.nvl(eventDto.getContents().replaceAll("<br>", "\r\n")));
	
		model.addAttribute("eventDto", eventDto);
		return "/event/eventUpdate";
	}

	// 게시판 업데이트 컨트롤러
	@RequestMapping("event/update")
	public String updateEventInfo(HttpServletRequest request, HttpSession session, HttpServletResponse response,
			ModelMap model) throws Exception {
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		log.info("ent_seq=" + CmmUtil.nvl(request.getParameter("ent_seq")));
		log.info(CmmUtil.nvl(request.getParameter("title")));
		log.info(CmmUtil.nvl(request.getParameter("contents")).replaceAll("<br>", "\r\n"));
		log.info(CmmUtil.nvl(request.getParameter("read_cnt")));
		log.info(CmmUtil.nvl(request.getParameter("reg_user_no")));
		log.info(CmmUtil.nvl(request.getParameter("chg_dt")));
		log.info(CmmUtil.nvl(request.getParameter("fileGRP")));

		
		EventDTO eventDto = new EventDTO();

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
		
			
		eventDto.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		eventDto.setTitle(title);
		eventDto.setContents(contents);
		eventDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
		eventDto.setChg_user_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		eventDto.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		eventDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));

		log.info("byby event/update !!");

		if (eve.updateEventInfo(eventDto)) {
			model.addAttribute("msg", "수정이 완료되었습니다");
		} else {
			model.addAttribute("msg", "수정이 실패하셨습니다");
		}
		model.addAttribute("url", "eventList.do");
		return "/redirect";
	}

	// 게시판 삭제 컨트롤러
	@RequestMapping("event/delete")
	public String deleteEventInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		EventDTO eventDto = new EventDTO();
		eventDto.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		if (eve.deleteEventInfo(eventDto)) {
			model.addAttribute("msg", "삭제가 완료되었습니다");
		} else {
			model.addAttribute("msg", "삭제가 완료되었습니다");
		}
		model.addAttribute("url", "eventList.do");
		return "/redirect";
	}

	// 체크박스 삭제 컨트롤러
	@RequestMapping("event/deleteCheck")
	public String deleteCheck(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		String[] del_chk = request.getParameterValues("del_chk");

		EventDTO pDTO = new EventDTO();

		pDTO.setAllCheckSeq(del_chk);

		if (eve.deleteAllCheckList(pDTO)) {
			model.addAttribute("msg", "삭제가 완료되었습니다");

		} else {
			model.addAttribute("msg", "삭제가 완료되었습니다");

		}

		pDTO = null;

		model.addAttribute("url", "/event/eventList.do");
		return "/redirect";
	}

	// 댓글 등록 컨트롤러
	@RequestMapping("event/insertComment")
	public String insertComment(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		log.info("Welcome event/insertComment");
		request.setCharacterEncoding("UTF-8");
		String res = ""; // 처리 결과
		EventComDTO evee = new EventComDTO();
	
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		
		log.info(CmmUtil.nvl(request.getParameter("ent_seq")));
		log.info(contents);
		log.info(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		log.info(CmmUtil.nvl(request.getParameter("reg_dt")));
		log.info(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		
		
		
		
		evee.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		evee.setContents(CmmUtil.nvl(request.getParameter("contents")).replaceAll("\r\n", "<br>"));
		evee.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		evee.setReg_dt(CmmUtil.nvl(request.getParameter("reg_dt")));
		evee.setUser_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));

		if (eve.createComment(evee)) {
			// 등록 성공
			res = "1";

		} else {

			// 등록 실패
			res = "0";

		}
		log.info("Welcome byby/insertComment");
		model.addAttribute("res", res);
		return "/event/CommentProc";
	}

	// 댓글 삭제 컨트롤러
	@RequestMapping("event/deleteComment")
	public String deleteComment(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("hi event/deleteComment ");

		log.info(CmmUtil.nvl(request.getParameter("ent_seq")));
		log.info(CmmUtil.nvl(request.getParameter("com_seq")));

		String res = "";

		EventComDTO evee = new EventComDTO();
		evee.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		evee.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		if (eve.deleteComment(evee)) {
			// 등록 성공
			res = "1";

		} else {
			// 등록 실패
			res = "0";

		}
		log.info("END event/deleteComment ");

		model.addAttribute("res", res);

		return "/event/CommentProc";
	}

	// 댓글 수정 컨트롤러
	@RequestMapping("event/updateComment")
	public String updateComment(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		log.info("ent_seq=" + CmmUtil.nvl(request.getParameter("ent_seq")));
		log.info(CmmUtil.nvl(request.getParameter("com_seq")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));
		log.info("User_no=" + CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		log.info("Chg_dt=" + CmmUtil.nvl(request.getParameter("chg_dt")));
		log.info("Chg_user_no" + CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));

		String res = ""; // 처리 결과
		EventComDTO evee = new EventComDTO();

		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		
		evee.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		evee.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		evee.setContents(contents);
		evee.setUser_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
		evee.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		evee.setChg_user_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));

		log.info("byby event/update !!");

		if (eve.updateComment(evee)) {
			// 수정 성공
			res = "1";

		} else {
			// 수정 실패
			res = "0";

		}

		model.addAttribute("res", res);
		return "/event/CommentProc";
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

	// 사업자 이벤트 리스트 가져오기
	@RequestMapping("event/busieventList") // board.html
	public String getEvent(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		log.info("Welcome event/busiEventList !!");
		request.setCharacterEncoding("EUC-KR");

		if (request.getParameter("searchBox") != null && !request.getParameter("searchBox").equals("")) {
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

		log.info("End event/busiEventList !!");
		return "/busi/event/busieventList";
	}

	/**
	 * 게시판 초기 리스트 가져오기
	 */
	@RequestMapping("event/busiEventIndex")
	public String getBusiIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome event/busiEventIndex !!");

		// 게시판 리스트
		EventDTO pDTO = new EventDTO();

		request.setCharacterEncoding("UTF-8");

		pDTO.setStart_page(CmmUtil.nvl(request.getParameter("start_page"), "1"));
		pDTO.setEnd_page(CmmUtil.nvl(request.getParameter("end_page"), "6"));
		pDTO.setSearchBox(CmmUtil.nvl(request.getParameter("searchBox")));
		pDTO.setSearchText(CmmUtil.nvl(request.getParameter("searchText")));
		
		log.info("SearchBox : " + pDTO.getSearchBox());
		log.info("SearchText : " + pDTO.getSearchText());
		EventDTO rDTO = eve.getBusiList(pDTO);

		model.addAttribute("rDTO", rDTO);

		log.info("End event/busiEventIndex !!");

		return "/busi/event/EventListJSON";
	}

	
	// 여기서 댓글시작
	// 사업자 이벤트 보기
	@RequestMapping("event/busieventDetail")
	public String busiEventDetail(HttpSession session,HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Welcome event/eventDetail !!");

		EventDTO eventDto = new EventDTO();
		eventDto.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		eventDto.setUser_name(CmmUtil.nvl((String) session.getAttribute("USER_NAME")));
			
		// 댓글 리스트
		EventComDTO evee = new EventComDTO();
		evee.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));

		eventDto = eve.busiEventDetail(eventDto);

		model.addAttribute("eventDto", eventDto);

		log.info("End event/eventDetail !!");

		return "/busi/event/busieventDetail";
	}

	/**
	 * 글쓰기 등록하기
	 */
	@RequestMapping("event/busieventForm")
	public String BusiEventReg(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome event/busieventForm !!");

		return "/busi/event/busieventInsert";
	}

	/**
	 * 등록데이터 db 저장하기'
	 */
	@RequestMapping("event/busiInsert")
	public String createBusiEventInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		log.info("Welcome event/busiInsert !!");

		EventDTO eventDto = new EventDTO();
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
		
		eventDto.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		eventDto.setTitle(title);
		eventDto.setContents(contents);
		eventDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
		eventDto.setReg_dt(CmmUtil.nvl(request.getParameter("reg_dt")));
		eventDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
		eventDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		eventDto.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
			
		// select seq로 값 받아와서 view딴의 detail로 보내면
		// 이거대신에 모델.에딧

		log.info("ent_seq : " + CmmUtil.nvl(request.getParameter("ent_seq")));
		log.info("title : " + CmmUtil.nvl(request.getParameter("title")));
		log.info("read_cnt : " + CmmUtil.nvl(request.getParameter("read_cnt")));
		log.info("user_no : " + CmmUtil.nvl(request.getParameter("user_no")));
		log.info("fileGRP : " + CmmUtil.nvl(request.getParameter("fileGRP")));
		log.info("reg_dt : " + CmmUtil.nvl(request.getParameter("reg_dt")));

		// select seq로 값 받아와서 view 딴의 detail로 보내면
		// 이거대신에 모델.에딧
		if (eve.createEventInfo(eventDto)) {
			model.addAttribute("msg", "등록이 완료되었습니다");
		} else {
			model.addAttribute("msg", "등록이 완료되었습니다");
		}
	
		log.info("End event/busiInsert !!");

		return "/busi/event/eventMsgToList";
	}

	// 게시글 삭제
	@RequestMapping("event/busidelete")
	public String deleteBusiEventInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("hellow event/busidelete!!");
		EventDTO eventDto = new EventDTO();
		eventDto.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		if (eve.deleteEventInfo(eventDto)) {
			model.addAttribute("msg", "삭제 완료되었습니다");
		} else {
			model.addAttribute("msg", "삭제 완료되었습니다");
		}
		model.addAttribute("url", "busieventList.do");
		return "/redirect";

	}

	// 게시글 업데이트화면 보여주는곳
	@RequestMapping("event/busieventupdateForm")
	public String busiupdateForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("hellow busievent/updateForm !!");
		EventDTO eventDto = new EventDTO();
		eventDto.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		eventDto = eve.getEventDetailInfo(eventDto);
		eventDto.setContents(eventDto.getContents().replaceAll("<br>", "\r\n"));
		model.addAttribute("eventDto", eventDto);
		return "busi/event/busieventUpdate";
	}

	// 게시글 실제로 DB에 입력되는곳
	@RequestMapping("event/busiupdate")
	public String busiupdateEventInfo(HttpSession session,HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		log.info("ent_seq=" + CmmUtil.nvl(request.getParameter("ent_seq")));
		log.info(CmmUtil.nvl(request.getParameter("title")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));
		log.info(CmmUtil.nvl(request.getParameter("read_cnt")));
		log.info(CmmUtil.nvl(request.getParameter("reg_user_no")));
		log.info(CmmUtil.nvl(request.getParameter("reg_dt")));
		log.info(CmmUtil.nvl(request.getParameter("chg_user_no")));
		log.info(CmmUtil.nvl(request.getParameter("chg_dt")));
		log.info(CmmUtil.nvl(request.getParameter("fileGRP")));

		response.setCharacterEncoding("EUC-KR");
		EventDTO eventDto = new EventDTO();
	
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
				
		eventDto.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		eventDto.setTitle(title);
		eventDto.setContents(contents);
		eventDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
		eventDto.setChg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		eventDto.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		eventDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));

		log.info("byby event/update !!");

		if (eve.updateEventInfo(eventDto)) {
			model.addAttribute("msg", "수정이 완료되었습니다");
		} else {
			model.addAttribute("msg", "수정이 실패하셨습니다");
		}
		model.addAttribute("url", "busieventList.do");
		return "/redirect";
	}

	/**
	 * 댓글 초기 리스트 가져오기
	 */
	@RequestMapping("event/busiCommentList")
	public String getBusiCommentList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome event/busiCommentList !!");

		request.setCharacterEncoding("UTF-8");

		log.info("ent_seq : " + CmmUtil.nvl(request.getParameter("ent_seq")));
		log.info("start_page_size : " + CmmUtil.nvl(request.getParameter("start_page_size")));
		log.info("end_page_size : " + CmmUtil.nvl(request.getParameter("end_page_size")));

		// 댓글 리스트
		EventComDTO pDTO = new EventComDTO();

		pDTO.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		pDTO.setStart_page_size(CmmUtil.nvl(request.getParameter("start_page_size"), "1"));
		pDTO.setEnd_page_size(CmmUtil.nvl(request.getParameter("end_page_size"), "6"));

		EventComDTO rDTO = eve.getBusiCommentList(pDTO);

		model.addAttribute("rDTO", rDTO);

		log.info("End event/busiCommentList !!");

		return "/busi/event/CommentListJSON";
	}

	/**
	 * 댓글 등록
	 */
	@RequestMapping("event/busiInsertComment")
	public String busiinsertComment(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap model) throws Exception {
		request.setCharacterEncoding("UTF-8");
		log.info("Welcome event/busiInsertComment");
		
		String res = ""; // 처리 결과
		EventComDTO evee = new EventComDTO();

		
		log.info(CmmUtil.nvl(request.getParameter("ent_seq")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));

		
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
			
		
		evee.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		evee.setContents(contents);
		evee.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		evee.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));

		if (eve.createComment(evee)) {
			// 등록 성공
			res = "1";

		} else {

			// 등록 실패
			res = "0";

		}

		model.addAttribute("res", res);

		return "/busi/event/CommentProc";
	}

	/**
	 * 댓글 수정
	 */
	@RequestMapping("event/busiUpdateComment")
	public String busiUpdateComment(HttpSession session, HttpServletRequest request, HttpServletResponse response,ModelMap model)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		log.info("busiUpdateComment");
		
		String res = ""; // 처리 결과

		EventComDTO evee = new EventComDTO();
		
		
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
			
		
		evee.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		evee.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		evee.setContents(contents);
		evee.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		evee.setChg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		evee.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));

		if (eve.updateComment(evee)) {
			// 수정 성공
			res = "1";

		} else {
			// 수정 실패
			res = "0";

		}

		model.addAttribute("res", res);

		return "/busi/event/CommentProc";

	}

	/**
	 * 댓글 삭제
	 */
	@RequestMapping("event/busiDeleteComment")
	public String busideleteComment(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("hi event/busideleteComment ");

		String res = ""; // 처리 결과

		EventComDTO evee = new EventComDTO();
		evee.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		evee.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));

		if (eve.deleteComment(evee)) {
			// 등록 성공
			res = "1";

		} else {
			// 등록 실패
			res = "0";

		}

		model.addAttribute("res", res);

		return "/busi/event/CommentProc";

	}

	// 체크박스 삭제 컨트롤러
	@RequestMapping("event/busideleteCheck")
	public String busideleteCheck(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Hellow event/busideleteCheck");

		String[] del_chk = request.getParameterValues("del_chk");

		for (String a : del_chk) {
			System.out.println(a);
		}
		EventDTO pDTO = new EventDTO();

		pDTO.setAllCheckSeq(del_chk);

		if (eve.deleteAllCheckList(pDTO)) {
			model.addAttribute("msg", "삭제가 완료되었습니다");

		} else {
			model.addAttribute("msg", "삭제가 완료되었습니다");

		}
		log.info("byby event/busideleteCheck");
		pDTO = null;

		model.addAttribute("url", "busieventList.do");
		return "/redirect";
	}

	/*
	 * #########################################################################
	 * #
	 * 
	 * 사업자 용 끝
	 * 
	 * #########################################################################
	 * #
	 * 
	 */

	/*
	 * #########################################################################
	 * #
	 * 
	 * 사용자용 시작
	 * 
	 * #########################################################################
	 * #
	 * 
	 */

	
	
	
	
	// 사용자 이벤트 리스트 가져오기
	@RequestMapping("event/guestEventList") // board.html
	public String guesteventList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome event/guesteventList !!");

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

		
		log.info("End event/guesteventList !!");

		return "/guest/event/guestEventList";
	}

	/**
	 * 게시판 초기 리스트 가져오기
	 */

	@RequestMapping("event/guestEventIndex")
	public String guestEventIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome event/guestEventIndex !!");

		request.setCharacterEncoding("UTF-8");
	
		
		// 게시판 리스트
		EventDTO pDTO = new EventDTO();

		pDTO.setStart_page(CmmUtil.nvl(request.getParameter("start_page"), "1"));
		pDTO.setEnd_page(CmmUtil.nvl(request.getParameter("end_page"), "6"));
		pDTO.setSearchBox(CmmUtil.nvl(request.getParameter("searchBox")));
		pDTO.setSearchText(CmmUtil.nvl(request.getParameter("searchText")));
		
		log.info("SearchBox : " + pDTO.getSearchBox());
		log.info("SearchText : " + pDTO.getSearchText());
	

		EventDTO rDTO = eve.getBusiList(pDTO);
		
		model.addAttribute("rDTO", rDTO);

		log.info("End event/guestEventIndex!!");

		return "/guest/event/guestEventListJSON";
	}

	
	
	/**
	 * 글쓰기 등록하기
	 */
	@RequestMapping("event/guestEventForm")
	public String guestEventReg(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome event/guesteventForm !!");

		return "/guest/event/guestEventInsert";
	}

	/**
	 * 등록데이터 db 저장하기'
	 */
	@RequestMapping("event/guestInsert")
	public String createguestEventInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		log.info("Welcome event/guestEventInsert !!");
		request.setCharacterEncoding("EUC-KR");
		log.info("ent_seq : " + CmmUtil.nvl(request.getParameter("ent_seq")));
		log.info("title : " + CmmUtil.nvl(request.getParameter("title")));
		log.info("contents : " + CmmUtil.nvl(request.getParameter("contents")));
		log.info("read_cnt : " + CmmUtil.nvl(request.getParameter("read_cnt")));
		log.info("user_no : " + CmmUtil.nvl(request.getParameter("user_no")));
		log.info("fileGRP : " + CmmUtil.nvl(request.getParameter("fileGRP")));
		log.info("reg_dt : " + CmmUtil.nvl(request.getParameter("reg_dt")));
		log.info("Reg_user_no : " + CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		log.info("User_no : " + CmmUtil.nvl((String) session.getAttribute("USER_NO")));
				
		EventDTO eventDto = new EventDTO();

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
			
		eventDto.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		eventDto.setTitle(title);
		eventDto.setContents(contents);
		eventDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
		eventDto.setReg_dt(CmmUtil.nvl(request.getParameter("reg_dt")));
		eventDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
		eventDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		eventDto.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));

		if (eve.createEventInfo(eventDto)) {
			model.addAttribute("msg", "등록이 완료되셨습니다");
		} else {
			model.addAttribute("msg", "등록이 실패하셨습니다");
		}

		log.info("End event/guestInsert !!");

		return "/guest/event/eventMsgToList";
	}

	// 게시판 상세 보기 컨트롤러
	@RequestMapping("event/guestEventDetail")
	public String guestEventDetail(HttpSession session,HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome event/guestEventDetail !!");

		EventDTO eventDto = new EventDTO();
		eventDto.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		
		log.info("session:"+CmmUtil.nvl((String) session.getAttribute("USER_NO")));
	
		EventComDTO evee = new EventComDTO();
		evee.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		evee.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		eventDto = eve.getEventDetail(eventDto, evee);

		model.addAttribute("eventDto", eventDto);
		log.info("END event/guestEventDetail !!");

		return "/guest/event/guestEventDetail";
	}

	// 게시글 삭제
	@RequestMapping("event/guestdelete")
	public String deleteguestEventInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("hellow event/guestdelete!!");
		EventDTO eventDto = new EventDTO();
		eventDto.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		if (eve.deleteEventInfo(eventDto)) {
			model.addAttribute("msg", "삭제 완료되었습니다");
		} else {
			model.addAttribute("msg", "삭제 완료되었습니다");
		}
		model.addAttribute("url", "guestEventList.do");
		log.info("byby event/guestdelete!!");
		return "/redirect";

	}

	// 게시글 업데이트 뷰단 보여주는컨트롤러
	@RequestMapping("event/guestUpdateForm")
	public String guestupdateForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("hellow event/guestUpdateForm !!");
		EventDTO eventDto = new EventDTO();
		eventDto.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		eventDto = eve.getEventDetailInfo(eventDto);
		eventDto.setContents(eventDto.getContents().replaceAll("<br>", "\r\n"));
		model.addAttribute("eventDto", eventDto);
		return "guest/event/guestEventUpdate";
	}
	
	//사용자 게시물 업데이트
	@RequestMapping("event/guestUpdate")
	public String guestupdateEventInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		log.info("Hellow event/guestUpdate !!");
		log.info("ent_seq=" + CmmUtil.nvl(request.getParameter("ent_seq")));
		log.info(CmmUtil.nvl(request.getParameter("title")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));
		log.info(CmmUtil.nvl(request.getParameter("read_cnt")));
		log.info(CmmUtil.nvl(request.getParameter("chg_user_no")));
		log.info(CmmUtil.nvl(request.getParameter("chg_dt")));
		log.info(CmmUtil.nvl(request.getParameter("fileGRP")));

		EventDTO eventDto = new EventDTO();

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
		
		eventDto.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		eventDto.setTitle(title);
		eventDto.setContents(contents);
		eventDto.setRead_cnt(CmmUtil.nvl(request.getParameter("read_cnt")));
		eventDto.setChg_user_no(CmmUtil.nvl(request.getParameter("chg_user_no")));
		eventDto.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
		eventDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));

		log.info("byby event/guestUpdate !!");

		if (eve.updateEventInfo(eventDto)) {
			model.addAttribute("msg", "수정이 완료되었습니다");
		} else {
			model.addAttribute("msg", "수정을 실패하였습니다");
		}
		model.addAttribute("url", "guestEventList.do");
		return "/redirect";

	}

	/**
	 * 댓글 초기 리스트 가져오기
	 */
	@RequestMapping("event/guestCommentList")
	public String getguestCommentList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		log.info("Welcome event/guestCommentList !!");
		log.info("ent_seq : " + CmmUtil.nvl(request.getParameter("ent_seq")));
		log.info("start_page_size : " + CmmUtil.nvl(request.getParameter("start_page_size")));
		log.info("end_page_size : " + CmmUtil.nvl(request.getParameter("end_page_size")));

		// 댓글 리스트
		EventComDTO pDTO = new EventComDTO();
	
		pDTO.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		pDTO.setStart_page_size(CmmUtil.nvl(request.getParameter("start_page_size"), "1"));
		pDTO.setEnd_page_size(CmmUtil.nvl(request.getParameter("end_page_size"), "6"));

		EventComDTO rDTO = eve.getBusiCommentList(pDTO);

		model.addAttribute("rDTO", rDTO);

		log.info("End event/guestCommentList !!");

		return "/guest/event/guestCommentListJSON";
	}

	/**
	 * 댓글 등록
	 */
	@RequestMapping("event/guestInsertComment")
	public String guestinsertComment(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap model) throws Exception {
		request.setCharacterEncoding("UTF-8");
		log.info("Welcome event/guestInsertComment");
		
		String res = ""; // 처리 결과
		EventComDTO evee = new EventComDTO();
		
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
		
		
		log.info(CmmUtil.nvl(request.getParameter("ent_seq")));
		log.info(CmmUtil.nvl(request.getParameter("contents")));

		evee.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		evee.setContents(contents);
		evee.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		evee.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));

		if (eve.createComment(evee)) {
			// 등록 성공
			res = "1";

		} else {

			// 등록 실패
			res = "0";
		}

		model.addAttribute("res", res);

		return "/guest/event/CommentProc";
	}

	/**
	 * 댓글 수정
	 */
	@RequestMapping("event/guestUpdateComment")
	public String guestUpdateComment(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
	
		request.setCharacterEncoding("UTF-8");
		log.info("Hellow event/guestUpdateComment");
	
		String res = ""; // 처리 결과

		EventComDTO evee = new EventComDTO();
		
		String contents =CmmUtil.nvl(request.getParameter("contents"));
		
		contents = contents.replaceAll("\r", "<br>").replaceAll("\n", "<br>");
		contents = contents.replaceAll("& #39;","'");
		contents = contents.replaceAll("& #40;","(");
		contents = contents.replaceAll("& #41;",")");
		contents = contents.replaceAll("& lt;","<");
		contents = contents.replaceAll("& gt;",">");
			
		evee.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		evee.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));
		evee.setContents(contents);
		evee.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		evee.setChg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		evee.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));

		if (eve.updateComment(evee)) {
			// 수정 성공
			res = "1";

		} else {
			// 수정 실패
			res = "0";

		}

		model.addAttribute("res", res);

		return "/guest/event/CommentProc";

	}

	/**
	 * 댓글 삭제
	 */
	@RequestMapping("event/guestDeleteComment")
	public String guestdeleteComment(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("hi event/guestDeleteComment ");

		String res = ""; // 처리 결과

		EventComDTO evee = new EventComDTO();
		evee.setEnt_seq(CmmUtil.nvl(request.getParameter("ent_seq")));
		evee.setCom_seq(CmmUtil.nvl(request.getParameter("com_seq")));

		if (eve.deleteComment(evee)) {
			// 등록 성공
			res = "1";

		} else {
			// 등록 실패
			res = "0";

		}

		model.addAttribute("res", res);

		return "/guest/event/CommentProc";

	}

	// 체크박스 삭제 컨트롤러
	@RequestMapping("event/guestdeleteCheck")
	public String guestdeleteCheck(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Hellow event/guestdeleteCheck");

		String[] del_chk = request.getParameterValues("del_chk");

		for (String a : del_chk) {
			System.out.println(a);
		}
		EventDTO pDTO = new EventDTO();

		pDTO.setAllCheckSeq(del_chk);

		if (eve.deleteAllCheckList(pDTO)) {
			model.addAttribute("msg", "삭제가 완료되었습니다");

		} else {
			model.addAttribute("msg", "삭제가 완료되었습니다");

		}

		log.info("byby event/guestdeleteCheck");
		pDTO = null;

		model.addAttribute("url", "guestEventList.do");
		return "/redirect";
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
