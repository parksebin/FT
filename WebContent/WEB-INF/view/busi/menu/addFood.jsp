<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>라오푸드트럭</title>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">
    
	<script type="text/javascript">
	
	var SetComma = function(str) {
	
		var regMustNumberComma = /^[\t|0-9|,]+$/;
		str = str.replace(/,/g,'');
		
		var retValue = "";
		
		for( i = 1; i <= str.length; i++ ) {
			if(i>1 && (i%3)== 1){
				retValue = str.charAt(str.length - i) + "," + retValue;
				
			}else{
				retValue = str.charAt(str.length - i) + retValue;
				
			}
		}
		
		if( regMustNumberComma.test(retValue) == false ) {alert("숫자만 입력하실 수 있습니다.");return "";}
		
		return retValue;
	}
	 
	
	//목록 이동
	function doList(){
		location.href="/menu/busiMenuList.do"; 
	}
		
	function doAction() {
		var f = document.getElementById("f");

		if (f.menu_name.value == "") {
			alert("메뉴이름을 입력하시길 바랍니다.");
			f.menu_name.focus();
			return;
		}
		if (f.price.value == "") {
			alert("가격을 입력하시길 바랍니다.");
			f.price.focus();
			return;
		}
		if (f.menu_int.value == "") {
			alert("소개를 입력하시길 바랍니다.");
			f.menu_int.focus();
			return;
		}
		if (f.country_info.value == "") {
			alert("원산지를 입력하시길 바랍니다.");
			f.country_info.focus();
			return;
		}
		if (f.fileGRP.value == "") {
			alert("메뉴 사진을 업로드하시길 바랍니다.");
			return;
		}

		
		if (calBytes(f.menu_name.value) > 30) {
			alert("메뉴이름은 최대 30Bytes까지 입력 가능합니다.");
			f.title.focus();
			return;
		}
		
		if (calBytes(f.price.value) > 7) {
			alert("가격은 100만원 미만까지 입력 가능합니다.");
			f.title.focus(); 
			return;
		}	
		
		if (calBytes(f.menu_int.value) > 4000) {
			alert("내용은 최대 4000Bytes까지 입력 가능합니다.");
			f.title.focus();
			return;
		}
		 if (calBytes(f.menu_name.value) > 30) {
	           alert("메뉴이름은 최대 30Bytes까지 입력 가능합니다.");
	           f.title.focus();
	           return;
	        }


	         if (calBytes(f.price.value) > 7) {
	           alert("가격은 100만원미만까지 입력 가능합니다.");
	           f.contents.focus();
	           return;
	        }    
	         if (calBytes(f.menu_int.value) > 4000) {
	            alert("내용은 최대 4000Bytes까지 입력 가능합니다.");
	            f.contents.focus();
	            return;
	         }   
	         if (calBytes(f.menu_name.value) > 1000) {
	             alert("원산지는 최대 1000Bytes까지 입력 가능합니다.");
	             f.title.focus();
	             return;
	          }
		f.submit();
	}

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

	//파일 업로드
	function doFileUpload() {

		var cw = screen.availWidth; //화면 넓이
		var ch = screen.availHeight; //화면 높이

		var sw = 500; //띄울 창의 넓이
		var sh = 400; //띄울 창의 높이

		var ml = (cw - sw) / 2; //가운데 띄우기위한 창의 x위치
		var mt = (ch - sh) / 2; //가운데 띄우기위한 창의 y위치

		window.open("/file/FileUploadSingPOP.do?jObj=fileGRP", "UPLOAD_POP",
				"width=" + sw + ",height=" + sh + ",top=" + mt + ",left=" + ml
						+ ",resizable=no,scrollbars=yes");
	}
	//이미지 첨부가 완료되면 실행될 함수
	function doUploadOK() {

		alert("doUploadOK");
		var btnImg = document.getElementById("btnImg");

		btnImg.value = "업로드 완료";
		btnImg.disabled;

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
	
</script>
 
<%@include file="/busiinc/apptop.jsp" %>    
</head>
<body>
<!-- S: WRAPPER -->
<div class="wrapper">
    <!-- S: HEADER -->
   <%@include file="/busiinc/appheader.jsp"%>
    <!-- E: HEADER -->

    <!-- S: CONTENT -->
    <%@include file="/busiinc/appmenu.jsp"%>
    <!-- join -->
    
    <form name="f" id="f" method="post" action="/menu/BusiMenuInsert.do">
    
    <div class="content" style="display:block;">
        <div class="content_wrapper">
        	<header><span>메뉴정보</span></header>
			<div class="section">
               <div class="input_row">
					<span class="input_box">
						<label class="lbl" >메뉴이름</label>
						<input type="text" name="menu_name" placeholder="메뉴이름" class="input_area" value=""  maxlength="15" 
                  >
					</span>
				</div>
               <div class="input_row">
					<span class="input_box">
						<label class="lbl" >가격</label>
					 	<input type="text" name="price" maxlength="7" placeholder="가격" class="input_area" value="" onkeyup="this.value=SetComma(this.value)">
					</span>
				</div>
				<div class="group">
					<div class="input_row id_check">
						<span class="input_box">
							<label class="lbl">이미지</label>
						</span>	
					</div>
					<input type="hidden" name="fileGRP" id="fileGRP" /> 
					<input type="button" id="btnImg" value="등록" onclick="doFileUpload()" class="btn_small check white" placeholder="내용"/>
				</div>
				
				
				
				
                <div class="input_content">
					<span class="input_box">
                         <textarea name="menu_int"  maxlength="2000" placeholder="소개"    ></textarea>
					</span>
				</div>

				<div class="input_content">
					<span class="input_box">
                        <textarea name="country_info" maxlength="500" placeholder="원산지"     ></textarea>
					</span>
				</div>
            </div>
        </div>
    </div>
    <div class="content wrapper50">
	    <input type="button" title="등록" value="등록" class="btn_half left" onclick="doAction()">
	    <input type="button" title="목록" value="목록" class="btn_half left" onclick="doList();">
    </div>
    
    </form>
    
    <!-- E: CONTENT -->

    <!-- S: FOOTER -->
    <%@include file="/busiinc/appfooter.jsp"%>
    <!-- E: FOOTER -->
</div>
<!-- E: WRAPPER -->
</body>
</html>
