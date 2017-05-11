<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="ac.kr.ft.com.dto.UserDTO"%>
<%
	request.setCharacterEncoding("EUC-KR");
	response.setCharacterEncoding("EUC-KR");
	UserDTO userDto = (UserDTO) request.getAttribute("userDto");
	if (userDto == null) {
		userDto = new UserDTO();
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
	//이메일 변경시 값 가져오기(폼객체, 선택한 이메일 값)
	function doAction2(f) {
		//*f는 form 태그 안의 id임*//
		//자바스크립트는 조건문에 연산자 있는거까지 실행됨
		var f = document.getElementById("f");

		if (f.user_id.value == "") {
			alert("아이디를 입력하시길 바랍니다.");
			f.user_id.focus();
			return false;
		}
		

		if (f.password.value == "") {
			alert("비밀번호를 입력하시길 바랍니다");
			f.password.focus();
			return false;
		}
		
		
		if (f.checkpassword.value == "") {
			alert("비밀번호를 입력하시길 바랍니다");
			f.checkpassword.focus();
			return false;
		}
		
		
		if (f.password.value != f.checkpassword.value) {
			alert("비밀번호가 일치하지 않습니다");
			f.checkpassword.focus();
			return false;
		}

		if (f.email1.value == "") {
			alert("이메일을 입력하시길 바랍니다");
			f.email1.focus();
			return false;
		}
		

		if (f.email2.value == "") {
			alert("이메일을 입력하시길 바랍니다");
			f.email1.focus();
			return false;
		}
		

		if (f.tel_1.value == "") {
			alert("전화번호를 입력하시길 바랍니다");
			f.tel_2.focus();
			return false;
		}
		
		if (f.tel_2.value == "") {
			alert("전화번호를 입력하시길 바랍니다");
			f.tel_2.focus();
			return false;
		}
		
		
		if (f.tel_2.value.length != 4) {
			alert("전화번호를 입력하시길 바랍니다");
			f.tel_2.focus();
			return false;
		}

		if (f.tel_3.value == "") {
			alert("전화번호를 입력하시길 바랍니다");
			f.tel_3.focus();
			return false;
		}
		
		
		if (f.tel_3.value.length != 4) {
			alert("전화번호를 입력하시길 바랍니다");
			f.tel_2.focus();
			return false;
		}

		if (f.birthday.value == "") {
			alert("생년월일을 입력하시길 바랍니다");
			f.birthday.focus();
			return false;
		}
		
		
		if (f.birthday.value.length < 6) {
			alert("생년월일을 입력하시길 바랍니다");
			f.birthday.focus();
			return false;
		}
		
		if (f.birthday.value.substr(2,2) < 1 || f.birthday.value.substr(2,2) > 12) { // check month range
			 alert("1~12월 사이로 써주시길 바랍니다");
			 return false;
		}

		if (f.birthday.value.substr(4,2) < 1 || f.birthday.value.substr(4,2) > 31) {
 			alert("1~31일 사이로 써주시길 바랍니다");
 			return false;
		}

 		if ((f.birthday.value.substr(2,2)==4 
			|| f.birthday.value.substr(2,2)==6 
			|| f.birthday.value.substr(2,2)==9 
			|| f.birthday.value.substr(2,2)==11) 
			&& f.birthday.value.substr(4,2)==31) {
 			if(f.birthday.value.substr(2,2)==11){
 				alert(f.birthday.value.substr(2,2)+" 월은 31일이 없습니다");
 			}else{
 				alert(f.birthday.value.substr(3,1)+" 월은 31일이 없습니다");
 			}
 			return false
 		}

 		if (f.birthday.value.substr(2,2) == 2) { // check for february 29th
 			var isleap = (f.birthday.value.substr(0,2) % 4 == 0 
 					&& (f.birthday.value.substr(0,2) % 100 != 0 
 					|| f.birthday.value.substr(0,2) % 400 == 0));
 			if (f.birthday.value.substr(4,2)>29 
 					|| (f.birthday.value.substr(4,2)==29 && !isleap)) {
 			alert("2월은" 
 				+ f.birthday.value.substr(4,2) 
 				+ "이 없습니다");
 			return false;
 			}
 		}
		


		//뜨는 멘트가 똑같으면 나중에 화남(왜냐하면 뭐가 틀린지 모르니)
		return true;
	}
	function doChangeEmail(f, val) {

		//직접 입력을 선택하였다면, 기존 입력된 값을 지운다.
		if (val == "etc") {
			f.email2.value = "";
			f.email2.focus();
			f.email2.readOnly = false;
			f.email2.style.backgroundColor = "";
			//그렇지 않으면, 선택된 값을 입력 받도록 한다.
		} else {
			f.email2.readOnly = true;
			f.email2.value = val;
			f.email2.style.backgroundColor = "#e2e2e2";
		}
	}
	// 길이
	function check(obj_name,max_length) {
		var str = obj_name;
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
		if (blank.test(str.value) == true) {
			alert('공백은 사용할 수 없습니다');
			str.value = "";
			return false;
		}

		var special = /[.`~!@\#$%<>^&*\()\-=+_\’:;]/gi;
		if (special.test(str.value) == true) {
			alert('특수문자는 사용이 불가능합니다');
			str.value = "";
			return false;
		}
		var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/gi;
		if (hangle.test(str.value) == true) {
			alert('한글은 사용이 불가능합니다');
			str.value = "";
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
	
	function birth() {
		var birthday = document.getElementById('birthday');
		
		if(birthday.value.length > 6 ) {
 			alert('생년월일은 6자리수보다 클 수 없습니다');
 			birthday.value = "";
 			return false;
 		}
		
		var blank = /[\s]/gi;
		if (blank.test(birthday.value) == true) {
			alert('공백은 사용할 수 없습니다');
			birthday.value = "";
			return false;
		}

		var special = /[.`~!@\#$%<>^&*\()\-=+_\’:;]/gi;
		if (special.test(birthday.value) == true) {
			alert('특수문자는 사용이 불가능합니다');
			birthday.value = "";
			return;
		}
		
		var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/gi;
		if (hangle.test(birthday.value) == true) {
			alert('한글은 사용이 불가능합니다');
			birthday.value = "";
			return;
		}
		var english = /[A-Z | a-z]/gi; 
		if (english.test(birthday.value) == true) {
			alert('영어는 사용이 불가능합니다');
			birthday.value = "";
			return;
		}

	}
	
	function tel2() {
		var tel_2 = document.getElementById('tel_2');
		
 		if(tel_2.value.length > 4 ) {
 			alert('전화번호는 4자리수보다 클 수 없습니다');
 			tel_2.value = "";
 			return false;
 		}
		var blank = /[\s]/gi;
		if (blank.test(tel_2.value) == true) {
			alert('공백은 사용할 수 없습니다');
			tel_2.value = "";
			return false;
		}

		var special = /[.`~!@\#$%<>^&*\()\-=+_\’:;]/gi;
		if (special.test(tel_2.value) == true) {
			alert('특수문자는 사용이 불가능합니다');
			tel_2.value = "";
			return;
		}
		
		var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/gi;
		if (hangle.test(tel_2.value) == true) {
			alert('한글은 사용이 불가능합니다');
			tel_2.value = "";
			return;
		}
		var english = /[A-Z | a-z]/gi; 
		if (english.test(tel_2.value) == true) {
			alert('영어는 사용이 불가능합니다');
			tel_2.value = "";
			return;
		}
	}
	
	function tel3() {
		var tel_3 = document.getElementById('tel_3');
		
 		if(tel_3.value.length > 4 ) {
 			alert('전화번호는 4자리수보다 클 수 없습니다');
 			tel_3.value = "";
 			return false;
 		}
		var blank = /[\s]/gi;
		if (blank.test(tel_3.value) == true) {
			alert('공백은 사용할 수 없습니다');
			tel_3.value = "";
			return false;
		}

		var special = /[.`~!@\#$%<>^&*\()\-=+_\’:;]/gi;
		if (special.test(tel_3.value) == true) {
			alert('특수문자는 사용이 불가능합니다');
			tel_3.value = "";
			return;
		}
		
		var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/gi;
		if (hangle.test(tel_3.value) == true) {
			alert('한글은 사용이 불가능합니다');
			tel_3.value = "";
			return;
		}
		var english = /[A-Z | a-z]/gi; 
		if (english.test(tel_3.value) == true) {
			alert('영어는 사용이 불가능합니다');
			tel_3.value = "";
			return;
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
		<!-- join -->
		<div class="content" style="display: block;">
			<div class="content_wrapper">
				<header>
					<span>회원상세</span>
				</header>
				<form name="f" id="f" method="post" action="guestUserUpdate.do" onsubmit="return doAction2(this)">
				<input type="hidden" name="user_no" value="<%=CmmUtil.nvl(userDto.getUser_no())%>" />
					<div class="section">
						<!-- group -->
							<div class="input_row" style="background-color: #e2e2e2;">
								<span class="input_box" style="background-color: #e2e2e2;"> <label class="lbl">아이디</label> <input
									type="text" value="<%=CmmUtil.nvl(userDto.getUser_id())%>" id="user_id" name="user_id" placeholder="아이디"
									class="input_email" style="width: 250px; background-color: #e2e2e2;" onkeydown="check(this,20)" readonly />
								</span>
							</div>
							
						<!-- group -->
						<div class="input_row">
							<span class="input_box"> <label class="lbl">비밀번호</label> <input
								type="password" value="<%=CmmUtil.nvl(userDto.getPassword())%>" name="password" id="password" placeholder="비밀번호"
								class="input_area" onkeydown="passwordcheck(this,20)" maxlength="20">
								<h4>비밀번호는 최대 20자이며 대소문자 구별합니다</h4>
							</span>
						</div>
						<div class="input_row">
							<span class="input_box"> <label class="lbl">비밀번호
									확인</label> <input type="password" name="checkpassword"
								id="checkpassword" value="<%=CmmUtil.nvl(userDto.getCheckpassword())%>" onkeydown="checkpasswordcheck(this,20)" placeholder="비밀번호 확인"
								class="input_area" style="width: 250px" maxlength="20">
							</span>
						</div>
						<div class="input_row">
							<span class="input_box"> <label class="lbl">생년월일</label> <input
								type="text" value="<%=CmmUtil.nvl(userDto.getBirthday())%>" placeholder="생년월일" class="input_area" value=""
								 name="birthday" id="birthday" onkeydown="birth()"
								onkeydown="birth()">
							</span>
						</div>
						<div class="input_row" style="background-color: #e2e2e2;">
							<span class="input_box" style="background-color: #e2e2e2;"> <label class="lbl">이름</label> <input
								type="text" value="<%=CmmUtil.nvl(userDto.getUser_name())%>" name="user_name" id="user_name" style="width: 250px; background-color: #e2e2e2;"
								placeholder="이름" class="input_area" onkeydown="namecheck(this,20)">
							</span>
						</div>
						<!-- group -->
						<div class="group">
							<div class="input_row phone">
								<span class="input_box"> <label class="lbl">이메일</label><input
									type="text" value="<%=CmmUtil.nvl(userDto.getEmail1())%>" name="email1" id="email1" maxlength="20" placeholder="이메일"
									class="input_phone" onkeydown="emailcheck(this,20)">
								</span>
							</div>
							<label class='dash'> @ </label>
							<div class="input_row phone">
								<span class="input_box"> <label class="lbl"></label> <input
									type="text" value="<%=CmmUtil.nvl(userDto.getEmail2())%>" name="email2" id="email2" maxlength="20" placeholder=""
									class="input_phone" onkeydown="email2check(this,20)">
								</span>
							</div>
							<label class='dash'> </label>
							<div class="input_select phone"> 
 								<select name="email3" onchange="doChangeEmail(this.form, this.value)"
									> 
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
						<!-- group -->
						<div class="group">
							<div class="input_select phone clear">
								<select name="tel_1" value="<%=CmmUtil.nvl(userDto.getTel_1())%>">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</div>
							<label class='dash'> - </label>
							<div class="input_row phone">
								<span class="input_box"> <label class="lbl">전화번호</label>
									<input type="text" value="<%=CmmUtil.nvl(userDto.getTel_2())%>" placeholder="전화번호" class="input_phone"
									name="tel_2" id="tel_2" maxlength="4"
									onkeydown="tel2()">
								</span>
							</div>
							<label class='dash'> - </label>
							<div class="input_row phone">
								<span class="input_box"> <label class="lbl">전화번호</label>
									<input type="text" value="<%=CmmUtil.nvl(userDto.getTel_3())%>" placeholder="" class="input_phone"
									name="tel_3" id="tel_3" maxlength="4"
									onkeydown="tel3()">
								</span>
							</div>
						</div>
						<!-- group -->
					<div class='content wrapper50'>
						<input type="submit" title="확인" value="확인" class="btn_half left" >
						<input type="button" title="취소" value="취소" class="btn_half left"  onclick="location.href='/appmain.do'">
					</div>
					</div>
				</form>
			</div>
		</div>
		<!-- join -->
		<!-- E: CONTENT -->

		<!-- S: FOOTER -->
		<%@include file="/guestinc/appfooter.jsp"%>
		<!-- E: FOOTER -->
	</div>
	<!-- E: WRAPPER -->
</body>
</html>
