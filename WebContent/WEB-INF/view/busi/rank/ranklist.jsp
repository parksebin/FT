<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.FestivalDTO"%>
<%@page import="java.util.List"%>
<%
	String month = "";
	
	String city = CmmUtil.nvl((String)request.getAttribute("city"));
	String local = CmmUtil.nvl((String)request.getAttribute("local"));
	String nation = CmmUtil.nvl((String)request.getAttribute("nation"));
	String pay = CmmUtil.nvl((String)request.getAttribute("pay"));
	String calender = CmmUtil.nvl((String)request.getAttribute("calender"));
	String cal = CmmUtil.nvl((String)request.getAttribute("cal"));
	
	String para = "city="+ city + "&local=" + local + "&nation=" + nation + "&pay=" + pay + "&calender=" + calender ;
%>
<html lang="en">
<head>


    <title>라오푸드트럭</title>
    <meta charset="EUC-KR">
    <meta http-equiv='X-UA-Compatible' content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">
    <script src="/bower_components/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript">
/*
#######################################################
#	게시글 더보기 변수 시작	
#######################################################
*/
var s= 1;
	if(window.innerHeight >= 700) {
		var viewSize = 10 ;
	}else{
		var viewSize = 5; 

	}
var curViewSize = 0; //현재 댓글 갯수
var varCommentListCnt = 0; //댓글 총 갯수

//보여줄 게시글 내용(계속 이어서 덮어씀)
var tag = "";
	// 여기화면은 ranklist1.jsp  파라미터 값넘어오는 곳은 rankcondition.jsp 
	//rankcondition.jsp 셋팅해논 값 폼테그에 의해 - > ranklist1.jsp 로넘어감 여기페이지에서 
	//아작스 호출 url은 ->/rank/rankbusi.do 여기컨트롤러에서 파라미터 값이 세팅되어야함. 그후
	///rank/rankbusi.do여기 컨트롤러에서 return 해주는곳은 RanklistJSON.jsp 

/*
#######################################################
#	게시글 더보기 변수 끝
#######################################################
*/

//로딩시 자동실행
function doOnload(){
	doCommList();

}
//ajax 호출(리스트 호출)
function xmlHttpPost(actionUrl,submitParameter, resultFunction) {
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


//게시글 리스트 조회하기
function doCommList(){
 if(window.innerHeight >= 700){
			xmlHttpPost("/rank/rankbusi.do","start_page=1&end_page=11&<%=para%>", "viewResult");	
 }else{
			xmlHttpPost("/rank/rankbusi.do","<%=para %>", "viewResult");	

 }
}


//게시물 리스트 조회 후처리
function viewResult(result) {
	var jsonObj = eval("("+ result +")");
	tag = "";
	
	//배열수만큼 반복하기
	for (var i=0;i<jsonObj.list.length;i++){
		//객체가 널이 아니라면.....
	/* 	tag +="   <li class='rank'>"+ s++ + "</li>";
		tag +="   <li class='location'>"+ jsonObj.list[i].City +"<br/>"+ jsonObj.list[i].Local+ "</li>";
		tag +=" <a href=\"/fest/busiFestDetail.do?fst_seq="+jsonObj.list[i].FST_SEQ+"\">  ";
		tag +="   <li class='date'>"+ jsonObj.list[i].Attractions + "</li></a>";
		tag +="   <li class='location'>"+ jsonObj.list[i].Calender + "&nbsp 명 </li><br/>";
 */
		 tag +="<div class='tb_section'>";
	      tag +="   <span class='w33'>"+ s++ + "</span>";
	      tag +="   <span class='w31'>"+ jsonObj.list[i].City +"<br/>"+ jsonObj.list[i].Local+ "</span>";
	      tag +=" <a href=\"/fest/busiFestDetail.do?fst_seq="+jsonObj.list[i].FST_SEQ+"&cal=<%=cal%>"+"\">  ";
	      tag +="   <span class='w31'>"+ jsonObj.list[i].Attractions + "</span></a>";
	      tag +="   <span class='w32'>"+ jsonObj.list[i].Calender + "&nbsp 명 </span>";
	      tag +=" </div>" 
	}

	$("#replyListArea").html(tag);
	
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
		
		//객체가 널이 아니라면.....
		 tag +="<div class='tb_section'>";
	      tag +="   <span class='w33'>"+ s++ + "</span>";
	      tag +="   <span class='w31'>"+ jsonObj.list[i].City +"<br/>"+ jsonObj.list[i].Local+ "</span>";
	      tag +=" <a href=\"/fest/busiFestDetail.do?fst_seq="+jsonObj.list[i].FST_SEQ+"&cal=<%=cal%>"+"\">  ";
	      tag +="   <span class='w31'>"+ jsonObj.list[i].Attractions + "</span></a>";
	      tag +="   <span class='w32'>"+ jsonObj.list[i].Calender + "&nbsp 명 </span>";
	      tag +=" </div>" 
		
	}
	
	$("#replyListArea").html(tag);
	


	varCommentListCnt = jsonObj.listCnt;

	curViewSize += jsonObj.list.length; //현재 게시글 갯수 업데이트
	
	displayBtnMoreView();
	
}

