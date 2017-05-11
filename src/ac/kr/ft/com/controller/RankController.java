package ac.kr.ft.com.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ac.kr.ft.com.dto.FestivalDTO;
import ac.kr.ft.com.service.IRankService;
import ac.kr.ft.com.util.CmmUtil;

@Controller
public class RankController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "RankService")
	private IRankService rankservice;

	/*
	 * #########################################################################
	 * # # 관리자 용 시작 #
	 * #########################################################################
	 * #
	 * 
	 */

	@RequestMapping("rank/rankcondition")
	public String rankCondition(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		 
		String auth = (String)request.getSession().getAttribute("ADMINAUTH");
	      if(auth == null || auth.equals("") || auth.equals("U")|| auth.equals("P")){
	         return "/noAuth"; }
		log.info("Welcome rank/ranjcondition");

		log.info("End rank/rankcondition");

		return "rank/rankcondition";
	}

	@RequestMapping(value = "rank/ranklist", method = RequestMethod.POST)
	public String getRankList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		
		String auth = (String)request.getSession().getAttribute("ADMINAUTH");
	      if(auth == null || auth.equals("") || auth.equals("U")|| auth.equals("P")){
	         return "/noAuth"; }

		FestivalDTO festivalDto = new FestivalDTO();
		
		festivalDto.setCalender(CmmUtil.nvl(request.getParameter("calender")));
		festivalDto.setCity(CmmUtil.nvl(request.getParameter("city")));
		festivalDto.setNation(CmmUtil.nvl(request.getParameter("nation")));
		if(!CmmUtil.nvl(request.getParameter("pay")).equals("S")){
			festivalDto.setPay(CmmUtil.nvl(request.getParameter("pay")));
		}
		if(!CmmUtil.nvl(request.getParameter("local")).equals("X")){
			festivalDto.setLocal(CmmUtil.nvl(request.getParameter("local")));
		}

		log.info("city :" + request.getParameter("city"));
		log.info("local :" + request.getParameter("local"));
		log.info("calender :" + request.getParameter("calender"));
		log.info("nation :" + request.getParameter("nation"));
		log.info("pay :" + request.getParameter("pay"));

		List<FestivalDTO> Ranklist = rankservice.getRankList(festivalDto);

		log.info("Ranklist : " + Ranklist);
		log.info("rank list start !!!!");

		model.addAttribute("ranklist", Ranklist);

		log.info("ranklist : " + Ranklist);


		log.info("rank list end !!!!");
		log.info(Ranklist);

		return "rank/ranklist";

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

	/*	##########################종합순위 조건 시작############################### */	

	@RequestMapping("busi/rankcondition")
	public String busirankCondition(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		 
		String auth = (String)request.getSession().getAttribute("AUTH");
	      if(auth == null || auth.equals("") || auth.equals("U")){
	         return "/noAuth";
	      }
		log.info("Welcome rank/rankcondition");

		log.info("End rank/rankcondition");

		return "busi/rank/rankcondition";
	}


	
	/*	########################## 조건 에서 ranklist1 로옴 ############################### */	
	
	@RequestMapping("busi/ranklist") 
	public String getEvent(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		log.info("Welcome rank/busirankList !!");
		String auth = (String)request.getSession().getAttribute("AUTH");
	      if(auth == null || auth.equals("") || auth.equals("U")){
	         return "/noAuth";
	      }
		String city = CmmUtil.nvl(request.getParameter("city"));
		String local = CmmUtil.nvl(request.getParameter("local"));
		String nation = CmmUtil.nvl(request.getParameter("nation"));
		String pay = CmmUtil.nvl(request.getParameter("pay"));
		String calender = CmmUtil.nvl(request.getParameter("calender"));
		String cal = CmmUtil.nvl(request.getParameter("cal"));
	
		log.info("city : " +CmmUtil.nvl(request.getParameter("city")));
		log.info("local : "+CmmUtil.nvl(request.getParameter("local")));
		log.info("nation :" +CmmUtil.nvl(request.getParameter("nation")));
		log.info("pay : "+CmmUtil.nvl(request.getParameter("pay")));
		log.info("calender : " +CmmUtil.nvl(request.getParameter("cntt")));
		log.info("cal : " +CmmUtil.nvl(request.getParameter("cal")));
		
		
		model.addAttribute("city",city);
		model.addAttribute("local",local);
		model.addAttribute("nation",nation);
		model.addAttribute("pay",pay);
		model.addAttribute("calender",calender);
		model.addAttribute("cal",cal);
		
		log.info("End rank/busirankList !!");
		
		return "/busi/rank/ranklist";
	}

	/**
	 * 아작스 호출
	 * */

	@RequestMapping("/rank/rankbusi.do")
	public String getBusiIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		String auth = (String)request.getSession().getAttribute("AUTH");
	      if(auth == null || auth.equals("") || auth.equals("U")){
	         return "/noAuth";
	      }
		log.info("Welcome event/busirankIndex !!");
		
		request.setCharacterEncoding("UTF-8");

	
		log.info("city : " +CmmUtil.nvl(request.getParameter("city")));
		log.info("local : "+CmmUtil.nvl(request.getParameter("local")));
		log.info("nation :" +CmmUtil.nvl(request.getParameter("nation")));
		log.info("pay : "+CmmUtil.nvl(request.getParameter("pay")));
		log.info("calender : " +CmmUtil.nvl(request.getParameter("calender")));
		log.info("start_page : " +CmmUtil.nvl(request.getParameter("start_page"),"1"));
		log.info("end_page : " +CmmUtil.nvl(request.getParameter("end_page"),"6"));

		// 댓글 리스트
		FestivalDTO pDTO = new FestivalDTO();
		pDTO.setCity(CmmUtil.nvl(request.getParameter("city")));
		pDTO.setNation(CmmUtil.nvl(request.getParameter("nation")));
		if(!CmmUtil.nvl(request.getParameter("local")).equals("X")){
		pDTO.setLocal(CmmUtil.nvl(request.getParameter("local")));
		}
		if(!CmmUtil.nvl(request.getParameter("pay")).equals("S")){
		pDTO.setPay(CmmUtil.nvl(request.getParameter("pay")));
		}
		pDTO.setCalender(CmmUtil.nvl(request.getParameter("calender")));
		
		pDTO.setStart_page(CmmUtil.nvl(request.getParameter("start_page"),"1"));
		pDTO.setEnd_page(CmmUtil.nvl(request.getParameter("end_page"),"6"));

		FestivalDTO rDTO= rankservice.getBusiRankList(pDTO);

		log.info("rDTO : "+ rDTO);
		
		model.addAttribute("rDTO", rDTO);
		
		log.info("End event/busiEventIndex !!");
	
		
		return "/busi/rank/RanklistJSON";
	}
}









































































































