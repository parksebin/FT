<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="ac.kr.ft.com.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	response.setCharacterEncoding("EUC-KR");
	UserDTO pwDto = (UserDTO) request.getAttribute("pwDto");
	if (pwDto == null) {
		pwDto = new UserDTO();
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/inc/top.jsp"%>

<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<script type="text/javascript">
function doAction(f) {
	var f = document.getElementById("f");
	if (f.password.value == "") {
		alert("비밀번호를 입력하시길 바랍니다");
		f.password.focus();
		return false;
	}
	

}
	function passwordcheck(obj_name,max_length)
	{
		
		var password = obj_name;
	   var ls_str     = obj_name.value; // 이벤트가 일어난 컨트롤의 value 값
	   var li_str_len = ls_str.length;  // 전체길이
	   // 변수초기화
	   var li_max      = max_length; // 제한할 글자수 크기
	   var i           = 0;  // for문에 사용
	   var li_byte     = 0;  // 한글일경우는 2 그밗에는 1을 더함
	   var li_len      = 0;  // substring하기 위해서 사용
	   var ls_one_char = ""; // 한글자씩 검사한다
	   var ls_str2     = ""; // 글자수를 초과하면 제한할수 글자전까지만 보여준다.
	   
	   
	   var blank = /[\s]/gi;
		if (blank.test(password.value) == true) {
			alert('공백은 사용할 수 없습니다');
			password.value = "";
			return false;
		}
	
	   
	   for(i=0; i< li_str_len; i++)
	   {
	      // 한글자추출
	      ls_one_char = ls_str.charAt(i);
	      // 한글이면 2를 더한다.
	      if (escape(ls_one_char).length > 4)
	      {
	         li_byte = li_byte+2;
	      }
	      // 그외의 경우는 1을 더한다.
	      else
	      {
	         li_byte++;
	      }
	      // 전체 크기가 li_max를 넘지않으면
	      if(li_byte <= li_max)
	      {
	         li_len = i + 1;
	      }
	   }   
	   
	   // 전체길이를 초과하면
	   if(li_byte > li_max)
	   {
	      alert( li_max + " Bytes를 초과 입력할수 없습니다.");
	      ls_str2 = ls_str.substr(0, li_len);
	      obj_name.value = ls_str2; 
	   }
	   obj_name.focus();   
	}
	
	
	
	function cal_length(val)
	{
	  // 입력받은 문자열을 escape() 를 이용하여 변환한다.
	  // 변환한 문자열 중 유니코드(한글 등)는 공통적으로 %uxxxx로 변환된다.
	  var temp_estr = escape(val);
	  var s_index   = 0;
	  var e_index   = 0;
	  var temp_str  = "";
	  var cnt       = 0;

	  // 문자열 중에서 유니코드를 찾아 제거하면서 갯수를 센다.
	  while ((e_index = temp_estr.indexOf("%u", s_index)) >= 0)  // 제거할 문자열이 존재한다면
	  {
	    temp_str += temp_estr.substring(s_index, e_index);
	    s_index = e_index + 6;
	    cnt ++;
	  }

	  temp_str += temp_estr.substring(s_index);

	  temp_str = unescape(temp_str);  // 원래 문자열로 바꾼다.

	  // 유니코드는 2바이트 씩 계산하고 나머지는 1바이트씩 계산한다.
	  return ((cnt * 2) + temp_str.length) + "";
	}
</script>

<title>회원정보 수정</title>
</head>
<body>

	<%@include file="/inc/menu.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">로그인해주세요</h3>
					</div>
					<div class="panel-body">
						<form role="form" name="f" id="f" action="/user/pwchangeproc.do"
							method="post">
							<input type="hidden" name="user_no"
								value="<%=pwDto.getUser_no()%>">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="새 비밀번호" maxlength="20"
										name="password" type="text" autofocus onkeydown="passwordcheck(this,20)" >
									새비밀번호는 20자 이하로 해주세요
								</div>
								<!-- Change this to a button or input when using this as a form -->
								<input type="button" class="btn btn-lg btn-success btn-block" onclick="doAction()"
									value="변경"><br />
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

	<!-- DataTables JavaScript -->
	<script
		src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
	<script
		src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
	<script
		src="../bower_components/datatables-responsive/js/dataTables.responsive.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../dist/js/sb-admin-2.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>

</body>
</html>