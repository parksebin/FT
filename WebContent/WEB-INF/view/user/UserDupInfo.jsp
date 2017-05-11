<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%@ page import="ac.kr.ft.com.dto.UserDTO"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	UserDTO rDTO = (UserDTO) request.getAttribute("rDTO");
	if (rDTO == null) {
		rDTO = new UserDTO();
	}
	
	out.println(CmmUtil.nvl(rDTO.getUser_exists()));
%> 