/*
@RequestMapping("busi/ranklist1")
public String busiranklist(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

	FestivalDTO festivalDto = new FestivalDTO();

	festivalDto.setCity(CmmUtil.nvl(request.getParameter("city")));
	festivalDto.setLocal(CmmUtil.nvl(request.getParameter("local")));
	festivalDto.setNation(CmmUtil.nvl(request.getParameter("nation")));
	festivalDto.setPay(CmmUtil.nvl(request.getParameter("pay")));
	festivalDto.setCalender(CmmUtil.nvl(request.getParameter("calender")));

	log.info("city :" + request.getParameter("city"));
	log.info("local :" + request.getParameter("local"));
	log.info("calender :" + request.getParameter("calender"));
	log.info("nation :" + request.getParameter("nation"));
	log.info("pay :" + request.getParameter("pay"));

	List<FestivalDTO> Ranklist = rankservice.getRankList(festivalDto);

	log.info("Ranklist : " + Ranklist);
	log.info("rank list start !!!!");

	model.addAttribute("ranklist", Ranklist);

	log.info("ranklist : " + Ranklist);


	log.info("rank list end !!!!");
	log.info(Ranklist);

	return "busi/rank/ranklist1";

}

	/*@RequestMapping(value = "busi/ranklist", method = RequestMethod.POST)
	public String getbusiRankList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		FestivalDTO festivalDto = new FestivalDTO();

		festivalDto.setCity(CmmUtil.nvl(request.getParameter("city")));
		festivalDto.setLocal(CmmUtil.nvl(request.getParameter("local")));
		festivalDto.setNation(CmmUtil.nvl(request.getParameter("nation")));
		festivalDto.setPay(CmmUtil.nvl(request.getParameter("pay")));
		festivalDto.setCalender(CmmUtil.nvl(request.getParameter("calender")));

		log.info("city :" + request.getParameter("city"));
		log.info("local :" + request.getParameter("local"));
		log.info("calender :" + request.getParameter("calender"));
		log.info("nation :" + request.getParameter("nation"));
		log.info("pay :" + request.getParameter("pay"));

		List<FestivalDTO> Ranklist = rankservice.getRankList(festivalDto);

		log.info("Ranklist : " + Ranklist);
		log.info("rank list start !!!!");

		model.addAttribute("ranklist", Ranklist);

		log.info("ranklist : " + Ranklist);


		log.info("rank list end !!!!");
		log.info(Ranklist);

		return "busi/rank/ranklist";

	}*/


