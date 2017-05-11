package ac.kr.ft.com.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import ac.kr.ft.com.dto.CtrDTO;
import ac.kr.ft.com.dto.EventDTO;
import ac.kr.ft.com.service.ICtrService;
import ac.kr.ft.com.util.CmmUtil;

@Controller
public class CtrController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "CtrService")
	private ICtrService ctr;

	// * jy대신 ctr로
	@RequestMapping("jy")
	public String add(@RequestParam Map<String, Object> map, ModelMap model) {
		System.out.println("화이팅하자");
		return "/ctr/samplePage";
	}

	/*
	 * #########################################################################
	 * # # 관리자 용 #
	 * #########################################################################
	 * #
	 * 
	 */

	@RequestMapping("ctr/ctrList")
	public String getCTRList(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception {
		log.info("Welcome ctr/ctrList !!"); 
		
		List<CtrDTO> rList = ctr.getCTRList();
		model.addAttribute("rList", rList);
		
		log.info("End ctr/ctrList !!"); 
		
		return "/ctr/ctrList";
	}
	
	@RequestMapping("ctr/ctrDetail")
	public String getCTRDetail(HttpServletRequest request,HttpServletResponse response, ModelMap model)throws Exception {
		
		log.info("Welcome ctr/ctrDetail !!"); 
		
		CtrDTO ctrDto = new CtrDTO();
		ctrDto.setCtr_seq(CmmUtil.nvl(request.getParameter("ctr_seq")));
		ctrDto = ctr.getCTRDetail(ctrDto);
		model.addAttribute("ctrDto",ctrDto);
	
		
		log.info("End ctr/ctrDetail !!"); 
		
		return "ctr/ctrDetail";
	}

	/**
	 * 등록화면 보여주기
	 * */
  	@RequestMapping("ctr/ctrRegform")
	public String insertForm(HttpServletRequest request,HttpServletResponse response, ModelMap model)throws Exception{
  		log.info("Welcome ctr/ctrReg !!"); 
  		
  		log.info("End ctr/ctrReg !!"); 
  		
  		return "/ctr/ctrReg";
	}
  	
	/**
	 * 등록데이터 db 저장하기
	 * */  	
	@RequestMapping("ctr/ctrReg")
	public String createCTRInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
		
		log.info("Welcome ctr/ctrReg !!"); 
		
		
		CtrDTO ctrDto = new CtrDTO();

		String contents = CmmUtil.nvl(request.getParameter("contents"));
		contents = contents.replaceAll("\r\n", "<br>");
		
		ctrDto.setTitle(CmmUtil.nvl(request.getParameter("title")));
		ctrDto.setContents(contents);
		ctrDto.setProgress(CmmUtil.nvl("R"));
		ctrDto.setUser_name(CmmUtil.nvl(request.getParameter("user_name")));
		ctrDto.setEmail1(CmmUtil.nvl(request.getParameter("email1")));
		ctrDto.setEmail2(CmmUtil.nvl(request.getParameter("email2")));
		
		ctrDto.setTel_1(CmmUtil.nvl(request.getParameter("tel_1")));
		ctrDto.setTel_2(CmmUtil.nvl(request.getParameter("tel_2")));
		ctrDto.setTel_3(CmmUtil.nvl(request.getParameter("tel_3")));
		ctrDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		
		//ctrDto.setReg_user_no(CmmUtil.nvl(request.getParameter("reg_user_no")));
		
		
		log.info("title : "+ CmmUtil.nvl(request.getParameter("title"))); 
		log.info("contents : "+ CmmUtil.nvl(request.getParameter("contents"))); 
		log.info("progress : "+ CmmUtil.nvl(request.getParameter("progress"))); 
		log.info("user_name : "+ CmmUtil.nvl(request.getParameter("user_name"))); 
		log.info("email1 : "+ CmmUtil.nvl(request.getParameter("email1"))); 
		log.info("email2 : "+ CmmUtil.nvl(request.getParameter("email2"))); 
		log.info("tel_1 : "+ CmmUtil.nvl(request.getParameter("tel_1"))); 
		log.info("tel_2 : "+ CmmUtil.nvl(request.getParameter("tel_2"))); 
		log.info("tel_3 : "+ CmmUtil.nvl(request.getParameter("tel_3"))); 
		log.info("reg_user_no : "+ CmmUtil.nvl(request.getParameter("reg_user_no"))); 
		
		//select seq로 값 받아와서 view 딴의 detail로 보내면
		//이거대신에 모델.에딧
		if(ctr.createCTRInfo(ctrDto)){
			request.setAttribute("msg", "등록이 완료되었습니다.");
		}else{
			request.setAttribute("msg", "등록이 실패하였습니다.");
		}
		//request.setAttribute("url", "detail.do?ctr_seq=1");
		
		log.info("End ctr/ctrReg !!"); 
		
		return "/ctr/ctrMsgToList";
	}
	
	@RequestMapping("ctr/delete")
	public String deleteCTRInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
		log.info("Welcome delete !!"); 
		CtrDTO ctrDto = new CtrDTO();
		ctrDto.setCtr_seq(CmmUtil.nvl(request.getParameter("ctr_seq")));
		if(ctr.deleteCTRInfo(ctrDto)){
			request.setAttribute("msg", "삭제가 완료되었습니다.");
		}else{
			request.setAttribute("msg", "삭제가 실패하였습니다.");
		}
		model.addAttribute("url", "/ctr/ctrList.do");
		return "/redirect";
	}
	
	@RequestMapping("ctr/ctrUpdateForm")
	public String updateForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
		log.info("Welcome ctr/ctrUpdateForm !!"); 
		CtrDTO ctrDto = new CtrDTO();
		ctrDto.setCtr_seq(CmmUtil.nvl(request.getParameter("ctr_seq")));
		ctrDto = ctr.getCTRDetail(ctrDto);
		
		ctrDto.setContents(ctrDto.getContents().replaceAll("<br>", "\r\n"));
		
		model.addAttribute("ctrDto",ctrDto);
		
		log.info("End ctr/ctrUpdateForm !!"); 
		return "/ctr/ctrUpdate";
	}
	
	@RequestMapping("ctr/ctrUpdate")
	public String updateCTRInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{

		log.info("Welcome ctr/ctrUpdateForm !!"); 
		response.setCharacterEncoding("euc-kr");
		
		String contents = CmmUtil.nvl(request.getParameter("contents"));
		contents = contents.replaceAll("\r\n", "<br>");
		
		CtrDTO ctrDto = new CtrDTO();
		
		ctrDto.setCtr_seq(CmmUtil.nvl(request.getParameter("ctr_seq")));
		ctrDto.setTitle(CmmUtil.nvl(request.getParameter("title")));
		ctrDto.setContents(contents);
		ctrDto.setProgress(CmmUtil.nvl(request.getParameter("progress")));
		ctrDto.setUser_name(CmmUtil.nvl(request.getParameter("user_name")));
		ctrDto.setEmail1(CmmUtil.nvl(request.getParameter("email1")));
		ctrDto.setEmail2(CmmUtil.nvl(request.getParameter("email2")));
		ctrDto.setTel_1(CmmUtil.nvl(request.getParameter("tel_1")));
		ctrDto.setTel_2(CmmUtil.nvl(request.getParameter("tel_2")));
		ctrDto.setTel_3(CmmUtil.nvl(request.getParameter("tel_3")));
		ctrDto.setChg_user_no(CmmUtil.nvl(request.getParameter("chg_user_no")));
		ctrDto.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));	
		
		log.info("ctr_seq : "+ CmmUtil.nvl(request.getParameter("ctr_seq"))); 
		log.info("title : "+ CmmUtil.nvl(request.getParameter("title"))); 
		log.info("contents : "+ CmmUtil.nvl(request.getParameter("contents"))); 
		log.info("progress : "+ CmmUtil.nvl(request.getParameter("progress"))); 
		log.info("user_name : "+ CmmUtil.nvl(request.getParameter("user_name"))); 
		log.info("email1 : "+ CmmUtil.nvl(request.getParameter("email1"))); 
		log.info("email2 : "+ CmmUtil.nvl(request.getParameter("email2"))); 
		log.info("tel_1 : "+ CmmUtil.nvl(request.getParameter("tel_1"))); 
		log.info("tel_2 : "+ CmmUtil.nvl(request.getParameter("tel_2"))); 
		log.info("tel_3 : "+ CmmUtil.nvl(request.getParameter("tel_3"))); 
		log.info("chg_user_no : "+ CmmUtil.nvl(request.getParameter("chg_user_no"))); 
		log.info("chg_dt : "+ CmmUtil.nvl(request.getParameter("chg_dt"))); 
		
		if(ctr.updateCTRInfo(ctrDto)){
			request.setAttribute("msg", "수정이 완료되었습니다.");
		}else{
			request.setAttribute("msg", "수정이 실패하였습니다.");
		}
		model.addAttribute("url", "ctrList.do");
		
		return "/redirect";
	}
	
	@RequestMapping("ctr/deleteAllCheckList")
	public String deleteAllCheckList(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
		log.info("Welcome deleteAllCheckList !!"); 
		
		String[] allCheckSeq = request.getParameterValues("del_chk");
		
		CtrDTO pDTO = new CtrDTO();
		
		pDTO.setAllCheckSeq(allCheckSeq);
		 
		if(ctr.deleteAllCheckList(pDTO)){
			request.setAttribute("msg", "삭제가 완료되었습니다.");
			
		}else{
			request.setAttribute("msg", "삭제가 실패하였습니다.");
			
		}
		
		pDTO = null;
		
		model.addAttribute("url", "ctrList.do");
		return "/redirect";
	}
	
	@RequestMapping("ctr/updateCheck")
	public String updateCheck(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
		log.info("Welcome updateCheck !!");
		String[] chk = request.getParameterValues("del_chk");
		int i=0;
		while(i<chk.length){
			CtrDTO ctrDto = new CtrDTO();
			ctrDto.setCtr_seq(chk[i]);
			ctrDto.setProgress(CmmUtil.nvl(request.getParameter("pro_"+chk[i])));
			if(ctr.updateCheck(ctrDto)){
				model.addAttribute("msg","수정이 완료되었습니다.");
			}else{
				model.addAttribute("msg","수정이 실패하였습니다.");
				break;
			}
			i++;
		}
		model.addAttribute("url","ctrList.do");
		return "/redirect";
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
	 * #
	 * 
	 */

	// 사업자 이벤트 리스트 가져오기
	@RequestMapping("ctr/BusictrList") // board.html
	public String getEvent(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		log.info("Welcome ctr/BusictrList !!");

		String auth = (String) request.getSession().getAttribute("AUTH");
		if (auth == null || auth.trim().equals("")) {
			return "/noAuth";
		}

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

		// String user_no =
		// (String)request.getSession().getAttribute("USER_NO");
		log.info("End ctr/BusictrList !!");

		return "/busi/ctr/BusictrList";
	}

	/**
	 * 게시판 초기 리스트 가져오기
	 */

	@RequestMapping("ctr/busiCtrIndex")
	public String getBusiIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Welcome ctr/busiCtrIndex !!");
		String auth = (String) request.getSession().getAttribute("AUTH");
		String user_no = (String) request.getSession().getAttribute("USER_NO");
	
		
		CtrDTO pDTO = new CtrDTO();

		/*
		 * if(auth.equals("U")){ pDTO.setUser_no(user_no); }
		 */

		request.setCharacterEncoding("UTF-8");

		// 게시판 리스트

		pDTO.setStart_page(CmmUtil.nvl(request.getParameter("start_page"), "1"));
		pDTO.setEnd_page(CmmUtil.nvl(request.getParameter("end_page"), "6"));
		pDTO.setSearchBox(CmmUtil.nvl(request.getParameter("searchBox")));
		pDTO.setSearchText(CmmUtil.nvl(request.getParameter("searchText")));

		log.info("SearchBox : " + pDTO.getSearchBox());
		log.info("SearchText : " + pDTO.getSearchText());

		CtrDTO rDTO = ctr.getBusiList(pDTO);

		model.addAttribute("rDTO", rDTO);

		log.info("End ctr/busiCtrIndex !!");
		return "/busi/ctr/CtrListJSON";
	}


	@RequestMapping("ctr/BusictrDetail")
	public String getBusiCTRDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Welcome ctr/BusictrDetail !!");

		CtrDTO ctrDto = new CtrDTO();
		ctrDto.setCtr_seq(CmmUtil.nvl(request.getParameter("ctr_seq")));
		ctrDto = ctr.getBusiCTRDetail(ctrDto);
		model.addAttribute("ctrDto", ctrDto);

		log.info("End ctr/BusictrDetail !!");

		return "/busi/ctr/BusictrDetail";
	}

	/**
	 * 등록화면 보여주기
	 */
	@RequestMapping("ctr/BusictrRegform")
	public String insertBusiForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome ctr/BusictrReg !!");

		String auth = (String) request.getSession().getAttribute("AUTH");
		
		if (auth == null || auth.trim().equals("")) {
			return "/noAuth";
		}

		log.info("End ctr/BusictrReg !!");

		return "/busi/ctr/BusictrReg";
	}

	/**
	 * 등록데이터 db 저장하기
	 */
	@RequestMapping("ctr/BusictrReg")
	public String createBusiCTRInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		log.info("Welcome ctr/BusictrReg !!");

		CtrDTO ctrDto = new CtrDTO();

		String contents = CmmUtil.nvl(request.getParameter("contents"));
		contents = contents.replaceAll("\r\n", "<br>");

		ctrDto.setTitle(CmmUtil.nvl(request.getParameter("title")));
		ctrDto.setPeople(CmmUtil.nvl(request.getParameter("people")));
		ctrDto.setPlace(CmmUtil.nvl(request.getParameter("place")));
		ctrDto.setUser_name(CmmUtil.nvl(request.getParameter("user_name")));
		ctrDto.setContents(contents);
		ctrDto.setEmail1(CmmUtil.nvl(request.getParameter("email1")));
		ctrDto.setEmail2(CmmUtil.nvl(request.getParameter("email2")));
		ctrDto.setProgress(CmmUtil.nvl("R"));
		ctrDto.setTel_1(CmmUtil.nvl(request.getParameter("tel_1")));
		ctrDto.setTel_2(CmmUtil.nvl(request.getParameter("tel_2")));
		ctrDto.setTel_3(CmmUtil.nvl(request.getParameter("tel_3")));
		ctrDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		ctrDto.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));

		log.info("title : " + CmmUtil.nvl(request.getParameter("title")));
		log.info("people : " + CmmUtil.nvl(request.getParameter("people")));
		log.info("place : " + CmmUtil.nvl(request.getParameter("place")));
		log.info("contents : " + CmmUtil.nvl(request.getParameter("contents")));
		log.info("user_name : " + CmmUtil.nvl(request.getParameter("user_name")));
		log.info("progress : " + CmmUtil.nvl(request.getParameter("progress")));
		log.info("tel_1 : " + CmmUtil.nvl(request.getParameter("tel_1")));
		log.info("tel_2 : " + CmmUtil.nvl(request.getParameter("tel_2")));
		log.info("tel_3 : " + CmmUtil.nvl(request.getParameter("tel_3")));
		log.info("reg_user_no : " + CmmUtil.nvl(request.getParameter("reg_user_no")));

		// 조인 해야함
		// select seq로 값 받아와서 view 딴의 detail로 보내면
		// 이거대신에 모델.에딧
		if (ctr.createBusiCTRInfo(ctrDto)) {
			request.setAttribute("msg", "등록이 완료되었습니다.");
		} else {
			request.setAttribute("msg", "동륵이 실패하였습니다.");
		}
		// request.setAttribute("url", "detail.do?ctr_seq=1");

		log.info("End ctr/BusictrReg !!");

		return "/busi/ctr/BusictrMsgToList";
	}

	@RequestMapping("ctr/Busidelete")
	public String deleteBusiCTRInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome delete !!");
		CtrDTO ctrDto = new CtrDTO();
		ctrDto.setCtr_seq(CmmUtil.nvl(request.getParameter("ctr_seq")));
		if (ctr.deleteBusiCTRInfo(ctrDto)) {
			request.setAttribute("msg", "삭제가 완료되었습니다.");
		} else {
			request.setAttribute("msg", "삭제가 실패하였습니다.");
		}
		model.addAttribute("url", "/ctr/BusictrList.do");
		return "/redirect";
	}

	@RequestMapping("ctr/BusictrUpdateForm")
	public String updateBusiForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome ctr/BusictrUpdateForm !!");
		CtrDTO ctrDto = new CtrDTO();
		ctrDto.setCtr_seq(CmmUtil.nvl(request.getParameter("ctr_seq")));
		ctrDto = ctr.getBusiCTRDetail(ctrDto);

		ctrDto.setContents(ctrDto.getContents().replaceAll("<br>", "\r\n"));

		model.addAttribute("ctrDto", ctrDto);
		log.info("End ctr/BusictrUpdateForm !!");
		return "/busi/ctr/BusictrUpdate";
	}

	@RequestMapping("ctr/BusictrUpdate")
	public String updateBusiCTRInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Welcome ctr/BusictrUpdate !!");
		response.setCharacterEncoding("euc-kr");

		String contents = CmmUtil.nvl(request.getParameter("contents"));
		contents = contents.replaceAll("\r\n", "<br>");

		CtrDTO ctrDto = new CtrDTO();
		ctrDto.setCtr_seq(CmmUtil.nvl(request.getParameter("ctr_seq")));
		ctrDto.setTitle(CmmUtil.nvl(request.getParameter("title")));
		ctrDto.setUser_name(CmmUtil.nvl(request.getParameter("user_name")));
		ctrDto.setContents(contents);
		ctrDto.setPeople(CmmUtil.nvl(request.getParameter("people")));
		ctrDto.setPlace(CmmUtil.nvl(request.getParameter("place")));
		ctrDto.setTel_1(CmmUtil.nvl(request.getParameter("tel_1")));
		ctrDto.setTel_2(CmmUtil.nvl(request.getParameter("tel_2")));
		ctrDto.setTel_3(CmmUtil.nvl(request.getParameter("tel_3")));

		ctrDto.setProgress(CmmUtil.nvl(request.getParameter("progress")));

		ctrDto.setChg_user_no(CmmUtil.nvl(request.getParameter("chg_user_no")));
		ctrDto.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));

		log.info("ctr_seq : " + CmmUtil.nvl(request.getParameter("ctr_seq")));
		log.info("title : " + CmmUtil.nvl(request.getParameter("title")));
		log.info("user_name : " + CmmUtil.nvl(request.getParameter("user_name")));
		log.info("contents : " + CmmUtil.nvl(request.getParameter("contents")));
		log.info("people : " + CmmUtil.nvl(request.getParameter("people")));
		log.info("place : " + CmmUtil.nvl(request.getParameter("place")));
		log.info("tel_1 : " + CmmUtil.nvl(request.getParameter("tel_1")));
		log.info("tel_2 : " + CmmUtil.nvl(request.getParameter("tel_2")));
		log.info("tel_3 : " + CmmUtil.nvl(request.getParameter("tel_3")));
		log.info("chg_user_no : " + CmmUtil.nvl(request.getParameter("chg_user_no")));
		log.info("chg_dt : " + CmmUtil.nvl(request.getParameter("chg_dt")));
		log.info("progress : " + CmmUtil.nvl(request.getParameter("progress")));

		if (ctr.updateBusiCTRInfo(ctrDto)) {
			model.addAttribute("msg", "수정이 완료되었습니다.");
		} else {
			model.addAttribute("msg", "수정이 실패하였습니다.");
		}
		model.addAttribute("url", "BusictrList.do");
		// 수정뷰딴에서 취소버튼 눌렀을 때 어쩌지
		return "/redirect";
	}

	@RequestMapping("ctr/BusideleteAllCheckList")
	public String deleteBusiAllCheckList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome deleteBusiAllCheckList !!");

		String[] allCheckSeq = request.getParameterValues("del_chk");

		CtrDTO pDTO = new CtrDTO();

		pDTO.setAllCheckSeq(allCheckSeq);

		if (ctr.deleteBusiAllCheckList(pDTO)) {
			request.setAttribute("msg", "삭제가 완료되었습니다.");

		} else {
			request.setAttribute("msg", "삭제가 실패하였습니다.");

		}

		pDTO = null;

		model.addAttribute("url", "BusictrList.do");
		return "/redirect";
	}

	@RequestMapping("ctr/BusiupdateCheck")
	public String updateBusiCheck(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome updateCheck !!");
		String[] chk = request.getParameterValues("del_chk");
		int i = 0;
		while (i < chk.length) {
			CtrDTO ctrDto = new CtrDTO();
			ctrDto.setCtr_seq(chk[i]);
			ctrDto.setProgress(CmmUtil.nvl(request.getParameter("pro_" + chk[i])));
			if (ctr.updateBusiCheck(ctrDto)) {
				model.addAttribute("msg", "수정이 성공하였습니다.");
			} else {
				model.addAttribute("msg", "수정이 실패하였습니다.");
				break;
			}
			i++;
		}
		model.addAttribute("url", "BusictrList.do");
		return "/redirect";
	}

	/*
	 * #########################################################################
	 * # # 사업자용 끝 #
	 * #########################################################################
	 * #
	 * 
	 */

	/*
	 * #########################################################################
	 * # # 사용자 시작 #
	 * #########################################################################
	 * #
	 * 
	 */
	// 사업자 이벤트 리스트 가져오기
	@RequestMapping("ctr/GuestctrList") // board.html
	public String getEvent2(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		log.info("Welcome ctr/GuestctrList !!");
		String auth = (String) request.getSession().getAttribute("AUTH");
		// String user_no =
		// (String)request.getSession().getAttribute("USER_NO");
		if (auth == null || auth.trim().equals("")) {
			return "/noAuth";
		}
		
		log.info("End ctr/GuestctrList !!");
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

		return "/guest/ctr/GuestctrList";
	}

	/**
	 * 게시판 초기 리스트 가져오기
	 */

	@RequestMapping("ctr/GuestCtrIndex")
	public String getGuestIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Welcome ctr/GuestCtrIndex !!");
		String auth = (String) request.getSession().getAttribute("AUTH");
		String user_no = (String) request.getSession().getAttribute("USER_NO");
		System.out.println(auth);

		CtrDTO pDTO = new CtrDTO();
		/*
		 * if(auth.equals("U")){ pDTO.setUser_no(user_no); }
		 */

		request.setCharacterEncoding("UTF-8");

		// 게시판 리스트
		pDTO.setUser_no(user_no);
		pDTO.setStart_page(CmmUtil.nvl(request.getParameter("start_page"), "1"));
		pDTO.setEnd_page(CmmUtil.nvl(request.getParameter("end_page"), "6"));
		pDTO.setSearchBox(CmmUtil.nvl(request.getParameter("searchBox")));
		pDTO.setSearchText(CmmUtil.nvl(request.getParameter("searchText")));
		
		log.info("SearchBox : " + pDTO.getSearchBox());
		log.info("SearchText : " + pDTO.getSearchText());

		
		CtrDTO rDTO = ctr.getGuestList(pDTO);

		model.addAttribute("rDTO", rDTO);

		log.info("End ctr/GuestCtrIndex !!");
		return "/guest/ctr/CtrListJSON";
	}



	@RequestMapping("ctr/GuestctrDetail")
	public String getGuestCTRDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Welcome ctr/GuestctrDetail !!");

		CtrDTO ctrDto = new CtrDTO();
		ctrDto.setCtr_seq(CmmUtil.nvl(request.getParameter("ctr_seq")));
		ctrDto = ctr.getGuestCTRDetail(ctrDto);
		model.addAttribute("ctrDto", ctrDto);

		log.info("End ctr/GuestctrDetail !!");

		return "/guest/ctr/GuestctrDetail";
	}

	/**
	 * 등록화면 보여주기
	 */
	@RequestMapping("ctr/GuestctrRegform")
	public String insertGuestForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome ctr/GuestctrReg !!");
		String auth = (String) request.getSession().getAttribute("AUTH");
		// String user_no =
		// (String)request.getSession().getAttribute("USER_NO");
		if (auth == null || auth.trim().equals("")) {
			return "/noAuth";
		}
		log.info("End ctr/GuestctrReg !!");

		return "/guest/ctr/GuestctrReg";
	}

	/**
	 * 등록데이터 db 저장하기
	 */
	@RequestMapping("ctr/GuestctrReg")
	public String createGuestCTRInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		log.info("Welcome ctr/GuestctrReg !!");

		CtrDTO ctrDto = new CtrDTO();

		String contents = CmmUtil.nvl(request.getParameter("contents"));
		contents = contents.replaceAll("\r\n", "<br>");

		ctrDto.setTitle(CmmUtil.nvl(request.getParameter("title")));
		ctrDto.setPeople(CmmUtil.nvl(request.getParameter("people")));
		ctrDto.setPlace(CmmUtil.nvl(request.getParameter("place")));
		ctrDto.setUser_name(CmmUtil.nvl(request.getParameter("user_name")));
		ctrDto.setContents(contents);

		ctrDto.setEmail1(CmmUtil.nvl(request.getParameter("email1")));
		ctrDto.setEmail2(CmmUtil.nvl(request.getParameter("email2")));
		ctrDto.setProgress(CmmUtil.nvl("R"));
		ctrDto.setTel_1(CmmUtil.nvl(request.getParameter("tel_1")));
		ctrDto.setTel_2(CmmUtil.nvl(request.getParameter("tel_2")));
		ctrDto.setTel_3(CmmUtil.nvl(request.getParameter("tel_3")));
		ctrDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
		ctrDto.setUser_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));

		log.info("title : " + CmmUtil.nvl(request.getParameter("title")));
		log.info("people : " + CmmUtil.nvl(request.getParameter("people")));
		log.info("place : " + CmmUtil.nvl(request.getParameter("place")));
		log.info("contents : " + CmmUtil.nvl(request.getParameter("contents")));
		log.info("user_name : " + CmmUtil.nvl(request.getParameter("user_name")));
		log.info("progress : " + CmmUtil.nvl(request.getParameter("progress")));
		log.info("tel_1 : " + CmmUtil.nvl(request.getParameter("tel_1")));
		log.info("tel_2 : " + CmmUtil.nvl(request.getParameter("tel_2")));
		log.info("tel_3 : " + CmmUtil.nvl(request.getParameter("tel_3")));
		log.info("reg_user_no : " + CmmUtil.nvl(request.getParameter("reg_user_no")));

		// 조인 해야함
		// select seq로 값 받아와서 view 딴의 detail로 보내면
		// 이거대신에 모델.에딧
		if (ctr.createGuestCTRInfo(ctrDto)) {
			request.setAttribute("msg", "등록이 완료되었습니다.");
		} else {
			request.setAttribute("msg", "수정이 실패하였습니다.");
		}
		// request.setAttribute("url", "detail.do?ctr_seq=1");

		log.info("End ctr/GuestctrReg !!");

		return "/guest/ctr/GuestctrMsgToList";
	}

	@RequestMapping("ctr/Guestdelete")
	public String deleteGuestCTRInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome delete !!");
		CtrDTO ctrDto = new CtrDTO();
		ctrDto.setCtr_seq(CmmUtil.nvl(request.getParameter("ctr_seq")));
		if (ctr.deleteGuestCTRInfo(ctrDto)) {
			request.setAttribute("msg", "삭제가 완료되었습니다.");
		} else {
			request.setAttribute("msg", "삭제가 실패하였습니다.");
		}
		model.addAttribute("url", "/ctr/GuestctrList.do");
		return "/redirect";
	}

	@RequestMapping("ctr/GuestctrUpdateForm")
	public String updateGuestForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome ctr/GuestctrUpdateForm !!");
		CtrDTO ctrDto = new CtrDTO();
		ctrDto.setCtr_seq(CmmUtil.nvl(request.getParameter("ctr_seq")));
		ctrDto = ctr.getGuestCTRDetail(ctrDto);

		ctrDto.setContents(ctrDto.getContents().replaceAll("<br>", "\r\n"));
		model.addAttribute("ctrDto", ctrDto);

		log.info("End ctr/GuestctrUpdateForm !!");
		return "/guest/ctr/GuestctrUpdate";
	}

	@RequestMapping("ctr/GuestctrUpdate")
	public String updateGuestCTRInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info("Welcome ctr/GuestctrUpdate !!");
		response.setCharacterEncoding("euc-kr");

		CtrDTO ctrDto = new CtrDTO();
		String contents = CmmUtil.nvl(request.getParameter("contents"));
		contents = contents.replaceAll("\r\n", "<br>");

		ctrDto.setCtr_seq(CmmUtil.nvl(request.getParameter("ctr_seq")));
		ctrDto.setTitle(CmmUtil.nvl(request.getParameter("title")));
		ctrDto.setUser_name(CmmUtil.nvl(request.getParameter("user_name")));
		ctrDto.setContents(contents);
		ctrDto.setPeople(CmmUtil.nvl(request.getParameter("people")));
		ctrDto.setPlace(CmmUtil.nvl(request.getParameter("place")));
		ctrDto.setTel_1(CmmUtil.nvl(request.getParameter("tel_1")));
		ctrDto.setTel_2(CmmUtil.nvl(request.getParameter("tel_2")));
		ctrDto.setTel_3(CmmUtil.nvl(request.getParameter("tel_3")));

		ctrDto.setProgress(CmmUtil.nvl(request.getParameter("progress")));

		ctrDto.setChg_user_no(CmmUtil.nvl(request.getParameter("chg_user_no")));
		ctrDto.setChg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));

		log.info("ctr_seq : " + CmmUtil.nvl(request.getParameter("ctr_seq")));
		log.info("title : " + CmmUtil.nvl(request.getParameter("title")));
		log.info("user_name : " + CmmUtil.nvl(request.getParameter("user_name")));
		log.info("contents : " + CmmUtil.nvl(request.getParameter("contents")));
		log.info("people : " + CmmUtil.nvl(request.getParameter("people")));
		log.info("place : " + CmmUtil.nvl(request.getParameter("place")));
		log.info("tel_1 : " + CmmUtil.nvl(request.getParameter("tel_1")));
		log.info("tel_2 : " + CmmUtil.nvl(request.getParameter("tel_2")));
		log.info("tel_3 : " + CmmUtil.nvl(request.getParameter("tel_3")));
		log.info("chg_user_no : " + CmmUtil.nvl(request.getParameter("chg_user_no")));
		log.info("chg_dt : " + CmmUtil.nvl(request.getParameter("chg_dt")));
		log.info("progress : " + CmmUtil.nvl(request.getParameter("progress")));

		if (ctr.updateGuestCTRInfo(ctrDto)) {
			request.setAttribute("msg", "수정이 완료되었습니다.");
		} else {
			request.setAttribute("msg", "수정이 실패하였습니다.");
		}
		model.addAttribute("url", "GuestctrList.do");

		return "/redirect";
	}

	@RequestMapping("ctr/GuestdeleteAllCheckList")
	public String deleteGuestAllCheckList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome deleteGuestAllCheckList !!");

		String[] allCheckSeq = request.getParameterValues("del_chk");

		CtrDTO pDTO = new CtrDTO();

		pDTO.setAllCheckSeq(allCheckSeq);

		if (ctr.deleteGuestAllCheckList(pDTO)) {
			request.setAttribute("msg", "삭제가 완료되었습니다.");

		} else {
			request.setAttribute("msg", "삭제가 실패하였습니다.");

		}

		pDTO = null;

		model.addAttribute("url", "GuestctrList.do");
		return "/redirect";
	}
	/*억울해*/

	@RequestMapping("ctr/GuestupdateCheck")
	public String updateGuestCheck(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Welcome updateCheck !!");
		String[] chk = request.getParameterValues("del_chk");
		int i = 0;
		while (i < chk.length) {
			CtrDTO ctrDto = new CtrDTO();
			ctrDto.setCtr_seq(chk[i]);
			ctrDto.setProgress(CmmUtil.nvl(request.getParameter("pro_" + chk[i])));
			if (ctr.updateGuestCheck(ctrDto)) {
				model.addAttribute("msg", "수정이 성공하였습니다.");
			} else {
				model.addAttribute("msg", "수정이 실패하였습니다.");
				break;
			}
			i++;
		}
		model.addAttribute("url", "GuestctrList.do");
		return "/redirect";
	}

}