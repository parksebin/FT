<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="ac.kr.ft.com.dto.MenuInfoDTO"%>
<%@ page import="java.util.List"%>  
<%@ page import="ac.kr.ft.com.dto.MenuComDTO"%>
<%
	
	MenuInfoDTO menuinfoDto = (MenuInfoDTO) request.getAttribute("menuinfoDto");

	if (menuinfoDto == null) {
		menuinfoDto = new MenuInfoDTO();
	}
	List<MenuComDTO> cList = menuinfoDto.getrList();

	if (cList == null) {
		cList = new ArrayList<MenuComDTO>();
	}

	String login = (String)request.getSession().getAttribute("USER_NO");
	if (login == null){
		login = "";
	}


%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>라오푸드트럭</title>
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">
	<script src="/bower_components/jquery/dist/jquery.min.js"></script>

<script type="text/javascript">


var commentSaveType = "A"; //댓글 저정 방법(A:댓글 쓰기, B:댓글 수정)

/*
#######################################################
#	댓글 더보기 변수 시작	
#######################################################
*/
var viewSize = 5; //한번에 보여줄 댓글 갯수
var curViewSize = 0; //현재 댓글 갯수
var varCommentListCnt = 0; //댓글 총 갯수

//보여줄 댓글 내용(계속 이어서 덮어씀)
var tag = "";
var login = "<%=login %>";
/*
#######################################################
#	댓글 더보기 변수 끝
#######################################################
*/


//로딩시 자동실행
function doOnload(){
	doCommList();
	
}


//페이지 변수 초기화(댓글 수정, 삭제시 초기화 수행=>무조건 처음으로 조회)
function doCommentPageInit(){
	var viewSize = 5; //한번에 보여줄 댓글 갯수
	var curViewSize = 0; //현재 댓글 갯수
	var varCommentListCnt = 0; //댓글 총 갯수		
	
}



//ajax 호출(댓글 호출)
function xmlHttpPost(actionUrl, submitParameter, resultFunction) {
	
	var xmlHttpRequest = false;
	

	//IE인경우
	if (window.ActiveXObject) {
		xmlHttpRequest = new ActiveXObject('Microsoft.XMLHTTP');
	} else {
		xmlHttpRequest = new XMLHttpRequest();
		xmlHttpRequest.overrideMimeType('text/xml');
	}

	xmlHttpRequest.open('POST', actionUrl, true);
	xmlHttpRequest.setRequestHeader('Content-Type',
			'application/x-www-form-urlencoded');
	xmlHttpRequest.onreadystatechange = function() {
		if (xmlHttpRequest.readyState == 4) {
			switch (xmlHttpRequest.status) {
			case 404:
				alert('오류: ' + actionUrl + '이 존재하지 않음');
				break;
			case 500:
				alert('오류: ' + xmlHttpRequest.responseText);
				break;
			default:
				eval(resultFunction + '(xmlHttpRequest.responseText);');
				break;
			}
		}
	}

	xmlHttpRequest.send(submitParameter);
}


//댓글 리스트 조회하기
function doCommList(){
	xmlHttpPost("/menu/userCommentList.do", "menu_seq=<%=CmmUtil.nvl(menuinfoDto.getMenu_seq())%>", "viewResult");
	
}