/*
 * if(request.getParameter("local").equals("noselect") &&
 * request.getParameter("target").equals("noselect") == true){//로컬 and 타켓 선택안했을시
 * List<FestivalDTO> ranklist = rankservice.getRankList4(); //타겟 x 로컬 x and
 * log.info("local and target nonononono select");
 * model.addAttribute("ranklist", ranklist); log.info(
 * "local and target nonononono select");}
 * 
 * else if(request.getParameter("target").equals("noselect") == true){//타겟 X 로컬
 * O oR List<FestivalDTO> ranklist = rankservice.getRankList2(); log.info(
 * "target no select"); model.addAttribute("ranklist", ranklist); log.info(
 * "target no select");
 * 
 * }else if(request.getParameter("local").equals("noselect") == true){//로컬 X 타켓
 * O OR List<FestivalDTO> ranklist = rankservice.getRankList(); log.info(
 * "local no select"); model.addAttribute("ranklist", ranklist); log.info(
 * "local no select"); }
 * 
 * else if(request.getParameter("local").equals("GANGDONG") ||
 * request.getParameter("local").equals("SEONGDONG") ||
 * request.getParameter("local").equals("GANGSEO") &&
 * request.getParameter("target").equals("A") ||
 * request.getParameter("target").equals("B") ||
 * request.getParameter("target").equals("C") ||
 * request.getParameter("target").equals("D")== true){ List<FestivalDTO>
 * ranklist = rankservice.getRankList3(); //로컬 O 타켓 O log.info(
 * "local and target !!!!!!!!!!!!!!!!!!!select"); model.addAttribute("ranklist",
 * ranklist); log.info("local and target !!!!!!!!!!!!!!!!!!!!select"); } return
 * "rank/ranklist"; }}
 */
/*
 * @RequestMapping("fest/festinsert") public String
 * insertForm(HttpServletRequest request,HttpServletResponse response, ModelMap
 * model){ log.info("Welcome fest/festinsert");
 * 
 * log.info("End fest/festinsert");
 * 
 * return "fest/festinsert"; }
 * 
 * /** 등록데이터 db 저장하기
 */
