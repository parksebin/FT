<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%
/*
결과 메시지 띄우고, 목록으로 이동
*/


String msg = CmmUtil.nvl((String)request.getAttribute("msg"));
%>

<script type="text/javascript">
<%
if (msg.length()>0){
%>
	alert("<%=msg %>");
<%	
}else{
%>
	alert("시스템에 문제가 발생하였습니다. 관리자에게 문의하세요.");
<%	
}
%>
parent.location.href="/event/eventList.do";
</script>
    