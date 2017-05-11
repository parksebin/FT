<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%
/*
결과 메시지 띄우고, 목록으로 이동
*/
String msg = CmmUtil.nvl((String)request.getAttribute("msg")); //메시지
String jObj = CmmUtil.nvl((String)request.getAttribute("jObj"));
String fileGRP = CmmUtil.nvl((String)request.getAttribute("fileGRP"));

String vObj = CmmUtil.nvl((String)request.getAttribute("vObj"));
String viewImgSRC = CmmUtil.nvl((String)request.getAttribute("viewImgSRC"));
%>

<script type="text/javascript">
<%
if (msg.length()>0){
%>
	alert("<%=msg %>");
<%	
}else{
%>
	alert("파일이 저장되었습니다.");
<%	
}
%>

<%
if(jObj.length()>0){
%>
	parent.opener.document.getElementById("<%=jObj%>").value = "<%=fileGRP%>";
<%
}
%>
top.close();
</script>
    