/*
 * @RequestMapping("fest/festInsert") public String
 * createfestInfo(HttpServletRequest request, HttpServletResponse response,
 * ModelMap model){
 * 
 * log.info("Welcome fest/festInsert !!");
 * 
 * 
 * FestivalDTO festivalDTO = new FestivalDTO();
 * //request.getParameter("ctr_seq") 원래 1 대신에 들어갔었던 값임.
 * festivalDTO.setFst_seq(CmmUtil.nvl(request.getParameter("fst_seq")));
 * festivalDTO.setFst_name(CmmUtil.nvl(request.getParameter("fst_name")));
 * festivalDTO.setLocal(CmmUtil.nvl(request.getParameter("local")));
 * festivalDTO.setPopulation(request.getParameter("population"));
 * //request.getParameter("ctr_yn")
 * festivalDTO.setFes_start(CmmUtil.nvl(request.getParameter("fes_start")));
 * festivalDTO.setFes_end(CmmUtil.nvl(request.getParameter("fes_end")));
 * festivalDTO.setTransfer(CmmUtil.nvl(request.getParameter("transfer")));
 * festivalDTO.setFile_name1(CmmUtil.nvl(request.getParameter("file_name1")));
 * festivalDTO.setFile_name2(CmmUtil.nvl(request.getParameter("file_name2")));
 * festivalDTO.setFile_name3(CmmUtil.nvl(request.getParameter("file_name3")));
 * festivalDTO.setFile_path1(CmmUtil.nvl(request.getParameter("file_path1")));
 * festivalDTO.setFile_path2(CmmUtil.nvl(request.getParameter("file_path2")));
 * festivalDTO.setFile_path3(CmmUtil.nvl(request.getParameter("file_path3")));
 * festivalDTO.setFst_exp(CmmUtil.nvl(request.getParameter("fst_exp")));
 * festivalDTO.setFst_host(CmmUtil.nvl(request.getParameter("fst_host")));
 * festivalDTO.setHostph_1(CmmUtil.nvl(request.getParameter("hostph_1")));
 * festivalDTO.setHostph_2(CmmUtil.nvl(request.getParameter("hostph_2")));
 * festivalDTO.setHostph_3(CmmUtil.nvl(request.getParameter("hostph_3")));
 * festivalDTO.setHostemail_1(CmmUtil.nvl(request.getParameter("hostemail_1")));
 * festivalDTO.setHostemail_2(CmmUtil.nvl(request.getParameter("hostemail_2")));
 * festivalDTO.setReg_user_no(CmmUtil.nvl(request.getParameter("reg_user_no")));
 * festivalDTO.setReg_dt(CmmUtil.nvl(request.getParameter("reg_dt")));
 * festivalDTO.setChg_user_no(CmmUtil.nvl(request.getParameter("chg_user_no")));
 * festivalDTO.setReg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
 * festivalDTO.setPeaktime1(CmmUtil.nvl(request.getParameter("peaktime1")));
 * festivalDTO.setPeaktime2(CmmUtil.nvl(request.getParameter("peaktime2")));
 * festivalDTO.setPeaktime3(CmmUtil.nvl(request.getParameter("peaktime3")));
 * festivalDTO.setPeaktime4(CmmUtil.nvl(request.getParameter("peaktime4")));
 * 
 * 
 * //select seq로 값 받아와서 view 딴의 detail로 보내면 //이거대신에 모델.에딧 System.out.println(
 * "Festival Controller"); if(festival.createfestInfo(festivalDTO)){
 * request.setAttribute("msg", "생성완료"); }else{ request.setAttribute("msg",
 * "생성실패"); } System.out.println("Festival Controller");
 * //request.setAttribute("url", "detail.do?ctr_seq=1");
 * 
 * log.info("End fest/festInsert !!");
 * 
 * 
 * return "/fest/festMsgToList"; }
 * 
 * @RequestMapping("fest/festdetail") public String
 * getfestDetail(HttpServletRequest request,HttpServletResponse response,
 * ModelMap model) {
 * 
 * log.info("Welcome ctr/ctrDetail !!");
 * 
 * FestivalDTO festivalDTO = new FestivalDTO();
 * festivalDTO.setFst_seq(CmmUtil.nvl(request.getParameter("fst_seq")));
 * festivalDTO = festival.getfestDetail(festivalDTO);
 * model.addAttribute("festivalDTO",festivalDTO);
 * 
 * log.info("End fst/festdetail !!");
 * 
 * return "fest/festdetail"; }
 * 
 * 
 * @RequestMapping("fest/festupdate") public String
 * getfestUpdate(HttpServletRequest request,HttpServletResponse response,
 * ModelMap model){
 * 
 * FestivalDTO festivalDTO = new FestivalDTO();
 * festivalDTO.setFst_seq(CmmUtil.nvl(request.getParameter("fst_seq")));
 * festivalDTO = festival.getfestDetail(festivalDTO);
 * model.addAttribute("festivalDTO",festivalDTO); log.info("Welcome update");
 * 
 * log.info("End update");
 * 
 * return "fest/festupdate";
 * 
 * }
 * 
 * @RequestMapping("fest/festupdateForm") public String
 * setfestupdateform(HttpServletRequest request, HttpServletResponse response,
 * ModelMap model){
 * 
 * log.info("Welcome fest/update form !!");
 * 
 * 
 * FestivalDTO festivalDTO = new FestivalDTO();
 * //request.getParameter("ctr_seq") 원래 1 대신에 들어갔었던 값임.
 * festivalDTO.setFst_name(CmmUtil.nvl(request.getParameter("fst_name")));
 * festivalDTO.setFst_exp(CmmUtil.nvl(request.getParameter("fst_exp")));
 * festivalDTO.setFst_seq(CmmUtil.nvl(request.getParameter("fst_seq")));
 * 
 * /*festivalDTO.setLocal(CmmUtil.nvl(request.getParameter("local")));
 * festivalDTO.setPopulation(request.getParameter("population"));
 * //request.getParameter("ctr_yn")
 * festivalDTO.setFes_start(CmmUtil.nvl(request.getParameter("fes_start")));
 * festivalDTO.setFes_end(CmmUtil.nvl(request.getParameter("fes_end")));
 * festivalDTO.setTransfer(CmmUtil.nvl(request.getParameter("transfer")));
 * festivalDTO.setFile_name1(CmmUtil.nvl(request.getParameter("file_name1")));
 * festivalDTO.setFile_name2(CmmUtil.nvl(request.getParameter("file_name2")));
 * festivalDTO.setFile_name3(CmmUtil.nvl(request.getParameter("file_name3")));
 * festivalDTO.setFile_path1(CmmUtil.nvl(request.getParameter("file_path1")));
 * festivalDTO.setFile_path2(CmmUtil.nvl(request.getParameter("file_path2")));
 * festivalDTO.setFile_path3(CmmUtil.nvl(request.getParameter("file_path3")));
 * festivalDTO.setFst_exp(CmmUtil.nvl(request.getParameter("fst_exp")));
 * festivalDTO.setFst_host(CmmUtil.nvl(request.getParameter("fst_host")));
 * festivalDTO.setHostph_1(CmmUtil.nvl(request.getParameter("hostph_1")));
 * festivalDTO.setHostph_2(CmmUtil.nvl(request.getParameter("hostph_2")));
 * festivalDTO.setHostph_3(CmmUtil.nvl(request.getParameter("hostph_3")));
 * festivalDTO.setHostemail_1(CmmUtil.nvl(request.getParameter("hostemail_1")));
 * festivalDTO.setHostemail_2(CmmUtil.nvl(request.getParameter("hostemail_2")));
 * festivalDTO.setChg_user_no(CmmUtil.nvl(request.getParameter("chg_user_no")));
 * festivalDTO.setReg_dt(CmmUtil.nvl(request.getParameter("chg_dt")));
 * festivalDTO.setPeaktime1(CmmUtil.nvl(request.getParameter("peaktime1")));
 * festivalDTO.setPeaktime2(CmmUtil.nvl(request.getParameter("peaktime2")));
 * festivalDTO.setPeaktime3(CmmUtil.nvl(request.getParameter("peaktime3")));
 * festivalDTO.setPeaktime4(CmmUtil.nvl(request.getParameter("peaktime4")));
 */
// select seq로 값 받아와서 view 딴의 detail로 보내면
// 이거대신에 모델.에딧
/*
 * System.out.println("Festival updateform Controller123");
 * if(festival.festupdateform(festivalDTO)){ request.setAttribute("msg",
 * "수정완료"); }else{ request.setAttribute("msg", "수정실패"); } System.out.println(
 * "Festival updateform2 Controller"); //request.setAttribute("url",
 * "detail.do?ctr_seq=1");
 * 
 * log.info("End fest/festupdateform !!");
 * 
 * 
 * return "/fest/festMsgToList"; }
 * 
 * @RequestMapping("fest/festdelete") public String
 * deletefestInfo(HttpServletRequest request, HttpServletResponse response,
 * ModelMap model){ FestivalDTO festivalDto = new FestivalDTO();
 * festivalDto.setFst_seq(CmmUtil.nvl(request.getParameter("fst_seq")));
 * if(festival.deletefestInfo(festivalDto)){ request.setAttribute("msg",
 * "삭제완료"); }else{ request.setAttribute("msg", "삭제실패"); }
 * request.setAttribute("url", "festlist.do"); return "redirect";
 * 
 * }}
 */