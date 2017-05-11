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
<!DOCTYPE html>
<html lang="en">
<head>
<title>라오푸드트럭</title>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="/css/style.css?ver=2">
<script type="text/javascript">
	
<%if (msg.length() > 0) {
				out.println("alert('" + msg + "');");
				out.println("location.href='/user/appPwFindForm.do'");
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
		function checkpasswordcheck(obj_name,max_length)
		{
			
			var checkpassword = obj_name;
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
			if (blank.test(checkpassword.value) == true) {
				alert('공백은 사용할 수 없습니다');
				checkpassword.value = "";
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
		<!-- change_pwd -->
		<div class="content" style="display: block;">
			<div class="content_wrapper">
				<header>
					<span>비밀번호 찾기</span>
				</header>
				<form role="form" name="f" id="f" action="/user/apppwchangeproc.do "
					onsubmit="return doAction()" method="post">
					<input type="hidden" name="user_no" value="<%=rDTO.getUser_no()%>">
					<div class='section'>
						<div class="input_row">
							<span class="input_box"> <label class="lbl">새비밀번호</label>
								<input name="password" id="password" type="password"
								placeholder="새비밀번호"  onkeydown="passwordcheck(this,20)" 
								class="input_area" value="" maxlength="20">
							</span>
						</div>
						<div class="input_row">
							<span class="input_box"> <label class="lbl">새비밀번호
									확인</label> <input name="checkpassword" id="checkpassword"
								type="password" autofocus onkeydown="checkpasswordcheck(this,20)" placeholder="새비밀번호 확인"
								class="input_area" value="" maxlength="20">
							</span>
						</div>
						<div class="warnning">비밀번호는 20자 이내로 입력해주세요.</div>
						<input type="submit" title="확인" value="확인" class="btn_global" >
					</div>
				</form>
			</div>
		</div>
		<!-- find_pwd-->
		<!-- E: CONTENT -->

		<!-- S: FOOTER -->
		<%@include file="/guestinc/appfooter.jsp"%>
		<!-- E: FOOTER -->
	</div>
	<!-- E: WRAPPER -->
</body>
</html>
