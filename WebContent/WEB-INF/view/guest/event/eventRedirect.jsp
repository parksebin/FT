<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String ent_seq = (String)request.getAttribute("ent_seq");
	if(ent_seq==null){
		ent_seq="";
	}
%>
<script>
	alert('${msg}');
	location.href="${url}";
</script>