//댓글 더보기(상단에 선언된 변수만큼 보여줄 댓글 내용 증가)
function moreViewComment(){

	var start_page = parseInt(curViewSize) + 1; 
	var end_page = parseInt(curViewSize) + parseInt(viewSize) + 1;
	
	var actionUrl = "/rank/rankbusi.do"; //호출 url 
	var submitParameter ="start_page="+ start_page + "&end_page="+ end_page+"&<%=para%>"; 
	
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
	<%@include file="/busiinc/apptop.jsp"%>
	
</head>
<body onload="doOnload()">
<!-- S: WRAPPER -->
<div class="wrapper">
    <!-- S: HEADER -->
   			<%@include file="/busiinc/appheader.jsp"%>

    <!-- E: HEADER -->
			<%@include file="/busiinc/appmenu.jsp"%>

    <!-- S: CONTENT -->
    <!-- join -->
    <div class="content" style="display:block;">
        <div class="content_wrapper">
        	<header><span><a href=/busi/rankcondition.do>종합순위 정보(축제)</a></span></header>
			<div class="section">
                <div class='tb_fs'>
                    <div class='tb_section ranking'>
                       <div class='tb_section'>
                        <span class='w33' ><b>번호</b></span>
                        <span class='w31'><b>소재지</b></span>
                        <span class='w31'><b>축제 관광지</b></span>
                        <span class='w32'><b><%
													if (calender.equals("jan")) {
														month = "1월";
														out.print(month);
													} else if (calender.equals("feb")) {
														month = "2월";
														out.print(month);
													} else if (calender.equals("mar")) {
														month = "3월";
														out.print(month);
													} else if (calender.equals("apr")) {
														month = "4월";
														out.print(month);
													} else if (calender.equals("may")) {
														month = "5월";
														out.print(month);
													} else if (calender.equals("jun")) {
														month = "6월";
														out.print(month);
													} else if (calender.equals("jul")) {
														month = "7월";
														out.print(month);
													} else if (calender.equals("aug")) {
														month = "8월";
														out.print(month);
													} else if (calender.equals("sep")) {
														month = "9월";
														out.print(month);
													} else if (calender.equals("oct")) {
														month = "10월";
														out.print(month);
													} else if (calender.equals("nov")) {
														month = "11월";
														out.print(month);
													} else {
														month = "12월";
														out.print(month);
													}
												
											%>&nbsp;(이용객)</b></span>
										</div>
                    </div>
                     <!-- list -->
                <ul class='tb_section ranking' id="replyListArea">                   
              
              
              
              
              
                </ul>
			
			
			
			
                <!-- list -->
                 
                </div>
            </div>
            <!-- navigator -->
				<input id="btnMoreView" type="button" title="더보기" value="더보기" onclick="moreViewComment()" class="btn_white">
                
    

            <!-- navigator -->
        </div>
    </div>
    <!-- join -->
    <!-- E: CONTENT -->

    <!-- S: FOOTER -->
 			<%@include file="/busiinc/appfooter.jsp"%>

    <!-- E: FOOTER -->
</div>
<!-- E: WRAPPER -->
</body>
</html>
