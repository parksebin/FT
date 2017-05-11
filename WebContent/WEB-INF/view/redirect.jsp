<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
	<%
		String msg = (String)request.getAttribute("msg");
		if(msg==null || msg.equals("")){
			
		}else{ %>
			alert('${msg}');
		<%} %>
		location.href="${url}";
</script>