package ac.kr.ft.com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ac.kr.ft.com.dto.FestivalDTO;
import ac.kr.ft.com.dto.PositionDTO;
import ac.kr.ft.com.dto.SalesDTO;
import ac.kr.ft.com.service.IFestivalService;
import ac.kr.ft.com.service.ISalesService;
import ac.kr.ft.com.util.CmmUtil;

@Controller
public class FestivalController {
   private Logger log = Logger.getLogger(this.getClass());
 
   @Resource(name = "FestivalService")
   private IFestivalService festival; //

   @Resource(name = "SalesService")
   private ISalesService salesService;

	
   @RequestMapping(value = "fest/festlist", method = RequestMethod.GET)
   public String getFestList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {
      log.info("aaa");
      List<FestivalDTO> Festivallist = festival.getFestList();

      model.addAttribute("festivallist", Festivallist);

      log.info("aaa");
      return "/fest/festList";
   }

   @RequestMapping("fest/festinsert")
   public String insertForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {
      log.info("Welcome fest/festinsert");
      log.info("End fest/festinsert");

      return "fest/festinsert";
   }

   /**
    * 등록데이터 db 저장하기
    */
   @RequestMapping("fest/festInsert")
   public String createfestInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {

      log.info("Welcome fest/festInsert !!");
      String user_name = CmmUtil.nvl((String)request.getSession().getAttribute("ADMINUSER_NAME"),"0");
      
      FestivalDTO festivalDTO = new FestivalDTO();
      festivalDTO.setFst_seq(CmmUtil.nvl(request.getParameter("fst_seq")));
      festivalDTO.setCity(CmmUtil.nvl(request.getParameter("city")));
      festivalDTO.setLocal(CmmUtil.nvl(request.getParameter("local")));
      festivalDTO.setAttractions(CmmUtil.nvl(request.getParameter("attractions")));
      festivalDTO.setPay(CmmUtil.nvl(request.getParameter("pay")));
      festivalDTO.setNation(CmmUtil.nvl(request.getParameter("nation")));
      festivalDTO.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
      festivalDTO.setJan(CmmUtil.nvl(request.getParameter("jan").replaceAll("[^\\d]", "")));
      festivalDTO.setFeb(CmmUtil.nvl(request.getParameter("feb").replaceAll("[^\\d]", "")));
      festivalDTO.setMar(CmmUtil.nvl(request.getParameter("mar").replaceAll("[^\\d]", "")));
      festivalDTO.setApr(CmmUtil.nvl(request.getParameter("apr").replaceAll("[^\\d]", "")));
      festivalDTO.setMay(CmmUtil.nvl(request.getParameter("may").replaceAll("[^\\d]", "")));
      festivalDTO.setJun(CmmUtil.nvl(request.getParameter("jun").replaceAll("[^\\d]", "")));
      festivalDTO.setJul(CmmUtil.nvl(request.getParameter("jul").replaceAll("[^\\d]", "")));
      festivalDTO.setAug(CmmUtil.nvl(request.getParameter("aug").replaceAll("[^\\d]", "")));
      festivalDTO.setSep(CmmUtil.nvl(request.getParameter("sep").replaceAll("[^\\d]", "")));
      festivalDTO.setOct(CmmUtil.nvl(request.getParameter("oct").replaceAll("[^\\d]", "")));
      festivalDTO.setNov(CmmUtil.nvl(request.getParameter("nov").replaceAll("[^\\d]", "")));
      festivalDTO.setDec(CmmUtil.nvl(request.getParameter("dec").replaceAll("[^\\d]", "")));
      festivalDTO.setFst_exp(CmmUtil.nvl(request.getParameter("fst_exp")));
      festivalDTO.setFst_host(CmmUtil.nvl(request.getParameter("fst_host")));
      festivalDTO.setHostph_1(CmmUtil.nvl(request.getParameter("hostph_1").replaceAll("[^\\d]", "")));
      festivalDTO.setHostph_2(CmmUtil.nvl(request.getParameter("hostph_2").replaceAll("[^\\d]", "")));
      festivalDTO.setHostph_3(CmmUtil.nvl(request.getParameter("hostph_3").replaceAll("[^\\d]", "")));
      festivalDTO.setReg_dt(CmmUtil.nvl(request.getParameter("reg_dt")));
      festivalDTO.setReg_user_name(CmmUtil.nvl(user_name));                 /// user_name
      // select seq로 값 받아와서 view 딴의 detail로 보내면
      // 이거대신에 모델.에딧
      System.out.println("Festival Controller");
      if (festival.createfestInfo(festivalDTO)) {
         model.addAttribute("msg", "등록이 완료되었습니다.");
      } else {
         model.addAttribute("msg", "등록이 실패하였습니다.");
      }
      System.out.println("Festival Controller");
      // model.addAttribute("url", "detail.do?ctr_seq=1");
      log.info("End fest/festInsert !!");

      return "/fest/festMsgToList";
   }

