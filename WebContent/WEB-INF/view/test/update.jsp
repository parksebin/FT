<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="ac.kr.ft.com.dto.EmpDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
EmpDTO empDto = (EmpDTO)request.getAttribute("empDto");
if(empDto == null){
	empDto = new EmpDTO();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="f" action="update.do">
<input type="hidden" name="empno" value="<%=CmmUtil.nvl(empDto.getEmpno()) %>"/>

<table align="center" border="1" >
	<tr>
		<td> empno</td>
		<td><input type="text" value="<%=CmmUtil.nvl(empDto.getEmpno()) %>" disabled="disabled"/></td>
		<td> ename</td>
		<td><input type="text" name="ename" value="<%=CmmUtil.nvl(empDto.getEname()) %>"/></td>
	</tr>
	
	<tr>
		<td> job</td>
		<td><input type="text" name="job" value="<%=CmmUtil.nvl(empDto.getJob()) %>"/></td>
		<td> mgr</td>
		<td><input type="text" name="mgr" value="<%=CmmUtil.nvl(empDto.getMgr()) %>"/></td>
	</tr>
	
	<tr>
		<td> sal</td>
		<td><input type="text" name="sal" value="<%=CmmUtil.nvl(empDto.getSal()) %>"/></td>
		<td> comm</td>
		<td><input type="text" name="comm" value="<%=CmmUtil.nvl(empDto.getComm()) %>"/></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">deptno</td>
		<td colspan="2" align="center"><input type="text" name="deptno" value="<%=CmmUtil.nvl(empDto.getDeptno()) %>"/></td>
	</tr>
	
	<tr>
		<td colspan="4" align="center">
			<input type="submit" value="수정하기" />
		</td>
	</tr>
</table>
</form>
</body>
</html>