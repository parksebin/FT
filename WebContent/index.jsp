<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<script type="text/javascript">
var ua = window.navigator.userAgent;
</script>
<%
	//로그인 된 user_no
	String SS_AUTH = CmmUtil.nvl((String) session.getAttribute("ADMINAUTH"));
	String SS_USER_NO = CmmUtil.nvl((String) session.getAttribute("ADMINUSER_NO"));

	if (SS_USER_NO.length() > 0) {
		if (SS_AUTH.equals("A")) {
			response.sendRedirect("/main.do");
		} else {
			response.sendRedirect("/appmain.do");
		}
	} else {
%>
<script type="text/javascript">
	if (/lgtelecom/i.test(ua) || /Android/i.test(ua) || /blackberry/i.test(ua)
			|| /iPhone/i.test(ua) || /iPad/i.test(ua) || /samsung/i.test(ua)
			|| /symbian/i.test(ua) || /sony/i.test(ua) || /SCH-/i.test(ua)
			|| /SPH-/i.test(ua) || /nokia/i.test(ua) || /bada/i.test(ua)
			|| /semc/i.test(ua) || /IEMobile/i.test(ua) || /Mobile/i.test(ua)
			|| /PPC/i.test(ua) || /Windows CE/i.test(ua)
			|| /Windows Phone/i.test(ua) || /webOS/i.test(ua)
			|| /Opera Mini/i.test(ua) || /Opera Mobi/i.test(ua)
			|| /POLARIS/i.test(ua) || /SonyEricsson/i.test(ua)
			|| /symbos/i.test(ua)) {
		location.href="/appmain.do";//모바일 	
	} else {
		location.href="/user/loginform.do";//pc
	}
</script>
<%
}
	//if (SS_USER_NO.length() > 0) {
	//	response.sendRedirect("/main.jsp");

	//로그인 되지 않은 상태라면....	
	//} else {
	//	response.sendRedirect("/user/loginform.do");

	//}
%>