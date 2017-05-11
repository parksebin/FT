<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="ac.kr.ft.com.dto.EmpDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% EmpDTO empDto = (EmpDTO)request.getAttribute("empDto"); 
if(empDto == null){
	empDto = new EmpDTO();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
	function doAction(gubun) {
		var f = document.getElementById("form1");
		if(gubun=="U"){
			f.action = "updateForm.do";
			f.submit();
		}else if(gubun=="D"){
			if(confirm("삭제하시겠습니까?")){
				f.action = "delete.do";
				f.submit();
			}
		}
	}
</script>
</head>
<body>
<div class="container">
	<ul class="list-group">
		<li class="list-group-item"><%=CmmUtil.nvl(empDto.getEmpno()) %></li>
		<li class="list-group-item"><%=CmmUtil.nvl(empDto.getEname()) %></li>
		<li class="list-group-item"><%=CmmUtil.nvl(empDto.getJob()) %></li>
		<li class="list-group-item"><%=CmmUtil.nvl(empDto.getMgr()) %></li>
		<li class="list-group-item"><%=CmmUtil.nvl(empDto.getHireDate()) %></li>
		<li class="list-group-item"><%=CmmUtil.nvl(empDto.getSal()) %></li>
		<li class="list-group-item"><%=CmmUtil.nvl(empDto.getComm()) %></li>
		<li class="list-group-item"><%=CmmUtil.nvl(empDto.getDeptno()) %></li>
	</ul>
</div>
<table width="100%">
	<tr>
		<td align="center">
			<input type="button" value="수정" onclick="doAction('U')" />
			<input type="button" value="삭제" onclick="doAction('D')"/>
		</td>
	</tr>
</table>
<form name="form1" id="form1" method="post">
	<input type="hidden" name="empno" value="<%=CmmUtil.nvl(empDto.getEmpno()) %>">
</form>

</body>
</html>