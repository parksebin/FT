<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String menu_seq = (String)request.getAttribute("menu_seq");
	if(menu_seq==null){
		menu_seq="";
	}
%>
<script>
	alert('${msg}');
	location.href="${url}";
</script>