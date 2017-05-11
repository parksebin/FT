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

import ac.kr.ft.com.dto.UserDTO;
import ac.kr.ft.com.service.IAuthService;
import ac.kr.ft.com.util.CmmUtil;

@Controller
public class AuthController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "AuthService")
	private IAuthService authService;
	
	@RequestMapping(value="auth/authList", method=RequestMethod.GET)
	public String getAuthList(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		String auth = (String) request.getSession().getAttribute("ADMINAUTH");
		if(auth==null || auth.equals("")){
			log.info("no Login"); 
			return "/com/loginplz";
		}else if(!auth.equals("A")){
			log.info("no Auth"); 
			return "/com/adminloginplz";
		}
		log.info("welcome auth/authList"); 
		List<UserDTO> list = authService.getAuthList();
		model.addAttribute("list",list);
		return "auth/authList";
	}
	
	@RequestMapping(value="auth/updateOne", method=RequestMethod.GET)
	public String updateOne(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		String auth = (String) request.getSession().getAttribute("ADMINAUTH");
		if(auth==null || auth.equals("")){
			log.info("no Login"); 
			return "/com/loginplz";
		}else if(!auth.equals("A")){
			log.info("no Auth"); 
			return "/com/adminloginplz";
		}
		String chgUserno = (String) request.getSession().getAttribute("ADMINUSER_NO");
		
		log.info("welcome auth/updateOne");
		UserDTO userDTO = new UserDTO();
		userDTO.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));
		userDTO.setAuth(CmmUtil.nvl(request.getParameter("auth")));
		userDTO.setChg_user_no(chgUserno);
		String msg = "a";
		if(authService.updateAuthOne(userDTO)){
			msg = "수정 성공하였습니다.";
		}else{
			msg = "수정 실패실패하였습니다.";
		}
		String url = "authList.do";
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		return "/redirect";
	}
	
	@RequestMapping(value="auth/updateAll", method=RequestMethod.GET)
	public String updateAll(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		String auth = (String) request.getSession().getAttribute("ADMINAUTH");
		if(auth==null || auth.equals("")){
			log.info("no Login"); 
			return "/com/loginplz";
		}else if(!auth.equals("A")){
			log.info("no Auth"); 
			return "/com/adminloginplz";
		}
		String chgUserno = (String) request.getSession().getAttribute("ADMINUSER_NO");
		
		log.info("welcome auth/updateAll"); 
		String[] check = request.getParameterValues("check");
		String msg="";
		int count=0;
		while(count<check.length){
			UserDTO userDTO = new UserDTO();
			userDTO.setUser_no(CmmUtil.nvl(check[count]));
			userDTO.setAuth(CmmUtil.nvl(request.getParameter("auth_"+check[count])));
			userDTO.setChg_user_no(chgUserno);
			if(!authService.updateAuthOne(userDTO)){
				msg=check[count]+"부터 에러가 발생하였습니다.";
				break;
			};
			count++;
		}
		msg="전체 수정 성공하였습니다.";
		String url = "authList.do";
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		return "/redirect";
	}
}
