package ac.kr.ft.com.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.JsonObject;

import ac.kr.ft.com.dto.ComDTO;
import ac.kr.ft.com.dto.CommunityDTO;
import ac.kr.ft.com.dto.EmpDTO;
import ac.kr.ft.com.dto.EventDTO;
import ac.kr.ft.com.dto.VisitorDTO;
import ac.kr.ft.com.service.ICommService;
import ac.kr.ft.com.util.CmmUtil;

@Controller
public class ComController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "CommService")
	private ICommService comService;
	
	@RequestMapping("main")
	public String main(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		VisitorDTO visitorDto = comService.getVisitorDto();
		ComDTO comDto = comService.getComDto();
		List<ComDTO> list = comService.getCommentList();
		JSONObject json = comService.getJsonObject();
		model.addAttribute("visitorDto",visitorDto);
		model.addAttribute("comDto",comDto);
		model.addAttribute("list",list);
		model.addAttribute("json",json);
		return "/main";
	}

	@RequestMapping("appmain")
	public String appmain(HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
		log.info("Wellcom user/usermain");
		List<ComDTO> rList = comService.getNewList();
		log.info("게시글의 개수는"+rList.size());
		
		if (CmmUtil.nvl((String)session.getAttribute("AUTH")) == null || CmmUtil.nvl((String)session.getAttribute("AUTH")).equals("")) {
			session.setAttribute("AUTH", "");
			session.setAttribute("USER_NAME", "");
			session.setAttribute("USER_NO", "");
			session.setAttribute("MILEAGE", "");
			
			model.addAttribute("url", "/guestmain.do");
		} else {
			if (CmmUtil.nvl((String)session.getAttribute("AUTH")).equals("P")) {
				model.addAttribute("url", "/busimain.do");
			} else {
				model.addAttribute("url", "/guestmain.do");
			}
		}
		return "/redirect";
	}

	@RequestMapping("guestmain")
	public String guestmain(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		comService.setVisitor();
		log.info("Wellcom user/usermain");
		List<ComDTO> rList = comService.getNewList();
		log.info("게시글의 개수는"+rList.size());
		model.addAttribute("rList", rList);
		return "/guest/guestmain";
	}

	@RequestMapping("busimain")
	public String busimain(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		log.info("Wellcom user/usermain");
		List<ComDTO> rList = comService.getNewList();
		log.info("게시글의 개수는"+rList.size());
		model.addAttribute("rList", rList);
		return "/busi/busimain";
	}
	
	
}
