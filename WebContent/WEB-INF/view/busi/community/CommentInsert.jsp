<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%@ page import="ac.kr.ft.com.dto.CommunityComDTO"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
 pageEncoding="EUC-KR"%>
<%
 CommunityComDTO comDto = (CommunityComDTO) request.getAttribute("comDto");
 if (comDto == null) {
	 comDto = new CommunityComDTO();
 }
 
 out.println(CmmUtil.nvl(comDto.getContents()));
%>