//댓글 리스트 조회 후처리
function viewResult(result) {
	
	var jsonObj = eval("("+ result+")");
	tag = "";
 	

	//배열수만큼 반복하기
	for (var i=0;i<jsonObj.list.length;i++){
       
		if(login == jsonObj.list[i].USER_NO){	
			 
			tag +="<li>";
			tag +="  <div class=\"reply_detail\">";
			tag +="  <div class=\"head\">";
			tag +="    <span class='name'>"+ jsonObj.list[i].REG_DT +"</span>";
			tag +="    <span class='date'> |"+ jsonObj.list[i].USER_NAME +"</span>";
			tag +=" 	</div>";
			tag +="  "+ jsonObj.list[i].CONTENTS +" ";
			tag +="  <div class=\"view_modify btn_wrap\">";
			tag +="  	<input type=\"button\" value=\"수정\" onclick=\"doCommentUpdateView('"+ jsonObj.list[i].COM_SEQ +"', '"+ jsonObj.list[i].CONTENTS +"')\"  class=\"btn_modify\">";
			tag +="   	<input type=\"button\" value=\"삭제\" onclick=\"doCommentDelete('"+ jsonObj.list[i].COM_SEQ +"')\"  class=\"btn_delete\">";
			tag +="  </div>";
			tag +="</div>";
			tag +="</li>";
		
		}else{
			tag +="<li>";
			tag +="  <div class=\"reply_detail\">";
			tag +="  <div class=\"head\">";
			tag +="    <span class='name'>"+ jsonObj.list[i].REG_DT +"</span>";
			tag +="    <span class='date'> |"+ jsonObj.list[i].USER_NAME +"</span>";
			tag +=" 	</div>";
			tag +="  "+ jsonObj.list[i].CONTENTS +" ";
			tag +="  <div class=\"view_modify btn_wrap\">";
			tag +="  </div>";
			tag +="</div>";
			tag +="</li>";
       } 
		
		
		
	}
	
	$("#replyListArea").html(tag);
	
	//댓글 수 넣어주기
	$("#commentListCnt").html(jsonObj.listCnt);
	varCommentListCnt = jsonObj.listCnt;
	
	curViewSize = jsonObj.list.length; //현재 댓글 갯수 업데이트
	
	displayBtnMoreView();
	
}

//댓글 더보기 조회 후처리
function viewResultMoreView(result) {
	var jsonObj = eval("("+ result+")");
	
	//alert(tag);
	//배열수만큼 반복하기
	
		
      
		
		
	for (var i=0;i<jsonObj.list.length;i++){
		if(login == jsonObj.list[i].USER_NO){
	
			tag +="<li>";
			tag +="  <div class=\"reply_detail\">";
			tag +="  <div class=\"head\">";
			tag +="    <span class='name'>"+ jsonObj.list[i].REG_DT +"</span>";
			tag +="    <span class='date'> |"+ jsonObj.list[i].USER_NAME +"</span>";
			tag +=" 	</div>";
			tag +="  "+ jsonObj.list[i].CONTENTS +" ";
			tag +="  <div class=\"view_modify btn_wrap\">";
			tag +="  	<input type=\"button\" value=\"수정\" onclick=\"doCommentUpdateView('"+ jsonObj.list[i].COM_SEQ +"', '"+ jsonObj.list[i].CONTENTS +"')\"  class=\"btn_modify\">";
			tag +="   	<input type=\"button\" value=\"삭제\" onclick=\"doCommentDelete('"+ jsonObj.list[i].COM_SEQ +"')\"  class=\"btn_delete\">";
			tag +="  </div>";
			tag +="</div>";
			tag +="</li>";
					
		}else{
		
			tag +="<li>";
			tag +="  <div class=\"reply_detail\">";
			tag +="  <div class=\"head\">";
			tag +="    <span class='name'>"+ jsonObj.list[i].REG_DT +"</span>";
			tag +="    <span class='date'> |"+ jsonObj.list[i].USER_NAME +"</span>";
			tag +="  </div>";
			tag +="  "+ jsonObj.list[i].CONTENTS +" ";
			tag +="  <div class=\"view_modify btn_wrap\">";
			tag +="  </div>";
			tag +="</div>";
			tag +="</li>";
			    
		} 
		
		
		}
	
	
	$("#replyListArea").html(tag);
	
	//댓글 수 넣어주기
	$("#commentListCnt").html(jsonObj.listCnt);
	varCommentListCnt = jsonObj.listCnt;
	
	curViewSize += jsonObj.list.length; //현재 댓글 갯수 업데이트
	
	displayBtnMoreView();
	
}


