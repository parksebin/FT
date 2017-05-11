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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ac.kr.ft.com.dto.HygDTO;
import ac.kr.ft.com.dto.MenuComDTO;
import ac.kr.ft.com.dto.MenuInfoDTO;
import ac.kr.ft.com.service.IHygService;
import ac.kr.ft.com.util.CmmUtil;

@Controller
public class HygController {
   private static final int HygDetail = 0;

   private Logger log = Logger.getLogger(this.getClass());

   @Resource(name = "HygService")
   private IHygService hyg;

   @RequestMapping("hyg")
   public String add(@RequestParam Map<String, Object> map, ModelMap model) {
      System.out.println("화이팅하자");
      return "/hyg/samplePage";
   }

   @RequestMapping("hyg/hygList")
   public String getHYGList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {
      log.info("Welcome hyg/hygList !!");

      List<HygDTO> rList = hyg.getHYGList();
      model.addAttribute("rList", rList);

      log.info("End hyg/hygList !!");

      return "/hyg/hygList";
   }

   @RequestMapping("hyg/hygDetail")
   public String getHYGDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {

      log.info("Welcome hyg/hygDetail !!");

      HygDTO hygDto = new HygDTO();
      hygDto.setHgn_seq(CmmUtil.nvl(request.getParameter("hgn_seq")));
      hygDto = hyg.getHYGDetail(hygDto);
      model.addAttribute("hygDto", hygDto);

      log.info("End hyg/hygDetail !!");

      return "hyg/hygDetail";
   }

   /**
    * 등록화면 보여주기
    */
   @RequestMapping("hyg/hygReg")
   public String insertForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {
      log.info("Welcome hyg/hygReg !!");

      log.info("End hyg/hygReg !!");

      return "/hyg/hygReg";
   }

