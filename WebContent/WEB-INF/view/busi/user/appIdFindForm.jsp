<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
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

		if (f.user_name.value == "") {
			alert("이름을 입력하시길 바랍니다.");
			f.user_name.focus();
			return false;
		}
		
		if (f.email1.value == "") {
			alert("이메일을 입력하시길 바랍니다.");
			f.email1.focus();
			return false;
		}
		
		if (f.email2.value == "") {
			alert("이메일을 입력하시길 바랍니다.");
			f.email2.focus();
			return false;
		}
	}
	function namecheck(obj_name,max_length)
	{
		
		var name = obj_name;
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
		if (blank.test(name.value) == true) {
			alert('공백은 사용할 수 없습니다');
			name.value = "";
			return false;
		}
	
		var special = /[.`~!@\#$%<>^&*\()\-=+_\’:;]/gi;
		if (special.test(name.value) == true) {
			alert('특수문자는 사용이 불가능합니다');
			name.value = "";
			return false;
		}
 		var num_regx=/\d/gi; //\d은 [0-9]와 같음
 		if(num_regx.test(name.value) == true) {
 			alert('숫자는 사용이 불가능합니다');
 			name.value = "";
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
	function emailcheck(obj_name,max_length) {
		var email1 = obj_name;
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
		if (blank.test(email1.value) == true) {
			alert('공백은 사용할 수 없습니다');
			email1.value = "";
			return false;
		}

		var special = /[.`~!@\#$%<>^&*\()\-=+_\’:;]/gi;
		if (special.test(email1.value) == true) {
			alert('특수문자는 사용이 불가능합니다');
			email1.value = "";
			return;
		}
		
		var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/gi;
		if (hangle.test(email1.value) == true) {
			alert('한글은 사용이 불가능합니다');
			email1.value = "";
			return;
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
	
	function email2check(obj_name,max_length) {
		var email2 = obj_name;
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
		if (blank.test(email2.value) == true) {
			alert('공백은 사용할 수 없습니다');
			email2.value = "";
			return false;
		}

		var special = /[`~!@\#$%<>^&*\()\-=+_\’:;]/gi;
		if (special.test(email2.value) == true) {
			alert('특수문자는 사용이 불가능합니다');
			email2.value = "";
			return;
		}
		
		var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/gi;
		if (hangle.test(email2.value) == true) {
			alert('한글은 사용이 불가능합니다');
			email2.value = "";
			return;
		}
		
		var number =/[0-9]/gi;
		if (number.test(email2.value) == true) {
			alert('숫자는 사용이 불가능합니다');
			email2.value = "";
			return;
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
	//이메일 변경시 값 가져오기(폼객체, 선택한 이메일 값)
	function doChangeEmail(f, val) {

		//직접 입력을 선택하였다면, 기존 입력된 값을 지운다.
		if (val == "etc") {
			f.email2.value = "";
			f.email2.focus();
			f.email2.readOnly = false;

			f.email2.style.backgroundColor = "";

			//그렇지 않으면, 선택된 값을 입력 받도록 한다.
		} else {
			f.email2.value = val;
			f.email2.readOnly = true;
		}

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
		<!-- find_id -->
		<div class="content find_id" style="display: block;">
			<div class="content_wrapper">
				<header>
					<span>아이디 찾기</span>
				</header>
				<form name="f" id="f" action="/user/appIdFindProc.do" method="post"
					onsubmit="return doAction(this)">
					<div class='section'>
						<div class="input_row">
							<span class="input_box"> <label class="lbl">이름</label> <input
								type="text" placeholder="이름" class="input_area" name="user_name"
								value="" onkeydown="namecheck(this,20)" maxlength="20">
							</span>
						</div>
						<!-- group -->
						<div class="group">
							<div class="input_row phone">
								<span class="input_box"> <label class="lbl">이메일</label><input
									type="text" name="email1" onkeydown="emailcheck(this,20)"  placeholder="이메일"
									class="input_phone" value="" maxlength="20">
								</span>
							</div>
							<label class='dash'> @ </label>
							<div class="input_row phone">
								<span class="input_box"> <label class="lbl"></label> <input
									type="text" name="email2"  placeholder=""
									class="input_phone" value="" onkeydown="email2check(this,20)" maxlength="20">
								</span>
							</div>
							<label class='dash'> </label>
							<div class="input_select phone">
								<select name="email3" onchange="doChangeEmail(this.form, this.value)">
									<option value="etc">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="empal.com">empal.com</option>
									<option value="hanafos.com">hanafos.com</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="paran.com">paran.com</option>
									<option value="korea.com">korea.com</option>
									<option value="freechal.com">freechal.com</option>
								</select>
							</div>
						</div>
						<!-- group -->
						<input type="submit" title="확인" value="확인" class="btn_global">
					</div>
				</form>
			</div>
		</div>
		<!-- E: CONTENT -->

		<!-- S: FOOTER -->
		<%@include file="/guestinc/appfooter.jsp"%>
		<!-- E: FOOTER -->
	</div>
	<!-- E: WRAPPER -->
</body>
</html>
