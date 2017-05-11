<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.CtrDTO"%>
<%@page import="java.util.List"%>    

<!DOCTYPE html>
<html lang="en">
<head>
    <title>라오푸드트럭</title>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">
<script type="text/javascript">
		function doAction() {
//*f는 form 태그 안의 id임*//
			var f = document.getElementById("f");
			
			if (f.title.value==""){alert("제목을 입력하시길 바랍니다.");f.title.focus();return;}
			if (f.people.value==""){alert("예상인원을 입력하시길 바랍니다.");f.people.focus();return;}
			if (f.place.value==""){alert("장소를 입력하시길 바랍니다.");f.place.focus();return;}
			if (f.user_name.value==""){alert("이름을 입력하시길 바랍니다.");f.user_name.focus();return;}
			if (f.tel_1.value==""){alert("핸드폰 번호를 입력하시길 바랍니다.");f.tel_1.focus();return;}
			if (f.tel_2.value==""){alert("핸드폰 번호를 입력하시길 바랍니다.");f.tel_2.focus();return;}
			if (f.tel_3.value==""){alert("핸드폰 번호를 입력하시길 바랍니다.");f.tel_3.focus();return;}
			if (f.contents.value==""){alert("내용을 입력하시길 바랍니다.");f.contents.focus();return;}
			
			if (calBytes(f.title.value) > 100) {
				alert("제목은 최대 100Bytes까지 입력 가능합니다.");
				f.title.focus();
				return;
			}
			
			if (calBytes(f.place.value) > 100) {
				alert("장소는 최대 100Bytes까지 입력 가능합니다.");
				f.title.focus();
				return;
			}	
			
			if (calBytes(f.user_name.value) > 20) {
				alert("이름은 최대 20Bytes까지 입력 가능합니다.");
				f.title.focus();
				return;
			}

		 	if (calBytes(f.contents.value) > 4000) {
				alert("내용은 최대 4,000Bytes까지 입력 가능합니다.");
				f.contents.focus();
				return;
			}   
		 //f.target = "ifrProc";
		 f.submit();
		}
			
	/*10.06 		if (chkRadio()==false){
				alert("공지여부를 체크하시길 바랍니다.");
				f.ctr_yn[0].focus();
				return false;
			} */

		/* 	 if (f.contents.value==""){alert("내용을 입력하시길 바랍니다.");f.contents.focus();return;}
			alert("1");

			if (calBytes(f.contents.value) > 4000) {
				alert("내용은 최대 4,000Bytes까지 입력 가능합니다.");
				f.contents.focus();
				return;
			}
			alert("2");			
			f.target = "ifrProc";
			
			alert("3");
			f.submit(); */
		
		
/*10.06 		//이메일 변경시 값 가져오기(폼객체, 선택한 이메일 값)
		function doChangeEmail(f, val){
			
			//직접 입력을 선택하였다면, 기존 입력된 값을 지운다.
			if (val=="etc"){
				f.email2.value = "";
				f.email2.focus();
				
			//그렇지 않으면, 선택된 값을 입력 받도록 한다.
			}else{
				f.email2.value = val;
				
			}
			
		} */
		