   @RequestMapping("fest/festdetail")
   public String getfestDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {

      log.info("Welcome fest/festDetail !!");

      FestivalDTO festivalDTO = new FestivalDTO();
      
      log.info(festivalDTO);
      
      festivalDTO.setFst_seq(CmmUtil.nvl(request.getParameter("fst_seq")));
      
      log.info(CmmUtil.nvl(request.getParameter("fst_seq")));

      festivalDTO = festival.getfestDetail(festivalDTO);
      
      log.info(festivalDTO);
      
      model.addAttribute("festivalDTO", festivalDTO);

      log.info("End fst/festdetail !!");
       JSONObject days6 = CmmUtil.weather();
         System.out.println(days6);
         
         JSONObject sky = (JSONObject) days6.get("sky");

         JSONObject temp = (JSONObject) days6.get("temperature");

         System.out.println(sky.get("amName2day"));
         System.out.println(sky.get("amCode2day"));
         System.out.println(temp.get("tmin2day"));
         System.out.println(temp.get("tmax2day"));
         
         for (int i=2; i<11; i++){
         String amNameiday = (String)sky.get("amName"+i+"day");
         String amCodeiday = (String)sky.get("amCode"+i+"day");
         String tminiday = (String)sky.get("tmin"+i+"day");
         String tmaxiday = (String)sky.get("tmax"+i+"day");
         
         model.addAttribute("amCode"+i+"day", amCodeiday);
         model.addAttribute("amName"+i+"day", amNameiday);
         model.addAttribute("tmin"+i+"day", tminiday);
         model.addAttribute("tmax"+i+"day", tmaxiday);
         
         System.out.println(amNameiday);}

      return "fest/festdetail";
   }
   @RequestMapping("fest/rankDetail")
   public String getrankDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {
      
      log.info("Welcome fest/festDetail !!");
      
      FestivalDTO festivalDTO = new FestivalDTO();
      
      log.info(festivalDTO);
      
      festivalDTO.setFst_seq(CmmUtil.nvl(request.getParameter("fst_seq")));
      
      log.info(CmmUtil.nvl(request.getParameter("fst_seq")));
      
      festivalDTO = festival.getfestDetail(festivalDTO);
      
      log.info(festivalDTO);
      
      model.addAttribute("festivalDTO", festivalDTO);
      
      log.info("End fst/festdetail !!");
      JSONObject days6 = CmmUtil.weather();
      log.info(days6);
      
      JSONObject sky = (JSONObject) days6.get("sky");

      JSONObject temp = (JSONObject) days6.get("temperature");

      log.info(sky.get("amName2day"));
      log.info(sky.get("amCode2day"));
      log.info(temp.get("tmin2day"));
      log.info(temp.get("tmax2day"));
      
      for (int i=2; i<11; i++){
      String amNameiday = (String)sky.get("amName"+i+"day");
      String amCodeiday = (String)sky.get("amCode"+i+"day");
      String tminiday = (String)temp.get("tmin"+i+"day");
      String tmaxiday = (String)temp.get("tmax"+i+"day");
      
      model.addAttribute("amCode"+i+"day", amCodeiday);
      model.addAttribute("amName"+i+"day", amNameiday);
      model.addAttribute("tmin"+i+"day", tminiday);
      model.addAttribute("tmax"+i+"day", tmaxiday);
      
      log.info(temp);
      }
      
      PositionDTO pDto = CmmUtil.getPos(CmmUtil.nvl(festivalDTO.getDongmyun()));
      model.addAttribute("pDto",pDto);
      log.info(CmmUtil.nvl(pDto.getLat()));
      log.info(CmmUtil.nvl(pDto.getLng()));
      
      return "fest/rankDetail";
   }
   @RequestMapping("fest/festupdate")
   public String getfestUpdate(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {

      FestivalDTO festivalDTO = new FestivalDTO();
      festivalDTO.setFst_seq(CmmUtil.nvl(request.getParameter("fst_seq")));
      festivalDTO = festival.getfestDetail(festivalDTO);

      model.addAttribute("festivalDTO", festivalDTO);

      log.info(CmmUtil.nvl(request.getParameter("fst_seq")));

      log.info("End update");
      log.info(festivalDTO);

      return "fest/festupdate";

   }

   @RequestMapping("fest/festupdateForm")
   public String setfestupdateform(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {

      log.info("Welcome fest/festupdate !!");

      String user_name = CmmUtil.nvl((String)request.getSession().getAttribute("ADMINUSER_NAME"),"0");
      FestivalDTO festivalDTO = new FestivalDTO();
      
      // request.getParameter("ctr_seq") 원래 1 대신에 들어갔었던 값임.
      festivalDTO.setFst_seq(CmmUtil.nvl(request.getParameter("fst_seq")));
      festivalDTO.setCity(CmmUtil.nvl(request.getParameter("city")));
      festivalDTO.setLocal(CmmUtil.nvl(request.getParameter("local")));
      festivalDTO.setAttractions(CmmUtil.nvl(request.getParameter("attractions")));
      festivalDTO.setPay(CmmUtil.nvl(request.getParameter("pay")));
      festivalDTO.setNation(CmmUtil.nvl(request.getParameter("nation")));
      festivalDTO.setJan(CmmUtil.nvl(request.getParameter("jan").replaceAll("[^\\d]", "")));
      festivalDTO.setFeb(CmmUtil.nvl(request.getParameter("feb").replaceAll("[^\\d]", "")));
      festivalDTO.setMar(CmmUtil.nvl(request.getParameter("mar").replaceAll("[^\\d]", "")));
      festivalDTO.setApr(CmmUtil.nvl(request.getParameter("apr").replaceAll("[^\\d]", "")));
      festivalDTO.setMay(CmmUtil.nvl(request.getParameter("may").replaceAll("[^\\d]", "")));
      festivalDTO.setJun(CmmUtil.nvl(request.getParameter("jun").replaceAll("[^\\d]", "")));
      festivalDTO.setJul(CmmUtil.nvl(request.getParameter("jul").replaceAll("[^\\d]", "")));
      festivalDTO.setAug(CmmUtil.nvl(request.getParameter("aug").replaceAll("[^\\d]", "")));
      festivalDTO.setSep(CmmUtil.nvl(request.getParameter("sep").replaceAll("[^\\d]", "")));
      festivalDTO.setOct(CmmUtil.nvl(request.getParameter("oct").replaceAll("[^\\d]", "")));
      festivalDTO.setNov(CmmUtil.nvl(request.getParameter("nov").replaceAll("[^\\d]", "")));
      festivalDTO.setDec(CmmUtil.nvl(request.getParameter("dec").replaceAll("[^\\d]", "")));
      festivalDTO.setFst_exp(CmmUtil.nvl(request.getParameter("fst_exp")));
      festivalDTO.setChg_user_name(CmmUtil.nvl(user_name));                        ////user_name
      festivalDTO.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
      festivalDTO.setFst_host(CmmUtil.nvl(request.getParameter("fst_host")));
      festivalDTO.setHostph_1(CmmUtil.nvl(request.getParameter("hostph_1").replaceAll("[^\\d]", "")));
      festivalDTO.setHostph_2(CmmUtil.nvl(request.getParameter("hostph_2").replaceAll("[^\\d]", "")));
      festivalDTO.setHostph_3(CmmUtil.nvl(request.getParameter("hostph_3").replaceAll("[^\\d]", "")));
      festivalDTO.setReg_dt(CmmUtil.nvl(request.getParameter("reg_dt")));


      System.out.println("Festival updateform Controller123");
      model.addAttribute("festivalDTO", festivalDTO);
      if (festival.festupdateform(festivalDTO)) {
         model.addAttribute("msg", "수정이 완료되었습니다.");
      } else {
         model.addAttribute("msg", "수정이 실패하였습니다.");
      }
      System.out.println("Festival updateform2 Controller");

      log.info("End fest/festupdateform !!");

      return "/fest/festMsgToList";
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

   @RequestMapping("fest/busiFestlist")
   public String getBusiFestList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {
      
      
      return "busi/fest/festList"; 
   }
   
   
   @RequestMapping("fest/busiFestivalIndex")
   public String getBusiIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {
      log.info("Welcome fest/busiFestIndex !!");
      
      request.setCharacterEncoding("EUC-KR");

   
      
      log.info("1");
      
      FestivalDTO pDTO = new FestivalDTO();
      pDTO.setStart_page(CmmUtil.nvl(request.getParameter("start_page"),"1"));
      pDTO.setEnd_page(CmmUtil.nvl(request.getParameter("end_page"),"6"));
      log.info("start_page : "+ CmmUtil.nvl(request.getParameter("start_page"),"1"));
      log.info("end_page : "+ CmmUtil.nvl(request.getParameter("end_page"),"6"));
      
      FestivalDTO rList= festival.getBusiListAjax(pDTO);
      
      model.addAttribute("rList", rList);
      
      log.info("End Fest/busiFestIndex !!");
   
      
      return "/busi/fest/festListJson";
   }
   
   

   @RequestMapping("fest/busiFestDetail")
   public String getBusiFestDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {

      log.info("Welcome fest/festDetail !!");

      FestivalDTO festivalDTO = new FestivalDTO();
      festivalDTO.setFst_seq(CmmUtil.nvl(request.getParameter("fst_seq")));
      festivalDTO = festival.getbusiFestDetail(festivalDTO);
      model.addAttribute("festivalDTO", festivalDTO);
      
      log.info(CmmUtil.nvl(request.getParameter("fst_seq")));
      log.info("cal : " +CmmUtil.nvl(request.getParameter("cal")));

      log.info("End fest/busiFestDetail !!");
       JSONObject days6 = CmmUtil.weather();
         System.out.println(days6);
         
         JSONObject sky = (JSONObject) days6.get("sky");

         JSONObject temp = (JSONObject) days6.get("temperature");

         System.out.println(sky.get("amName2day"));
         System.out.println(sky.get("amCode2day"));
         System.out.println(temp.get("tmin2day"));
         System.out.println(temp.get("tmax2day"));
         
      
         String amName2day = (String)sky.get("amName2day");
         String amCode2day = (String)sky.get("amCode2day");
         String tmin2day = (String)temp.get("tmin2day");
         String tmax2day = (String)temp.get("tmax2day");
         
         String amName3day = (String)sky.get("amName3day");
         String amCode3day = (String)sky.get("amCode3day");
         String tmin3day = (String)temp.get("tmin3day");
         String tmax3day = (String)temp.get("tmax3day");
         
         String amName4day = (String)sky.get("amName4day");
         String amCode4day = (String)sky.get("amCode4day");
         String tmin4day = (String)temp.get("tmin4day");
         String tmax4day = (String)temp.get("tmax4day");
         
         String amName5day = (String)sky.get("amName5day");
         String amCode5day = (String)sky.get("amCode5day");
         String tmin5day = (String)temp.get("tmin5day");
         String tmax5day = (String)temp.get("tmax5day");
         
         String amName6day = (String)sky.get("amName6day");
         String amCode6day = (String)sky.get("amCode6day");
         String tmin6day = (String)temp.get("tmin6day");
         String tmax6day = (String)temp.get("tmax6day");
         
         String amName7day = (String)sky.get("amName7day");
         String amCode7day = (String)sky.get("amCode7day");
         String tmin7day = (String)temp.get("tmin7day");
         String tmax7day = (String)temp.get("tmax7day");
         
         String amName8day = (String)sky.get("amName8day");
         String amCode8day = (String)sky.get("amCode8day");
         String tmin8day = (String)temp.get("tmin8day");
         String tmax8day = (String)temp.get("tmax8day");
         
         String amName9day = (String)sky.get("amName9day");
         String amCode9day = (String)sky.get("amCode9day");
         String tmin9day = (String)temp.get("tmin9day");
         String tmax9day = (String)temp.get("tmax9day");
         
         String amName10day = (String)sky.get("amName10day");
         String amCode10day = (String)sky.get("amCode10day");
         String tmin10day = (String)temp.get("tmin10day");
         String tmax10day = (String)temp.get("tmax10day");
         
         model.addAttribute("amCode2day", amCode2day);
         model.addAttribute("amName2day", amName2day);
         model.addAttribute("tmin2day", tmin2day);
         model.addAttribute("tmax2day", tmax2day);
         
         model.addAttribute("amCode3day", amCode3day);
         model.addAttribute("amName3day", amName3day);
         model.addAttribute("tmin3day", tmin3day);
         model.addAttribute("tmax3day", tmax3day);
         
         model.addAttribute("amCode4day", amCode4day);
         model.addAttribute("amName4day", amName4day);
         model.addAttribute("tmin4day", tmin4day);
         model.addAttribute("tmax4day", tmax4day);
         
         model.addAttribute("amCode5day", amCode5day);
         model.addAttribute("amName5day", amName5day);
         model.addAttribute("tmin5day", tmin5day);
         model.addAttribute("tmax5day", tmax5day);
         
         model.addAttribute("amCode6day", amCode6day);
         model.addAttribute("amName6day", amName6day);
         model.addAttribute("tmin6day", tmin6day);
         model.addAttribute("tmax6day", tmax6day);
         
         model.addAttribute("amCode7day", amCode7day);
         model.addAttribute("amName7day", amName7day);
         model.addAttribute("tmin7day", tmin7day);
         model.addAttribute("tmax7day", tmax7day);
         
         model.addAttribute("amCode8day", amCode8day);
         model.addAttribute("amName8day", amName8day);
         model.addAttribute("tmin8day", tmin8day);
         model.addAttribute("tmax8day", tmax8day);
         
         model.addAttribute("amCode9day", amCode9day);
         model.addAttribute("amName9day", amName9day);
         model.addAttribute("tmin9day", tmin9day);
         model.addAttribute("tmax9day", tmax9day);
         
         model.addAttribute("amCode10day", amCode10day);
         model.addAttribute("amName10day", amName10day);
         model.addAttribute("tmin10day", tmin10day);
         model.addAttribute("tmax10day", tmax10day);
         
         PositionDTO pDto = CmmUtil.getPos(CmmUtil.nvl(festivalDTO.getDongmyun()));
         model.addAttribute("pDto",pDto);
         log.info(CmmUtil.nvl(pDto.getLat()));
         log.info(CmmUtil.nvl(pDto.getLng()));
         
         
         //############################ 여기 차트 들어감
 		SalesDTO pDTO = new SalesDTO();
 		pDTO.setFst_seq(CmmUtil.nvl(request.getParameter("fst_seq")));
 		
 		log.info("fst_seq : "+ CmmUtil.nvl(request.getParameter("fst_seq")));

 		//메인 차트 관련
 		JSONObject json = salesService.getBusiFestivaSalesNmInfo(pDTO);
 		model.addAttribute("json",json); //차트 추가

 		
		//도넛 차트 관련
		SalesDTO rDTO = salesService.getBusiFestivaSalesNmInfoDonuts(pDTO);

		if (rDTO == null){
			rDTO = new SalesDTO();
			
		}
		model.addAttribute("rDTO",rDTO); //도넛 차트 추가
		
		//바차트 가져오기
		List<SalesDTO> rList = salesService.getFestivaSalesNmInfoBarChart(pDTO);
		
		if (rList == null){
			rList = new ArrayList<SalesDTO>();
			
		}
				
		model.addAttribute("rList", rList); //바 차트 추가
		
		
      return "/busi/fest/festDetail";
   }
   


}