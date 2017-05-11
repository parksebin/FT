<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%@ page import="ac.kr.ft.com.dto.NoticeComDTO"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
 pageEncoding="EUC-KR"%>
<%
 NoticeComDTO noticee = (NoticeComDTO) request.getAttribute("noticee");
 if (noticee == null) {
	 noticee = new NoticeComDTO();
 }
 
 out.println(CmmUtil.nvl(noticee.getContents()));
%>