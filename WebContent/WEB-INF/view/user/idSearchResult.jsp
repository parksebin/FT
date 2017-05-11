<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%@ page import="ac.kr.ft.com.dto.UserDTO"%>	
<%
UserDTO rDTO = (UserDTO) request.getAttribute("rDTO");
if (rDTO == null) {
	rDTO = new UserDTO();
}

String user_name = CmmUtil.nvl(rDTO.getUser_name()); //이름
String user_id = CmmUtil.nvl(rDTO.getUser_id()); //아이디
String msg = ""; //결과 보여줄 변수

if (user_id.length()==0){
	msg = "아이디가 존재하지 않습니다.";
}

%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<title>아이디찾기</title>

<%@include file="/inc/top.jsp"%>

<script type="text/javascript">
<%
if (msg.length()>0){
	out.println("alert('"+ msg +"');");
	out.println("location.href='/user/idfindform.do'");
}
%>
</script>

</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class=" panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">로그인해주세요</h3>
					</div>
					<div class="panel-body">
						<fieldset>
							<div class="form-group" align="center"><%=CmmUtil.nvl(rDTO.getUser_id()) %>님의아이디는</div>
							<br />
							<div class="form-group" align="center"><%=CmmUtil.nvl(rDTO.getUser_name()) %>입니다</div>

							<div class="form-group" align="right">
								<a href="javascript:window.close();"><b>확인</b></a>
							</div>
							<div class="form-group" align="right">
								<b>혹시 비밀번호도 찾으시나요?</b><a href="/user/pwfindform.do"> <br />
								<b>비밀번호 찾기</b></a>
							</div>
						</fieldset>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="../bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>