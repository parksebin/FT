<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="ac.kr.ft.com.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	response.setCharacterEncoding("EUC-KR");
	UserDTO userDto = (UserDTO) request.getAttribute("userDto");
	if (userDto == null) {
		userDto = new UserDTO();
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
	
	function doChangeEmail2(f, val) {

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
	function doKeyOnlyNumber(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.KeyCode;

		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 9) {
			return true;
		} else {
			return false;
		}

	}
</script>

<title>회원정보 수정</title>
</head>
<body>

	<%@include file="/inc/menu.jsp"%>
	<div id="wrapper">


		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">회원정보 수정</h3>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<%=CmmUtil.nvl(userDto.getUser_name())%>님의 회원정보 수정
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">


								<form name="f" id="f" method="post" action="userupdate.do" onsubmit="return doAction2(this)">
									<input type="hidden" name="user_no" value="<%=CmmUtil.nvl(userDto.getUser_no())%>" />


									<table class="table table-striped table-bordered table-hover" id="dataTables-example">

										<tbody>
											<tr>
												<td width="90px"><b>아이디</b></td>
												<td><input type="text" name="user_id" value="<%=CmmUtil.nvl(userDto.getUser_id())%>" onkeydown="check(this,20)" readOnly style="background-color: #e2e2e2;">아이디는
													변경 불가입니다</td>


											</tr>

											<tr>
												<td style="width: 300px"><b>패스워드</b></td>
												<td><input type="text" name="password" value="<%=CmmUtil.nvl(userDto.getPassword())%>" 
												onkeydown="passwordcheck(this,20)" style="width: 250px" maxlength="20"></td>
											</tr>
											
											<tr>
												<td style="width: 300px"><b>패스워드 확인</b></td>
												<td><input type="text" name="checkpassword" value="<%=CmmUtil.nvl(userDto.getCheckpassword())%>" 
												onkeydown="checkpasswordcheck(this,20)" style="width: 250px" maxlength="20"></td>
											</tr>
											<tr>
												<td><b>이름</b></td>
												<td><input type="text" name="user_name" value="<%=CmmUtil.nvl(userDto.getUser_name())%>" 
												onkeydown="check(this,20)" readOnly style="background-color: #e2e2e2;">
													이름은 변경 불가입니다</td>
											</tr>
											<tr>
												<td><b>이메일</b></td>
												
												<td colspan="3">
												<input type="text" name="email1" value="<%=CmmUtil.nvl(userDto.getEmail1())%>" style="width: 100px" onkeydown="emailcheck(this,20)" maxlength="20"/>@ 
												<input type="text" name="email2"  value="<%=CmmUtil.nvl(userDto.getEmail2())%>" style="width: 100px" onkeydown="email2check(this,20)" style="width: 250px" maxlength="20">
													<select name="email3" onchange="doChangeEmail2(this.form, this.value)" style="display:; width: 100px" style="width: 250px">
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
												</td>



											</tr>

											<tr>
												<td><b>전화번호</b></td>
												<td colspan="3"><select name="tel_1"
													value="<%=CmmUtil.nvl(userDto.getTel_1())%>" style="width: 60px">
														<option value="010">010</option>
														<option value="011">011</option>
														<option value="016">016</option>
														<option value="016">017</option>
														<option value="016">018</option>
														<option value="019">019</option>
												</select> 
												-<input type="text" id="tel_2" name="tel_2" value="<%=CmmUtil.nvl(userDto.getTel_2())%>" onkeydown="tel2()" style="width: 60px" maxlength="4"/> 
												-<input type="text" id="tel_3" name="tel_3" value="<%=CmmUtil.nvl(userDto.getTel_3())%>" onkeydown="tel3()" style="width: 60px" maxlength="4"/>
												
												</td>

											</tr>

											<tr>
												<td><b>생년월일</b></td>
												<td><input type="text" id="birthday"name="birthday" value="<%=CmmUtil.nvl(userDto.getBirthday())%>" onkeydown="birth()" maxlength="6">ex)1998년생 2월 14일이면 980214</td>
											</tr>

										</tbody>
									</table>

									<p align="right">
										<input type="submit" value="확인" class="btn btn-outline btn-success"> 
										<input type=button value="취소" class="btn btn-outline btn-danger" onclick="location.href='userlist.do'" />
									</p>
								</form>
							</div>

						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->



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