   /**
    * 등록데이터 db 저장하기
    */
   @RequestMapping("hyg/hygInsert")
   public String createHYGInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response,
         ModelMap model) throws Exception {

      log.info("Welcome hyg/hygInsert !!");

      HygDTO hygDto = new HygDTO();
      
      String title = CmmUtil.nvl(request.getParameter("title"));
      title = title.replaceAll("& #39;", "'");
      title = title.replaceAll("& #40;", "(");
      title = title.replaceAll("& #41;", ")");
      title = title.replaceAll("& lt;", "<");
      title = title.replaceAll("& gt;", ">");
      
      String contents = CmmUtil.nvl(request.getParameter("contents"));
      contents = contents.replaceAll("& #39;", "'");
      contents = contents.replaceAll("& #40;", "(");
      contents = contents.replaceAll("& #41;", ")");
      contents = contents.replaceAll("& lt;", "<");
      contents = contents.replaceAll("& gt;", ">");
      
      
      
      
      
      
      
      hygDto.setHgn_seq(CmmUtil.nvl(request.getParameter("hgn_seq")));
      hygDto.setTitle(title);
      hygDto.setContents(contents);
      hygDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
      hygDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
      hygDto.setChg_user_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));

      log.info("hgn_seq : " + CmmUtil.nvl(request.getParameter("hgn_seq")));
      log.info("title : " + CmmUtil.nvl(request.getParameter("title")));
      log.info("contents : " + CmmUtil.nvl(request.getParameter("contents")));
      log.info("fileGRP : " + CmmUtil.nvl(request.getParameter("fileGRP")));

      // select seq로 값 받아와서 view 딴의 detail로 보내면
      // 이거대신에 모델.에딧
      if (hyg.createHYGInfo(hygDto)) {
         request.setAttribute("msg", "등록 되었습니다");
      } else {
         request.setAttribute("msg", "등록 실패 되었습니다");
      }
      // request.setAttribute("url", "detail.do?hyg_seq=1");

      log.info("End hyg/hygInsert !!");

      return "/hyg/hygMsqToList";
   }

   @RequestMapping("hyg/delete")
   public String deleteHYGInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {
      HygDTO hygDto = new HygDTO();
      hygDto.setHgn_seq(CmmUtil.nvl(request.getParameter("hgn_seq")));
      if (hyg.deleteHYGInfo(hygDto)) {
         request.setAttribute("msg", "삭제가 완료 되었습니다");
      } else {
         request.setAttribute("msg", "삭제가 실패 되었습니다");
      }
      request.setAttribute("url", "hygList.do");
      return "/redirect";
   }

   @RequestMapping("hyg/updateForm")
   public String updateForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {
      HygDTO hygDto = new HygDTO();
      hygDto.setHgn_seq(CmmUtil.nvl(request.getParameter("hgn_seq")));
      hygDto = hyg.getHYGDetail(hygDto);
      model.addAttribute("hygDto", hygDto);
      return "/hyg/hygUpdate";
   }

   @RequestMapping("hyg/hygUpdate")
   public String updateHYGInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response,
         ModelMap model) throws Exception {
      try {
         request.setCharacterEncoding("EUC-KR");
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      
      HygDTO hygDto = new HygDTO();
      
      String title = CmmUtil.nvl(request.getParameter("title"));
      title = title.replaceAll("& #39;", "'");
      title = title.replaceAll("& #40;", "(");
      title = title.replaceAll("& #41;", ")");
      title = title.replaceAll("& lt;", "<");
      title = title.replaceAll("& gt;", ">");
      
      String contents = CmmUtil.nvl(request.getParameter("contents"));
      contents = contents.replaceAll("& #39;", "'");
      contents = contents.replaceAll("& #40;", "(");
      contents = contents.replaceAll("& #41;", ")");
      contents = contents.replaceAll("& lt;", "<");
      contents = contents.replaceAll("& gt;", ">");
      
      
      
      hygDto.setHgn_seq(CmmUtil.nvl(request.getParameter("hgn_seq")));
      hygDto.setTitle(title);
      hygDto.setContents(contents);
      hygDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
      hygDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO")));
      hygDto.setChg_user_no(CmmUtil.nvl(request.getParameter("ADMINUSER_NO")));

      if (hyg.updateHYGInfo(hygDto)) {
         request.setAttribute("msg", "수정이 완료 되었습니다");
      } else {
         request.setAttribute("msg", "수정이 실패 되었습니다");
      }
      request.setAttribute("url", "hygList.do");
      return "/redirect";
   }

   @RequestMapping("hyg/deleteAllCheckList")
   public String deleteAllCheckList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {
      log.info("Welcome deleteAllCheckList !!");

      String[] allCheckSeq = request.getParameterValues("chkMenu");

      HygDTO pDTO = new HygDTO();

      pDTO.setAllCheckSeq(allCheckSeq);

      if (hyg.deleteAllCheckList(pDTO)) {
         request.setAttribute("msg", "삭제가 완료 되었습니다");

      } else {
         request.setAttribute("msg", "삭제가 실패 되었습니다");

      }

      pDTO = null;

      request.setAttribute("url", "hygList.do");

      log.info("End deleteAllCheckList !!");

      return "/redirect";
   }
   /*
    * ##########################################################################
    * #                  사업자용 시작                              #
    * ##########################################################################
    * 
    * */

   @RequestMapping("hyg/busiHygList")
   public String getBusiHYGList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {
      log.info("Welcome hyg/busihygList !!");

      List<HygDTO> rList = hyg.getHYGList();
      model.addAttribute("rList", rList);
      

      log.info("End hyg/busihygList !!");

      return "/busi/hyg/HygList";
   }
   
   
   @RequestMapping("hyg/busiHygDetail")
   public String getBusiHYGDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {

      log.info("Welcome hyg/busihygDetail !!");

      HygDTO hygDto = new HygDTO();
      hygDto.setHgn_seq(CmmUtil.nvl(request.getParameter("hgn_seq")));
      hygDto = hyg.getHYGDetail(hygDto);
      model.addAttribute("hygDto", hygDto);

      log.info("End hyg/busihygDetail !!");

      return "/busi/hyg/HygDetail";
   
   }
   
   @RequestMapping("hyg/busihygReg")
   public String BusiMenuReg(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {
      log.info("Welcome hyg/busihygReg !!");

      log.info("End hyg/busihygReg !!");

      return "/busi/hyg/HygReg";
   }

   /**
    * 등록데이터 db 저장하기
    */
   @RequestMapping("hyg/busihygInsert")
   public String createBusiHYGInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response,
         ModelMap model) throws Exception {

      log.info("Welcome hyg/busihygInsert !!");
      
      String contents = CmmUtil.nvl(request.getParameter("contents"));
      contents = contents.replaceAll("\r\n", "<br>").replaceAll("& #39;", "'")
            .replaceAll("& #40;", "(")
            .replaceAll("& #41;", ")")
            .replaceAll("& lt;", "<")
            .replaceAll("& gt;", ">");
      
      String title = CmmUtil.nvl(request.getParameter("title"));
      title = title.replaceAll("\r\n", "<br>").replaceAll("& #39;", "'")
            .replaceAll("& #40;", "(")
            .replaceAll("& #41;", ")")
            .replaceAll("& lt;", "<")
            .replaceAll("& gt;", ">");
      
      HygDTO hygDto = new HygDTO();
      hygDto.setHgn_seq(CmmUtil.nvl(request.getParameter("hgn_seq")));
      hygDto.setTitle(title);
      hygDto.setContents(contents);
      hygDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
      hygDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
      hygDto.setChg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));

      log.info("hgn_seq : " + CmmUtil.nvl(request.getParameter("hgn_seq")));
      log.info("title : " + CmmUtil.nvl(request.getParameter("title")));
      log.info("contents : " + CmmUtil.nvl(request.getParameter("contents")));
      log.info("fileGRP : " + CmmUtil.nvl(request.getParameter("fileGRP")));

      // select seq로 값 받아와서 view 딴의 detail로 보내면
      // 이거대신에 모델.에딧
      if (hyg.createHYGInfo(hygDto)) {
         request.setAttribute("msg", "등록 되었습니다");
      } else {
         request.setAttribute("msg", "등록이  실패되었습니다");
      }
      // request.setAttribute("url", "detail.do?hyg_seq=1");

      log.info("End hyg/hygInsert !!");

      return "/busi/hyg/hygMsqToList";
   }
   
   @RequestMapping("hyg/busidelete")
   public String deletebusiHYGInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {
      log.info("Welcome hyg/busidelete !!"); 
      HygDTO hygDto = new HygDTO();
      hygDto.setHgn_seq(CmmUtil.nvl(request.getParameter("hgn_seq")));
      if (hyg.deleteHYGInfo(hygDto)) {
         request.setAttribute("msg", "삭제가 완료 되었습니다");
      }else{
         request.setAttribute("msg", "삭제가 실패 되었습니다");
      }
      request.setAttribute("url", "busiHygList.do");
      return "/redirect";
   }
   
   @RequestMapping("hyg/busiupdateForm")
   public String updatebusiForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {
      log.info("Welcome hyg/busiupdateForm !!"); 
      
      HygDTO hygDto = new HygDTO();
      hygDto.setHgn_seq(CmmUtil.nvl(request.getParameter("hgn_seq")));
      hygDto = hyg.getHYGDetail(hygDto);
      model.addAttribute("hygDto", hygDto);
      
      hygDto.setContents(hygDto.getContents().replaceAll("<br>", "\r\n"));
      log.info("END HYG/busiupdateForm !!"); 
      return "/busi/hyg/HygUpdate";
   }
   @RequestMapping("hyg/busihygUpdate")
   public String updatebusiHYGInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response,
         ModelMap model) throws Exception {
      try {
         request.setCharacterEncoding("EUC-KR");
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      
      
      String contents = CmmUtil.nvl(request.getParameter("contents"));
      contents = contents.replaceAll("\r\n", "<br>").replaceAll("& #39;", "'")
            .replaceAll("& #40;", "(")
            .replaceAll("& #41;", ")")
            .replaceAll("& lt;", "<")
            .replaceAll("& gt;", ">");
      
      String title = CmmUtil.nvl(request.getParameter("title"));
      title = title.replaceAll("\r\n", "<br>").replaceAll("& #39;", "'")
            .replaceAll("& #40;", "(")
            .replaceAll("& #41;", ")")
            .replaceAll("& lt;", "<")
            .replaceAll("& gt;", ">");
      
      
      
      response.setCharacterEncoding("EUC-KR");
      HygDTO hygDto = new HygDTO();
      hygDto.setHgn_seq(CmmUtil.nvl(request.getParameter("hgn_seq")));
      hygDto.setTitle(title);
      hygDto.setContents(contents);
      hygDto.setFile_grp(CmmUtil.nvl(request.getParameter("fileGRP")));
      hygDto.setReg_user_no(CmmUtil.nvl((String) session.getAttribute("USER_NO")));
      hygDto.setChg_user_no(CmmUtil.nvl(request.getParameter("chg_user_no")));

      if (hyg.updateHYGInfo(hygDto)) {
         request.setAttribute("msg", "수정이 완료 되었습니다");
      } else {
         request.setAttribute("msg", "수정이 실패 되었습니다");
      }
      request.setAttribute("url", "busiHygList.do");
      return "/redirect";
   }
   
   @RequestMapping("hyg/busideleteAllCheckList")
   public String deletebusiAllCheckList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {
      log.info("Welcome busideleteAllCheckList !!");

      String[] allCheckSeq = request.getParameterValues("chkMenu");

      HygDTO pDTO = new HygDTO();

      pDTO.setAllCheckSeq(allCheckSeq);

      if (hyg.deleteAllCheckList(pDTO)) {
         request.setAttribute("msg", "삭제가 완료 되었습니다");

      } else {
         request.setAttribute("msg", "삭제가 실패 되었습니다");

      }

      pDTO = null;

      request.setAttribute("url", "busiHygList.do");

      log.info("End busideleteAllCheckList !!");

      return "/redirect";
   }
   /*
    * ##########################################################################
    * #                  사업자 용 끝.                              #
    * ##########################################################################
    * 
    * */      
   
   
   
   
   
   /*
    * ##########################################################################
    * #                  사용자 용 시작                           #
    * ##########################################################################
    * 
    * */      
   
   @RequestMapping("hyg/userHygList")
   public String getUserHYGList(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {
      log.info("Welcome hyg/useruserhygList !!");

      List<HygDTO> rList = hyg.getHYGList();
      model.addAttribute("rList", rList);

      log.info("End hyg/userhygList !!");

      return "/guest/hyg/userhygList";
   }
   
   
   @RequestMapping("hyg/userHygDetail")
   public String getUserHYGDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model)
         throws Exception {

      log.info("Welcome hyg/userhygDetail !!");

      HygDTO hygDto = new HygDTO();
      hygDto.setHgn_seq(CmmUtil.nvl(request.getParameter("hgn_seq")));
      hygDto = hyg.getHYGDetail(hygDto);
      model.addAttribute("hygDto", hygDto);

      log.info("End hyg/userhygDetail !!");

      return "/guest/hyg/userhygDetail";
   
   }
   
   
   
   
   /*
    * ##########################################################################
    * #                  사용자 용 끝                           #
    * ##########################################################################
    * 
    * */      
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
}

   