//댓글 저장하기
function saveComment() {
	
	var f = document.getElementById("form2");
	
	if (f.contents.value == "") {
	   alert("내용을 입력하시기 바랍니다.");
	   f.contents.focus();
	   return false;
	}
	
	var actionUrl = ""; //호출 url 
	var submitParameter = ""; 		
	var resultFunction =""; //실행후 실행할 함수명
	
	//댓글 등록
	if (commentSaveType=="A"){
		actionUrl = "/menu/userInsertComment.do"; //호출 url 
		submitParameter ="menu_seq=<%=CmmUtil.nvl(menuinfoDto.getMenu_seq())%>&contents=" + encodeURI(f.contents.value); 
		resultFunction ="viewResultInsert"; //실행후 실행할 함수명
		
	//댓글 수정			
	}else if (commentSaveType=="B"){
		actionUrl = "/menu/userUpdateComment.do"; //호출 url 
		submitParameter ="menu_seq=<%=CmmUtil.nvl(menuinfoDto.getMenu_seq())%>&com_seq="+ f.com_seq.value +"&contents=" + f.contents.value; 
		resultFunction ="viewResultUpdate"; //실행후 실행할 함수명
		
		
	}else{
		alert("에러가 발생했습니다.\n잠시후 시도하시길 바랍니다.")
		return;
	}
	
	
	xmlHttpPost(actionUrl, submitParameter, resultFunction);
		
}

//댓글 등록 후 처리
function viewResultInsert(result) {
	//댓글등록이 성공이라면...
	if (result=="1"){
		doCommList();
		
		//기존에 입력된 댓글 내용 삭제
		var f = document.getElementById("form2");
		f.contents.value="";
		
		
	}else{
		alert("댓글 등록에 실패하였습니다.");	
	}
}


//댓글 수정 내용 보여주기
function doCommentUpdateView(com_seq, contents){
	
	var f = document.getElementById("form2");
	f.com_seq.value= com_seq; //댓글 번호 저장
	f.contents.value= contents.replace(/<br>/g,"\n"); //댓글 내용 보여주기

	//버튼명 변경하기
	document.getElementById("btnSave").value ="댓글 수정";
	
	//수정 타입으로 변경
	commentSaveType = "B"; 
	
	
	//댓글 수정 취소 버튼 만들기
	var tag  = "<input type=\"button\" id=\"btnSave\" value=\"댓글 수정\" onclick=\"saveComment()\" class=\"btn_confirm\">&nbsp;";
	    tag += "<input type=\"button\" id=\"btnCancle\" value=\"수정 취소\" onclick=\"cancleComment()\" class=\"btn_confirm\">";
	
	$("#btnCommentArea").html(tag);
	
}

//댓글 수정 취소
function cancleComment(result) {
	
	//댓글 등록 유형으로 변경
	commentSaveType = "A"; 
	
	//댓글 수정위해 입력된 값들 초기화
	var f = document.getElementById("form2");
	f.com_seq.value= ""; //댓글 번호 초기화
	f.contents.value= ""; //댓글 내용 초기화
	
	//댓글 등록 버튼으로 변경
	var tag  = "<input type=\"button\" id=\"btnSave\" value=\"댓글 등록\" onclick=\"saveComment()\" class=\"btn_confirm\">";
	
	$("#btnCommentArea").html(tag);
	
}

//댓글 수정 후 처리
function viewResultUpdate(result) {
	
	//댓글삭제가 성공이라면...
	if (result=="1"){
		
		//댓글 관련 변수 초기화
		doCommentPageInit();
		
	
		//댓글 등록 유형으로 변경
		commentSaveType = "A"; 
		
		//댓글 수정위해 입력된 값들 초기화
		var f = document.getElementById("form2");
		f.com_seq.value= ""; //댓글 번호 초기화
		f.contents.value= ""; //댓글 내용 초기화
		
		//댓글 등록 버튼으로 변경
		var tag  = "<input type=\"button\" id=\"btnSave\" value=\"댓글 등록\" onclick=\"saveComment()\" class=\"btn_confirm\">";
		
		$("#btnCommentArea").html(tag);
		
		//댓글 조회
		doCommList();
		
	}else{
		alert("댓글 수정에 실패하였습니다.");	
	}
}


