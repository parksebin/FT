<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String notice_seq = (String)request.getAttribute("notice_seq");
	if(notice_seq==null){
		notice_seq="";
	}
%>
<script>
	alert('${msg}');
	location.href="${url}";
</script>