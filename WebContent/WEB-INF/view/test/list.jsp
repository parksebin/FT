<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.EmpDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<EmpDTO> rList = (List<EmpDTO>)request.getAttribute("list"); 

if (rList==null){
	rList = new ArrayList<EmpDTO>();
}
%>    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="resource/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
			
<form name="f" action="X">
<div class="container">
	<h2>emp테이블</h2>
	<ul class="list-group">
	<%
	Iterator<EmpDTO> it = rList.iterator();
	while(it.hasNext()){
		EmpDTO empDTO = (EmpDTO)it.next();
		
		if (empDTO==null){
			empDTO = new EmpDTO();
		}
		
		out.println("emp.empno" + CmmUtil.nvl(empDTO.getEmpno())+"<br/>");
	}
	%>
	</ul>
<input type="button" value="emp 삽입" onclick="location.href='insertForm.do'" align="right"/>
</div>
</form>
</body>
</html>