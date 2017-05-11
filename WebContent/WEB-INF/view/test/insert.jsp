<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="f" action="insert.do">

<table align="center" border="1" >
	<tr>
		<td> empno</td>
		<td><input type="text" name="empno" /></td>
		<td> ename</td>
		<td><input type="text" name="ename" /></td>
	</tr>
	
	<tr>
		<td> job</td>
		<td><input type="text" name="job" /></td>
		<td> mgr</td>
		<td><input type="text" name="mgr" /></td>
	</tr>
	
	<tr>
		<td> sal</td>
		<td><input type="text" name="sal" /></td>
		<td> comm</td>
		<td><input type="text" name="comm" /></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">deptno</td>
		<td colspan="2" align="center"><input type="text" name="deptno" /></td>
	</tr>
	
	<tr>
		<td colspan="4" align="center">
			<input type="submit" value="만들기" />
		</td>
	</tr>
</table>

</form>
</body>
</html>