//댓글 삭제하기
function doCommentDelete(com_seq){
	
	if(confirm("삭제하시겠습니까?")){
		var actionUrl = "/menu/userDeleteComment.do"; //호출 url 
		var submitParameter ="menu_seq=<%=CmmUtil.nvl(menuinfoDto.getMenu_seq())%>&com_seq=" + com_seq; 
		var resultFunction ="viewResultDelete"; //실행후 실행할 함수명
		
		xmlHttpPost(actionUrl, submitParameter, resultFunction);
		
	}
	
}

//댓글 삭제 후 처리
function viewResultDelete(result) {
	
	//댓글삭제가 성공이라면...
	if (result=="1"){
		
		//댓글 관련 변수 초기화
		doCommentPageInit();
		
		//댓글 등록 유형으로 변경
		commentSaveType = "A"; 
		
		//댓글 수정위해 입력된 값들 초기화
		var f = document.getElementById("form2");
		f.com_seq.value= ""; //댓글 번호 초기화
		f.contents.value= ""; //댓글 내용 초기화
		
		//댓글 등록 버튼으로 변경
		var tag  = "<input type=\"button\" id=\"btnSave\" value=\"댓글 등록\" onclick=\"saveComment()\" class=\"btn_confirm\">";
		
		$("#btnCommentArea").html(tag);
		
		//댓글 조회
		doCommList();
		
	}else{
		alert("댓글 삭제에 실패하였습니다.");	
	}
}

//댓글 더보기(상단에 선언된 변수만큼 보여줄 댓글 내용 증가)
function moreViewComment(){

	var start_page_size = parseInt(curViewSize) + 1; 
	var end_page_size = parseInt(curViewSize) + parseInt(viewSize) + 1;
	
	var actionUrl = "/menu/userCommentList.do"; //호출 url 
	var submitParameter  ="menu_seq=<%=CmmUtil.nvl(menuinfoDto.getMenu_seq())%>";
	    submitParameter +="&start_page_size="+ start_page_size + "&end_page_size="+ end_page_size; 
	
	var resultFunction ="viewResultMoreView"; //실행후 실행할 함수명
	
	xmlHttpPost(actionUrl, submitParameter, resultFunction);
		
	
}

function displayBtnMoreView(){
	
	//alert("curViewSize : "+ curViewSize + "|| varCommentListCnt :  "+ varCommentListCnt);
	//현재 댓글 수가 댓글 총 수보다 작다면, 더보기 보여줌
	if (curViewSize < varCommentListCnt){
		document.getElementById("btnMoreView").style.display = "";
		
	}else{
		document.getElementById("btnMoreView").style.display = "none";
		
	}
	
}

</script>
<script language="javascript">
function fc_chk_byte(obj_name,max_length)
{
   var ls_str     = obj_name.value; // 이벤트가 일어난 컨트롤의 value 값
   var li_str_len = ls_str.length;  // 전체길이
   // 변수초기화
   var li_max      = max_length; // 제한할 글자수 크기
   var i           = 0;  // for문에 사용
   var li_byte     = 0;  // 한글일경우는 2 그밗에는 1을 더함
   var li_len      = 0;  // substring하기 위해서 사용
   var ls_one_char = ""; // 한글자씩 검사한다
   var ls_str2     = ""; // 글자수를 초과하면 제한할수 글자전까지만 보여준다.
   
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
      alert( li_max + " Bytes를 초과 입력할수 없습니다. \n 초과된 내용은 자동으로 삭제 됩니다. ");
      ls_str2 = ls_str.substr(0, li_len);
      obj_name.value = ls_str2; 
      document.frms.chkbytes.value = cal_length(obj_name.value);
   }
   obj_name.focus();   
   document.frms.chkbytes.value = cal_length(ls_str);
}

