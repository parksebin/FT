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

	if (user_id.length() == 0) {
		msg = "회원정보가 존재하지 않습니다.";

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


<title>비밀번호 변경</title>

<%@include file="/inc/top.jsp"%>

<script type="text/javascript">
	
<%if (msg.length() > 0) {
				out.println("alert('" + msg + "');");
				out.println("location.href='/user/pwfindform.do'");
			}%>
	function doAction(f) {
		var f = document.getElementById("f");
		if (f.password.value == "") {
			alert("비밀번호를 입력하시길 바랍니다");
			f.password.focus();
			return false;
		}

		if (f.checkpassword.value == "") {
			alert("비밀번호를 한번 더 입력하시길 바랍니다");
			f.checkpassword.focus();
			return false;
		}

		if (f.password.value != f.checkpassword.value) {
			alert("비밀번호가 서로 일치하지 않습니다");
			f.password.focus();
			return false;
		}
	}
	
	//비밀번호 체크
	$(function() {
		$('#password').keyup(function() {
			$('font[name=check]').text('');
		}); //#user_pass.keyup

		$('#checkpassword').keyup(function() {
			if ($('#password').val() != $('#checkpassword').val()) {
				$('font[name=checked]').text('');
				$('font[name=checked]').html("암호틀림");
			} else {
				$('font[name=checked]').text('');
				$('font[name=checked]').html("암호맞음");
			}
		}); //#chpass.keyup
	});
</script>

</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">비밀번호 변경</h3>
					</div>
					<div class="panel-body">
						<form role="form" name="f" id="f" action="/user/pwchangeproc.do "
							onsubmit="doAction()" method="post">
							<input type="hidden" name="user_no"
								value="<%=rDTO.getUser_no()%>">

								<div class="form-group">
									<input class="form-control" name="password" id="password"
										type="password" autofocus maxlength="20"> 새비밀번호는 20자
									이하로 해주세요 <font name="checked" size="4" color="red"></font>
									<br/>
									
									 <input
										class="form-control" placeholder="새 비밀번호 확인"
										name="checkpassword" id="checkpassword" type="password"
										autofocus maxlength="20">


								</div>
								<!-- Change this to a button or input when using this as a form -->
								<input type="submit" class="btn btn-lg btn-success btn-block"
									value="변경"><br />
						</form>


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