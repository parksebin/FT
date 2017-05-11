<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script type="text/javascript">
	function doAction(f) {
		//*f는 form 태그 안의 id임*//
		//자바스크립트는 조건문에 연산자 있는거까지 실행됨
		var f = document.getElementById("f");

		if (f.user_id.value == "") {
			alert("아이디를 입력하세요");
			f.user_name.focus();
			return "/user/login.jsp";
		}

		if (f.password.value == "") {
			alert("비밀번호를 입력하세요");
			f.email1.focus();
			return "/user/login.jsp";
		}

		//뜨는 멘트가 똑같으면 나중에 화남(왜냐하면 뭐가 틀린지 모르니)

		f.target = "ifrProc";
		return true;
	}
	
	
	//팝업 띄우기
	function doPopUp(url, w, h) {
		
		var cw=screen.availWidth;     //화면 넓이
		var ch=screen.availHeight;    //화면 높이
		
		var ml=(cw-w)/2;     //가운데 띄우기위한 창의 x위치
		var mt=(ch-h)/2;     //가운데 띄우기위한 창의 y위치
		
		window.open(url, "", "width="+ w +",height="+ h +",top="+ mt +",left="+ ml +",resizable=no,scrollbars=yes");
	}
	
</script>

<title>SB Admin 2 - Bootstrap Admin Theme</title>

<!-- Bootstrap Core CSS -->
<link href="../bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="../dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>

<body>

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">로그인해주세요</h3>
					</div>
					<div class="panel-body">
						<form name="f" id="f" action="/user/loginproc.do" method="post">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="아이디" name="user_id"
										type="text" autofocus maxlength="20">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="비밀번호"
										name="password" type="password" value="" maxlength="20">
								</div>

								<div class="form-group" align="right">
									계정이 없으신가요? <a href="javascript:doPopUp('/user/userinsertForm.do', 650, 660);"><b>회원가입</b></a>
								</div>
								<div class="form-group" align="right">
									 <a href="javascript:doPopUp('/user/idfindform.do', 400, 370);"><b>아이디 찾기</b></a>
									 &nbsp;
									 <a href="javascript:doPopUp('/user/pwfindform.do', 400, 430);"><b>비밀번호 찾기</b></a>
								</div>
								
								<!--  <div class="checkbox">
									<label> <input name="remember" type="checkbox"
										value="Remember Me">Remember Me
									</label>
								</div> -->

								<!-- Change this to a button or input when using this as a form -->
								<input type="submit" class="btn btn-lg btn-success btn-block"
									value="로그인"><br /> 
							</fieldset>
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
