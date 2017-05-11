<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>라오푸드트럭</title>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="/css/style.css?ver=2">
<script type="text/javascript">
	function doAction(f) {
		//*f는 form 태그 안의 id임*//
		//자바스크립트는 조건문에 연산자 있는거까지 실행됨
		var f = document.getElementById("f");

		if (f.user_id.value == "") {
			alert("아이디를 입력하세요");
			f.user_name.focus();
			return false;
		}

		if (f.password.value == "") {
			alert("비밀번호를 입력하세요");
			f.email1.focus();
			return false;
		}

		//뜨는 멘트가 똑같으면 나중에 화남(왜냐하면 뭐가 틀린지 모르니)

	}
</script>
<%@include file="/guestinc/apptop.jsp"%>
</head>
<body>
	<!-- S: WRAPPER -->
	<div class="wrapper">
		<!-- S: HEADER -->
		<%@include file="/guestinc/appheader.jsp"%>
		<!-- E: HEADER -->
		<%@include file="/guestinc/appmenu.jsp"%>
		<!-- S: CONTENT -->
		<!-- login -->
		<div class="content login" style='display: block;'>
			<div class="content_wrapper">
				<header>
					<span>로그인</span>
				</header>
				<form name="f" id="f" action="/user/appLoginproc.do" method="post">
					<div class='section'>
						<div class="input_row">
							<span class="input_box"> <label class="lbl">아이디</label> <input
								type="text" placeholder="아이디" name="user_id" class="input_area"
								value="" maxlength="20">
							</span>
						</div>

						<div class="input_row">
							<span class="input_box"> <label class="lbl">비밀번호</label>
								<input type="password" placeholder="비밀번호" name="password"
								class="input_area" value="" maxlength="20">
							</span>
						</div>
						<input type="submit" title="로그인" value="로그인" class="btn_global">
						<div class="sub">
							<a href="/user/appIdFindForm.do">아이디 찾기</a> <span>|</span> <a
								href="/user/appPwFindForm.do">비밀번호 찾기</a> <span>|</span> <a
								href="/user/guestUserInsertForm.do">회원가입</a>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- login -->
		<!-- E: CONTENT -->

		<!-- S: FOOTER -->
		<%@include file="/guestinc/appfooter.jsp"%>
		<!-- E: FOOTER -->
	</div>
	<!-- E: WRAPPER -->
</body>
</html>
