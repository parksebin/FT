package ac.kr.ft.com.controller;

import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ac.kr.ft.com.dto.PositionDTO;
import ac.kr.ft.com.dto.ScheduleDTO;
import ac.kr.ft.com.service.IPositionService;
import ac.kr.ft.com.service.IScheduleService;
import ac.kr.ft.com.util.CmmUtil;

@Controller
public class ScheduleController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "ScheduleService")
	private IScheduleService scheduleService;
	
	@Resource(name = "PositionService")
	private IPositionService positionService;
	
	/*
	 * 웹
	 * 일정
	 */
	/*
	 * 웹
	 * 일정
	 */
	@RequestMapping(value="schedule/calendar", method=RequestMethod.GET)
	public String getCalendar(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		log.info("welcome schedule/calendar");
		Calendar cal = Calendar.getInstance();
		int calMonth = Integer.parseInt(CmmUtil.nvl(request.getParameter("month"),"15"))+1;
		if(calMonth==16){
			calMonth = cal.get(Calendar.MONTH)+1;
		}
		String strMonth = "";
		if(calMonth<10){
			strMonth = "0"+calMonth;
		}else{
			strMonth = calMonth+"";
		}
		String year = CmmUtil.nvl(request.getParameter("year"),cal.get(Calendar.YEAR)+"");
		String month = strMonth;
		ScheduleDTO scheduleDto = new ScheduleDTO();
		scheduleDto.setStartDate(Integer.parseInt( year+month+"00"));
		scheduleDto.setEndDate(Integer.parseInt( year+month+"99"));
		List<ScheduleDTO> list = scheduleService.getScheduleList(scheduleDto);
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("list",list);
		return "/schedule/calendar";
	}
	
	@RequestMapping(value="schedule/scheduleInsertForm", method=RequestMethod.GET)
	public String scheduleInsertForm(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		String auth = (String) request.getSession().getAttribute("ADMINAUTH");
		if(auth==null || auth.equals("")){
			log.info("no Login"); 
			return "/com/loginplz";
		}else if(auth.equals("U")){
			log.info("no Auth"); 
			return "/com/adminloginplz";
		}
		log.info("welcome schedule/scheduleInsertForm"); 
		return "/schedule/scheduleInsert";
	}
	
	@RequestMapping(value="schedule/scheduleInsertProc", method=RequestMethod.POST)
	public String scheduleInsertProc(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		String auth = (String) request.getSession().getAttribute("ADMINAUTH");
		if(auth==null || auth.equals("")){
			log.info("no Login"); 
			return "/com/loginplz";
		}else if(auth.equals("U")){
			log.info("no Auth"); 
			return "/com/adminloginplz";
		}
		log.info("welcome schedule/scheduleInsertProc");
		String regUserno = (String) request.getSession().getAttribute("USER_NO");
		
		String contents = CmmUtil.nvl(request.getParameter("contents"));
		contents = contents.replace("\r\n","<br>");
		
		ScheduleDTO scheduleDto = new ScheduleDTO();
		scheduleDto.setReg_user_no(regUserno);
		scheduleDto.setTitle(CmmUtil.nvl(request.getParameter("title")));
		scheduleDto.setPl_dt1(CmmUtil.nvl(request.getParameter("pl_dt1")));
		scheduleDto.setPl_dt2(CmmUtil.nvl(request.getParameter("pl_dt2"),CmmUtil.nvl(request.getParameter("pl_dt1"))));
		scheduleDto.setContents(contents);
		
		if(scheduleService.scheduleInsert(scheduleDto)){
			model.addAttribute("msg", "글이 등록되었습니다.");
		}else{
			model.addAttribute("msg", "글이 등록하지 못했습니다.");
		}
		model.addAttribute("url", "/schedule/calendar.do");
		return "/redirect";
	}
	
	@RequestMapping(value="schedule/scheduleDetail", method=RequestMethod.GET)
	public String getScheduleDetail(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		log.info("welcome schedule/scheduleDetail");
		ScheduleDTO scheduleDto = new ScheduleDTO();
		scheduleDto.setSch_seq(CmmUtil.nvl(request.getParameter("sch_seq")));
		scheduleDto = scheduleService.getScheduleDetail(scheduleDto);
		model.addAttribute("scheduleDto",scheduleDto);
		return "/schedule/scheduleDetail";
	}
	
	@RequestMapping(value="schedule/scheduleDelete", method=RequestMethod.GET)
	public String scheduleDelete(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		String auth = (String) request.getSession().getAttribute("ADMINAUTH");
		if(auth==null || auth.equals("")){
			log.info("no Login"); 
			return "/com/loginplz";
		}else if(auth.equals("U")){
			log.info("no Auth"); 
			return "/com/adminloginplz";
		}
		log.info("welcome schedule/scheduleDelete");
		ScheduleDTO scheduleDto = new ScheduleDTO();
		scheduleDto.setSch_seq(CmmUtil.nvl(request.getParameter("sch_seq")));
		if(scheduleService.scheduleDelete(scheduleDto)){
			model.addAttribute("msg", "삭제 성공하였습니다.");
		}else{
			model.addAttribute("msg", "삭제 실패하였습니다.");
		}
		model.addAttribute("url", "/schedule/calendar.do");
		return "/redirect";
	}
	
	@RequestMapping(value="schedule/scheduleUpdateForm", method=RequestMethod.GET)
	public String scheduleUpdateForm(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		String auth = (String) request.getSession().getAttribute("ADMINAUTH");
		if(auth==null || auth.equals("")){
			log.info("no Login"); 
			return "/com/loginplz";
		}else if(auth.equals("U")){
			log.info("no Auth"); 
			return "/com/adminloginplz";
		}
		log.info("welcome schedule/scheduleUpdateForm");
		ScheduleDTO scheduleDto = new ScheduleDTO();
		scheduleDto.setSch_seq(CmmUtil.nvl(request.getParameter("sch_seq")));
		scheduleDto = scheduleService.getScheduleDetail(scheduleDto);
		
		String contents = scheduleDto.getContents();
		contents = contents.replace("<br>","\r\n");
		
		scheduleDto.setContents(contents);
		
		model.addAttribute("scheduleDto",scheduleDto);
		model.addAttribute("contents",contents);
		return "/schedule/scheduleUpdate";
	}
	
	@RequestMapping(value="schedule/scheduleUpdateProc", method=RequestMethod.POST)
	public String scheduleUpdateProc(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		String auth = (String) request.getSession().getAttribute("ADMINAUTH");
		if(auth==null || auth.equals("")){
			return "/com/loginplz";
		}else if(auth.equals("U")){
			return "/com/adminloginplz";
		}
		String chgUserno = (String) request.getSession().getAttribute("USER_NO");
		
		String contents = CmmUtil.nvl(request.getParameter("contents"));
		contents = contents.replace("\r\n","<br>");
		
		ScheduleDTO scheduleDto = new ScheduleDTO();
		scheduleDto.setChg_user_no(chgUserno);
		scheduleDto.setSch_seq(CmmUtil.nvl(request.getParameter("sch_seq")));
		scheduleDto.setTitle(CmmUtil.nvl(request.getParameter("title")));
		scheduleDto.setPl_dt1(CmmUtil.nvl(request.getParameter("pl_dt1")));
		scheduleDto.setPl_dt2(CmmUtil.nvl(request.getParameter("pl_dt2"),CmmUtil.nvl(request.getParameter("pl_dt1"))));
		scheduleDto.setContents(contents);
		
		if(scheduleService.scheduleUpdateProc(scheduleDto)){
			model.addAttribute("msg", "글수정 성공하였습니다.");
		}else{
			model.addAttribute("msg", "글수정 실패하였습니다.");
		}
		model.addAttribute("url", "/schedule/calendar.do");
		return "/redirect";
	}
	
	/*
	 * 웹
	 * 포지션
	 */
	@RequestMapping(value="position/position", method=RequestMethod.GET)
	public String getPosition(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		log.info("welcome position");
		PositionDTO positionDto = positionService.getPosition();
		model.addAttribute("positionDto",positionDto);
		return "/position/position";
	}
	
	@RequestMapping(value="position/positionGps", method=RequestMethod.GET)
	public String getPositionGpsForm(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		log.info("welcome position/positionGPS");
		PositionDTO positionDto = positionService.getPosition();
		model.addAttribute("positionDto",positionDto);
		return "/position/positionGps";
	}
	
	@RequestMapping(value="position/positionGpsProc", method=RequestMethod.POST)
	public String getPositionGpsProc(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		log.info("welcome busi/position/gpsUpdateProc");
		PositionDTO positionDto = new PositionDTO();
		positionDto.setTitle(CmmUtil.nvl(request.getParameter("title")));
		positionDto.setLat(CmmUtil.nvl(request.getParameter("lat")));
		positionDto.setLng(CmmUtil.nvl(request.getParameter("lng")));
		positionDto.setchg_user_no(" ");
		
		if(positionService.positionUpdate(positionDto)){
			model.addAttribute("msg", "위치 갱신 완료하였습니다.");
		}else{
			model.addAttribute("msg", "위치 갱신 실패하였습니다.");
		}
		model.addAttribute("url","/position/position.do");
		
		return "/redirect";
	}
	/*
	 * 모바일
	 * 사업자
	 * 일정
	 */
	@RequestMapping(value="busi/schedule/scheduleInsertForm", method=RequestMethod.GET)
	public String scheduleInsertFormBusi(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		log.info("welcome busi/schedule/scheduleInsertForm"); 
		String auth = (String)request.getSession().getAttribute("AUTH");
		if(auth == null){
			auth = "";
		}
		if(auth.equals("U") || auth.equals("")){
			return "/noAuth";
		}
		return "/busi/schedule/scheduleInsertForm";
	}
	
	@RequestMapping(value="busi/schedule/scheduleInsertProc", method=RequestMethod.POST)
	public String scheduleInsertProcBusi(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		log.info("welcome schedule/scheduleInsertProc");
		String auth = (String)request.getSession().getAttribute("AUTH");
		if(auth == null){
			auth = "";
		}
		if(auth.equals("U") || auth.equals("")){
			return "/noAuth";
		}
		String regUserno = (String) request.getSession().getAttribute("USER_NO");
		
		String contents = CmmUtil.nvl(request.getParameter("contents"));
		contents = contents.replace("\r\n","<br>");
		
		ScheduleDTO scheduleDto = new ScheduleDTO();
		scheduleDto.setReg_user_no("");
		scheduleDto.setTitle(CmmUtil.nvl(request.getParameter("title")));
		scheduleDto.setPl_dt1(CmmUtil.nvl(request.getParameter("pl_dt1")));
		scheduleDto.setPl_dt2(CmmUtil.nvl(request.getParameter("pl_dt2"),CmmUtil.nvl(request.getParameter("pl_dt1"))));
		scheduleDto.setContents(contents);
		
		if(scheduleService.scheduleInsert(scheduleDto)){
			model.addAttribute("msg", "글이 등록되었습니다.");
		}else{
			model.addAttribute("msg", "글등록이 실패하였습니다.");
		}
		model.addAttribute("url", "/busi/schedule/calendar.do");
		return "/redirect";
	}
	@RequestMapping(value="busi/schedule/calendar", method=RequestMethod.GET)
	public String getCalendarBusi(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		log.info("welcome busi/schedule/calendar");
		Calendar cal = Calendar.getInstance();
		String year = CmmUtil.nvl(request.getParameter("year"),cal.get(Calendar.YEAR)+"");
		int calMonth = Integer.parseInt(CmmUtil.nvl(request.getParameter("month"),"99"))+1;
		if(calMonth==100){
			calMonth = cal.get(Calendar.MONTH)+1;
		}else if(calMonth==14){
			calMonth = 1;
			int yearA = Integer.parseInt(year);
			year = ""+(++yearA);
		}
		
		String strMonth = "";
		if(calMonth<10){
			strMonth = "0"+calMonth;
		}else{
			strMonth = calMonth+"";
		}
		String month = strMonth;
		ScheduleDTO scheduleDto = new ScheduleDTO();
		scheduleDto.setStartDate(Integer.parseInt( year+month+"00"));
		scheduleDto.setEndDate(Integer.parseInt( year+month+"99"));
		List<ScheduleDTO> list = scheduleService.getScheduleList(scheduleDto);
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("list",list);
		return "/busi/schedule/calendar";
	}
	
	@RequestMapping(value="busi/schedule/schedulelist", method=RequestMethod.GET)
	public String getScheduleDateListBusi(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		log.info("welcome busi/schedule/schedulelist");
		ScheduleDTO scheduleDto = new ScheduleDTO();
		scheduleDto.setUseDate(CmmUtil.nvl(request.getParameter("useDate")));
		List<ScheduleDTO> list = scheduleService.getScheduleDateList(scheduleDto);
		model.addAttribute("list",list);
		return "/busi/schedule/schedulelist";
	}
	
	@RequestMapping(value="busi/schedule/scheduleDetail", method=RequestMethod.GET)
	public String getScheduleDetailBusi(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		log.info("welcome busi/schedule/scheduleDetail");
		ScheduleDTO scheduleDto = new ScheduleDTO();
		scheduleDto.setSch_seq(CmmUtil.nvl(request.getParameter("sch_seq")));
		scheduleDto = scheduleService.getScheduleDetail(scheduleDto);
		model.addAttribute("scheduleDto",scheduleDto);
		return "/busi/schedule/scheduleDetail";
	}
	
	@RequestMapping(value="busi/schedule/scheduleUpdateForm", method=RequestMethod.GET)
	public String getscheduleUpdateFormBusi(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		log.info("welcome busi/schedule/scheduleUpdateForm");
		String auth = (String)request.getSession().getAttribute("AUTH");
		if(auth == null){
			auth = "";
		}
		if(auth.equals("U") || auth.equals("")){
			return "/noAuth";
		}
		ScheduleDTO scheduleDto = new ScheduleDTO();
		scheduleDto.setSch_seq(CmmUtil.nvl(request.getParameter("sch_seq")));
		scheduleDto = scheduleService.getScheduleDetail(scheduleDto);
		
		String contents = scheduleDto.getContents();
		contents = contents.replace("<br>","\r\n");
		
		scheduleDto.setContents(contents);
		
		model.addAttribute("scheduleDto",scheduleDto);
		model.addAttribute("contents",contents);
		return "/busi/schedule/scheduleUpdateForm";
	}
	
	@RequestMapping(value="busi/schedule/scheduleUpdateProc", method=RequestMethod.POST)
	public String scheduleUpdateProcBusi(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		log.info("welcome busi/schedule/scheduleUpdateProc");
		String auth = (String)request.getSession().getAttribute("AUTH");
		if(auth == null){
			auth = "";
		}
		if(auth.equals("U") || auth.equals("")){
			return "/noAuth";
		}
		String chgUserno = (String) request.getSession().getAttribute("USER_NO");
		
		String contents = CmmUtil.nvl(request.getParameter("contents"));
		contents = contents.replace("\r\n","<br>");
		
		ScheduleDTO scheduleDto = new ScheduleDTO();
//		scheduleDto.setChg_user_no(chgUserno);
		scheduleDto.setChg_user_no(" ");
		scheduleDto.setSch_seq(CmmUtil.nvl(request.getParameter("sch_seq")));
		scheduleDto.setTitle(CmmUtil.nvl(request.getParameter("title")));
		scheduleDto.setPl_dt1(CmmUtil.nvl(request.getParameter("pl_dt1")));
		scheduleDto.setPl_dt2(CmmUtil.nvl(request.getParameter("pl_dt2"),CmmUtil.nvl(request.getParameter("pl_dt1"))));
		scheduleDto.setContents(contents);
		
		if(scheduleService.scheduleUpdateProc(scheduleDto)){
			model.addAttribute("msg", "수정 성공하였습니다.");
		}else{
			model.addAttribute("msg", "수정 실패하였습니다.");
		}
		model.addAttribute("url", "/busi/schedule/scheduleDetail.do?sch_seq="+scheduleDto.getSch_seq());
		return "/redirect";
	}
	
	@RequestMapping(value="busi/schedule/scheduleDelete", method=RequestMethod.GET)
	public String scheduleDeleteBusi(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		log.info("welcome busi/schedule/scheduleDelete");
		String auth = (String)request.getSession().getAttribute("AUTH");
		if(auth == null){
			auth = "";
		}
		if(auth.equals("U") || auth.equals("")){
			return "/noAuth";
		}
		ScheduleDTO scheduleDto = new ScheduleDTO();
		scheduleDto.setSch_seq(CmmUtil.nvl(request.getParameter("sch_seq")));
		if(scheduleService.scheduleDelete(scheduleDto)){
			model.addAttribute("msg", "삭제 완료하였습니다.");
		}else{
			model.addAttribute("msg", "삭제 실패하였습니다.");
		}
		model.addAttribute("url", "/busi/schedule/calendar.do");
		return "/redirect";
	}
	
	/*
	 * 모바일
	 * 유저
	 * 일정
	 */
	
	
	@RequestMapping(value="guest/schedule/calendar", method=RequestMethod.GET)
	public String getCalendarGuest(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		log.info("welcome guest/schedule/calendar");
		Calendar cal = Calendar.getInstance();
		String year = CmmUtil.nvl(request.getParameter("year"),cal.get(Calendar.YEAR)+"");
		int calMonth = Integer.parseInt(CmmUtil.nvl(request.getParameter("month"),"99"))+1;
		if(calMonth==100){
			calMonth = cal.get(Calendar.MONTH)+1;
		}else if(calMonth==14){
			calMonth = 1;
			int yearA = Integer.parseInt(year);
			year = ""+(++yearA);
		}
		
		String strMonth = "";
		if(calMonth<10){
			strMonth = "0"+calMonth;
		}else{
			strMonth = calMonth+"";
		}
		String month = strMonth;
		ScheduleDTO scheduleDto = new ScheduleDTO();
		scheduleDto.setStartDate(Integer.parseInt( year+month+"00"));
		scheduleDto.setEndDate(Integer.parseInt( year+month+"99"));
		List<ScheduleDTO> list = scheduleService.getScheduleList(scheduleDto);
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("list",list);
		return "/guest/schedule/calendar";
	}
	
	@RequestMapping(value="guest/schedule/schedulelist", method=RequestMethod.GET)
	public String getScheduleDateListGuest(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		log.info("welcome guest/schedule/schedulelist");
		ScheduleDTO scheduleDto = new ScheduleDTO();
		scheduleDto.setUseDate(CmmUtil.nvl(request.getParameter("useDate")));
		List<ScheduleDTO> list = scheduleService.getScheduleDateList(scheduleDto);
		model.addAttribute("list",list);
		return "/guest/schedule/schedulelist";
	}
	
	@RequestMapping(value="guest/schedule/scheduleDetail", method=RequestMethod.GET)
	public String getScheduleDetailGuest(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		log.info("welcome guest/schedule/scheduleDetail");
		ScheduleDTO scheduleDto = new ScheduleDTO();
		scheduleDto.setSch_seq(CmmUtil.nvl(request.getParameter("sch_seq")));
		scheduleDto = scheduleService.getScheduleDetail(scheduleDto);
		model.addAttribute("scheduleDto",scheduleDto);
		return "/guest/schedule/scheduleDetail";
	}
	
	/*
	 * 모바일
	 * 포지션
	 */
	@RequestMapping(value="busi/position/position", method=RequestMethod.GET)
	public String getPositionBusi(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		log.info("welcome busi position");
		PositionDTO positionDto = positionService.getPosition();
		model.addAttribute("positionDto",positionDto);
		return "/busi/position/position";
	}
	
	@RequestMapping(value="busi/position/gpsUpdateForm", method=RequestMethod.GET)
	public String gpsUpdateFormBusi(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		log.info("welcome busi/position/gpsUpdate");
		String auth = (String)request.getSession().getAttribute("AUTH");
		if(auth == null){
			auth = "";
		}
		if(auth.equals("U") || auth.equals("")){
			return "/noAuth";
		}
		return "busi/position/gpsUpdate";
	}
	
	@RequestMapping(value="busi/position/gpsUpdateProc", method=RequestMethod.POST)
	public String gpsUpdateProcBusi(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		log.info("welcome busi/position/gpsUpdateProc");
		PositionDTO positionDto = new PositionDTO();
		positionDto.setTitle(CmmUtil.nvl(request.getParameter("title")));
		positionDto.setLat(CmmUtil.nvl(request.getParameter("lat")));
		positionDto.setLng(CmmUtil.nvl(request.getParameter("lng")));
		positionDto.setchg_user_no(" ");
		
		if(positionService.positionUpdate(positionDto)){
			model.addAttribute("msg", "위치 갱신 완료하였습니다.");
		}else{
			model.addAttribute("msg", "위치 갱신 실패하였습니다.");
		}
		model.addAttribute("url","/busi/position/position.do");
		
		return "/redirect";
	}
	
	/*
	 * 사용자 지도 
	 */
	@RequestMapping(value="guest/position/position", method=RequestMethod.GET)
	public String getPositionGuest(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		log.info("welcome busi position");
		PositionDTO positionDto = positionService.getPosition();
		model.addAttribute("positionDto",positionDto);
		return "/guest/position/position";
	}
}