/* 10.06			 //공지사항 체크 여부 확인
		function chkRadioCtrYn(){
			var ctrYn = document.f.getElementsByName('ctr_yn') ; //라디오 객체 가져오기
			var res = false; //반환할 결과값(선택되었으면 true, 선택안되면 false)
			
			//라디오 버튼 객체수만큼 반복문 돌리기
			for (var i=0;i<ctrYn.length;i++){
				
				//라디오 버튼이 체크되었다면..
				if (ctrYn[i].checked){
					res = true;
				}
			}
			
			return res;
		}
		
		function chkRadio() {
			var ctr_yn = document.getElementById('ctr_yn');
			var res = false;

			for(var i=0;i<ctr_yn.length;i++){
				if(ctr_yn.checked){
					res=true;
				}
			}
			return res;
		} */
		
		 var SetComma = function(str) {

		       var regMustNumberComma = /^[\t|0-9|,]+$/;
		       str = str.replace(/,/g,'');

		       var retValue = "";
		           for( i = 1; i <= str.length; i++ ) {
		               if( i > 1 && (i%3) == 1 )
		                   retValue = str.charAt(str.length - i) + "," + retValue;
		               else
		                   retValue = str.charAt(str.length - i) + retValue;
		           }
		        
		           if( regMustNumberComma.test(retValue) == false ) {
		               alert("숫자만 입력하실 수 있습니다.");
		               return "";
		           }
		           return retValue;

		   }


		   var SetComma1 = function(str) {

		       var regMustNumberComma = /^[\t|0-9]+$/;
		       str = str.replace(/,/g,'');

		       var retValue = "";
		           for( i = 1; i <= str.length; i++ ) {
		               if( i > 1 && (i%3) == 1 )
		                   retValue = str.charAt(str.length - i) + retValue;
		               else
		                   retValue = str.charAt(str.length - i) + retValue;
		           }
		        
		           if( regMustNumberComma.test(retValue) == false ) {
		               alert("숫자만 입력하실 수 있습니다.");
		               return "";
		           }
		           return retValue;

		   }
		   
		function doKeyOnlyNumber(event) {
			
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.KeyCode;
			if((keyID >= 48 && keyID <= 57) || (keyID>=96 && keyID <=105) || keyID==8 || keyID==9 ){
		
				return true;
				
			}else{
				
				return false;
			}
		}
		
		//글자 길이 바이트 단위로 체크하기(바이트값 전달)
		function calBytes(str) {
			
			var tcount = 0;
			var tmpStr = new String(str);
			var strCnt = tmpStr.length;

			var onechar;
			for (i = 0; i < strCnt; i++) {
				onechar = tmpStr.charAt(i);
				if (escape(onechar).length > 4) {
					tcount += 2;
				} else {
					tcount += 1;
				}
			}
			return tcount;
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
    <div class="content" style="display:block;">
        <div class="content_wrapper">
        	<header><span>케이터링 예약</span></header>
        	
        	<form name="f" id="f" method="post" action="/ctr/GuestctrReg.do" >
        	
        	<!--  디자인 다시 짜야함 공지여부,내용 필요 -->
        	
			<div class="section">
        	
        	
        	  	<div class="input_row">
					<span class="input_box">
						<label class="lbl" >제목</label>
						<!-- <input type="text" placeholder="이름" class="input_area" value=""> -->
						<input type="text" name="title" maxlength="100" class="input_area" placeholder="제목"/>
					</span>
				</div>

	            <div class="input_row">
					<span class="input_box">
						<label class="lbl" >예상인원</label>
						<!-- <input type="number" placeholder="예상인원" class="input_area" value=""> -->
						<input type="text" name="people" maxlength="4"  onkeyup="this.value=SetComma(this.value)" class="input_area" placeholder="예상인원" onkeydown="return doKeyOnlyNumber(event);"/>			
					</span>
				</div>
				
                <div class="input_row">
					<span class="input_box">
						<label class="lbl" >장소</label>
						<!-- <input type="text" placeholder="장소" class="input_area" value=""> -->
						<input type="text" name="place"  maxlength="100" class="input_area" placeholder="장소"/>					
					</span>
				</div>
				
                <!-- group -->
<!-- 				<div class="group" style='display:block;height:40px;' > -->
				<div class="input_row">
					<span class="input_box">
						<label class="lbl" >이름</label>
						<!-- <input type="text" placeholder="이름" class="input_area" value=""> -->
						<input type="text" name="user_name" maxlength="20" class="input_area" placeholder="이름"/>
					</span>
				</div>

					<div class="input_select phone">
			
						<select name="tel_1">
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
						<span class="input_box">
							<label class="lbl" >전화번호2</label>
							<!-- <input type="number" placeholder="전화번호" class="input_phone" value=""> -->
							<input type="text" name="tel_2" onkeyup="this.value=SetComma1(this.value)" maxlength="4" class="input_phone" />
						</span>
					</div>
					
					<label class='dash'> - </label>
					
					<div class="input_row phone">
						<span class="input_box">
							<label class="lbl" >전화번호3</label>
							<!-- <input type="number" placeholder="" class="input_phone" value=""> -->
							<input type="text" name="tel_3" onkeyup="this.value=SetComma1(this.value)" maxlength="4" class="input_phone" />
						</span>	
					</div> <br/><br/><br/>
					
			<!-- 		<select class="only" name="ctr_yn">
                	    <option value="1">공지여부 예</option>
					   	<option value="2" selected>공지여부 아니오</option>
                    </select> -->
					
			<div class="input_content">
               <span class="input_box">
                        <textarea name="contents" placeholder="내용"></textarea>
               </span>
            </div>
            
				</div>
				
	<div class="content wrapper50">
	    <!-- <input type="submit" title="확인" value="확인" class="btn_half left">
	    <input type="submit" title="취소" value="취소" class="btn_half left">-->
    	<input type="button" value="등록" onclick="doAction()" class="btn_half left"/>
		<input type="button" value="목록" onclick="location.href='/ctr/GuestctrList.do'" class="btn_half left"/>
    </div>
			
                <!-- group -->
            </div>
        </div>
    </div>
</form>
   
    <!-- E: CONTENT -->
    <!-- S: FOOTER -->
     		<%@include file="/guestinc/appfooter.jsp"%>

    <!-- E: FOOTER -->
</div>
<!-- E: WRAPPER -->
</body>
</html>

    