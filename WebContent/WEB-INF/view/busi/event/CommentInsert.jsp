<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%@ page import="ac.kr.ft.com.dto.EventComDTO"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
 pageEncoding="EUC-KR"%>
<%
 EventComDTO evee = (EventComDTO) request.getAttribute("evee");
 if (evee == null) {
	 evee = new EventComDTO();
 }
 
 out.println(CmmUtil.nvl(evee.getContents()));
%>