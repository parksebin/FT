<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String cmt_seq = (String)request.getAttribute("cmt_seq");
	if(cmt_seq==null){
		cmt_seq="";
	}
%>
<script>
	alert('${msg}');
	location.href="${url}";
</script>