/**
 * 한글을 2바이트 씩 계산하여 입력받은 문자열이 DB에 저장될 때 총 몇바이트를 차지하는지 계산한다.
 * 엔터(\r\n)는 2바이트를 차지한다.
 * @param val : 입력받은 문자열
 */
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


<%@include file="/guestinc/apptop.jsp" %>

</head>
<body onload="doOnload()">
<!-- S: WRAPPER -->
<div class="wrapper">
    <!-- S: HEADER -->
    <%@include file="/guestinc/appheader.jsp"%>
    <!-- E: HEADER -->

    <!-- S: CONTENT -->
    <%@include file="/guestinc/appmenu.jsp"%>
    <!-- join -->
    <div class="content" style="display:block;">
        <div class="content_wrapper">
        	<header><span>메뉴소개</span></header>
			<div class="section">
               <div class='food_main'><img src="<%=CmmUtil.nvl(menuinfoDto.getFile_name())%>" /></div>
                 <div class='tb_food'>
                    <div class='tb_section'>
                        <span class="sc_head">가격</span>
                          <span class="sc_desc"><div><%=CmmUtil.nvl(menuinfoDto.getPrice(), "0") + "원"%></div></span>
                     </div>
                    <div class='tb_section'>
                        <span class="sc_head">매뉴소개</span>
                        <span class="sc_desc">
                            <div>
                            <%=CmmUtil.nvl(menuinfoDto.getMenu_int())%>
                            </div>
                        </span>
                    </div>
                    <div class='tb_section bl'>
                         <span class="sc_head">원산지</span>
                          <span class="sc_desc">
                            <div>
                           <%=CmmUtil.nvl(menuinfoDto.getCountry_info())%>
                            </div>
                          </span>
                    </div>
               </div>
                
				
				
				
				
				
				
				
				
				
			

				<form name="form1" id="form1" method="post" action="">
				<input type="hidden" name="menu_seq" value="<%=CmmUtil.nvl(menuinfoDto.getMenu_seq())%>">
                <div class='wrapper50'>
                  
                    <input type="button" title="목록" value="목록" class="btn_global" onclick="location.href='/menu/userMenuList.do'">
                </div>
				</form>


















              <form name="form2" id="form2"> 
			  <input type="hidden" name="com_seq">
	          <div class="content view" style="display:block;">
		      <div class="content_wrapper">
			  <div class="reply_head">댓글 <span id="commentListCnt"> 0 </span></div>
				
			    <ul class="reply">
			  	   <li>
		              		 <div class="reply_detail">
		                          <span class="input_box">
		                                    
						                                            
						                                             <%
         if (session.getAttribute("USER_NO") == null || session.getAttribute("USER_NAME").equals("")) {
            %>
                 <textarea name="contents" placeholder="로그인 후 댓글등록이 가능합니다"></textarea>
            
               <%}else{ %>
             <textarea name="contents" placeholder="내용을 입력해주세요." onkeyup="fc_chk_byte(this,4000);"></textarea>
              
            <%} %>
                                                                                             
                           </span>
               <div id="btnCommentArea" class="view_modify btn_wrap">
                  
                            <%
         if (session.getAttribute("USER_NO") == null || session.getAttribute("USER_NAME").equals("")) {
            %>
                
            
               <%}else{ %>
               <input type="button" id="btnSave" value="댓글 등록" onclick="saveComment()" class="btn_confirm">
              
            <%} %>
						
		               </li>
					
					<!-- 댓글 보여주는 영역 -->									
				    <div id="replyListArea">
				    
				    
				    
				    </div>
		                
				<div>
		             <input id="btnMoreView" type="button" title="더보기" onclick="moreViewComment()" value="더보기" class="btn_white">
		             </div>
		             </ul>
		   	</div>
		    </div> 
		   </form>
    
            </div>
        </div>
    </div>
    <!-- join -->
    <!-- E: CONTENT -->

    <!-- S: FOOTER -->
<%@include file="/guestinc/appfooter.jsp"%>
    <!-- E: FOOTER -->

<!-- E: WRAPPER -->
</body>
</html>
    