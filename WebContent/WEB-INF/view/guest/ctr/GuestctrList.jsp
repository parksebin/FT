<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.CtrDTO"%>
<%@page import="java.util.List"%>
<%
	List<CtrDTO> rList = (List<CtrDTO>) request.getAttribute("rList");

	if (rList == null) {
		rList = new ArrayList<CtrDTO>();
	}
	String searchBox = (String) request.getAttribute("searchBox");
	String searchText = (String) request.getAttribute("searchText");
	String searchParameter = "";

	if (searchText != null && searchBox != null) {
		searchParameter = "searchBox=" + searchBox + "&searchText=" + searchText;
	}

	System.out.println(searchParameter);

	/* 	String auth = (String)request.getSession().getAttribute("AUTH");
		if (auth == null){
			auth = "";
		} */
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>라오푸드트럭</title>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="/css/style.css?ver=2">
<script src="/bower_components/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
	function userReg() {
		location.href = "/ctr/GuestctrRegform.do";
	}
	//전체 선택 해제
	function checkboxChange(f, cObj) {

		var cbox = document.getElementsByName("del_chk");

		//전체 선택한 경우
		if (cObj.checked) {
			for (var i = 0; i < cbox.length; i++) {
				cbox[i].checked = true;

			}

			//전체 선택해제한 경우
		} else {
			for (var i = 0; i < cbox.length; i++) {
				cbox[i].checked = false;

			}
		}
	}

	function checkcheck() {
		var check = document.f.del_chk;
		if (check.length >= 1) {
			for (var i = 0; i < check.length; i++) {
				if (check[i].checked) {
					return true;
				}
			}
		}
		alert("하나 이상 체크해주시기 바랍니다.");
		return false;
	}

	function userupdate_check() {
		var checked = false;
		var check = document.getElementsByName("del_chk");
		var f = document.getElementById("f");

		if (check.length) {
			for (var i = 0; i < check.length; i++) {
				if (check[i].checked) {
					checked = true;
					break; //하나라도 선택된 것이 있다면, 계속 for문 돌 필요 없음
				}
			}
		}

		if (checked) {
			if (confirm("선택한것을 수정하시겠습니까?")) {
				f.action = "/ctr/GuestupdateCheck.do";
				f.submit(); //폼 submit;
			}

		} else {
			alert("하나도 선택된 것이 없습니다.");

		}
	}
	
	/* 게스트가 진행상황 수정 못하게 막았어 난 확실하게 안되면 진짜 억울해 1022 */

	function disableCheck(obj) {
	    if (obj[obj.selectedIndex].className=='disabled') {
	        alert("수정하실 권한이 없습니다");
	        for (var i=0; obj[i].className=="disabled"; i++); obj.selectedIndex = i; return;
	    }
	}
	
	function userdel_check() {
		var checked = false; //체크 여부 확인 변수
		var check = document.getElementsByName("del_chk");

		var f = document.getElementById("f"); //폼객체

		if (check.length) {
			for (var i = 0; i < check.length; i++) {
				if (check[i].checked) {
					checked = true;
					break; //하나라도 선택된 것이 있다면, 계속 for문 돌 필요 없음
				}
			}
		}

		//선택된 항목이 있다면..
		if (checked) {
			if (confirm("선택한것을 삭제하시겠습니까?")) {
				f.submit(); //폼 submit;
			}

		} else {
			alert("하나도 선택된 것이 없습니다.");

		}
	}

	/*
	#######################################################
	#	게시글 더보기 변수 시작	
	#######################################################
	 */
	var viewSize = 5; //한번에 보여줄 리스트 갯수
	var curViewSize = 0; //현재 리스트 갯수
	var varCommentListCnt = 0; //리스트 총 갯수
	var searchParameter = "<%=searchParameter%>";
	//보여줄 게시글 내용(계속 이어서 덮어씀)
	var tag = "";

	/*
	#######################################################
	#	게시글 더보기 변수 끝
	#######################################################
	 */

	//로딩시 자동실행
	function doOnload() {
		doCommList();

	}

	//ajax 호출(리스트 호출)
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

	//게시글 리스트 조회하기
	function doCommList() {

		xmlHttpPost("/ctr/GuestCtrIndex.do", searchParameter, "viewResult");

	}

	//게시물 리스트 조회 후처리
	function viewResult(result) {
		//alert(result);
		var jsonObj = eval("(" + result + ")");
		tag = "";
		//배열수만큼 반복하기
		for (var i = 0; i < jsonObj.list.length; i++) {
			//객체가 널이 아니라면.....
			
			tag += "<li>";
			/* tag += "<input type='checkbox' name='del_chk' value=\"" + jsonObj.list[i].CTR_SEQ + "\">"; */
			
			tag += "   <span class='w80'>";
			tag += "   <span class='title ep'>";
			tag += "    <a href=\"GuestctrDetail.do?ctr_seq=" + jsonObj.list[i].CTR_SEQ + "\">";
			tag += "     " + jsonObj.list[i].TITLE + "</span></a><br/>";
			tag += "     " + jsonObj.list[i].USER_NAME + "&nbsp;|";
			tag += "     " + jsonObj.list[i].REG_DT + "";
			
			tag += "     <div class='select_status'>";
			tag += "<select class='status' onChange='disableCheck(this)' name='pro_"+jsonObj.list[i].CTR_SEQ+"' id='auth_"+ jsonObj.list[i].CTR_SEQ +"'>";
			if (jsonObj.list[i].PROGRESS == "R") {
				tag += "<option value='R'>신청</option>";
				tag += "<option value='RS' class=disabled >접수완료</option>";
				tag += "<option value='P' class=disabled>진행중</option>";
				tag += "<option value='TS' class=disabled>거래완료</option>";
			} else if (jsonObj.list[i].PROGRESS == "RS") {
				tag += "<option value='RS'>접수완료</option>";
				tag += "<option value='R' class=disabled>신청</option>";
				tag += "<option value='P' class=disabled>진행중</option>";
				tag += "<option value='TS' class=disabled>거래완료</option>";
			} else if (jsonObj.list[i].PROGRESS == "P") {
				tag += "<option value='P'>진행중</option>";
				tag += "<option value='R' class=disabled>신청</option>";
				tag += "<option value='RS' class=disabled>접수완료</option>";
				tag += "<option value='TS' class=disabled>거래완료</option>";
			} else if (jsonObj.list[i].PROGRESS == "TS") {
				tag += "<option value='TS'>거래완료</option>";
				tag += "<option value='R' class=disabled>신청</option>";
				tag += "<option value='RS' class=disabled>접수완료</option>";
				tag += "<option value='P' class=disabled>진행중</option>";
			}
			tag += "</select>";
			tag += "</div>";
			tag += "</span>";
			tag += "</span>";
			tag += "</li>";
		
		}

		$("#replyListArea").html(tag);

		//alert(jsonObj.listCnt);
		varCommentListCnt = jsonObj.listCnt;

		//alert(jsonObj.list.length);
		curViewSize = jsonObj.list.length; //현재 리스트 갯수 업데이트

		displayBtnMoreView();

	}

	//리스트 더보기 조회 후처리
	function viewResultMoreView(result) {
		//alert(result);

		var jsonObj = eval("(" + result + ")");

		//alert(tag);
		//배열수만큼 반복하기
		for (var i = 0; i < jsonObj.list.length; i++) {

			tag += "<li>";
			/* tag += "<input type='checkbox' name='del_chk' value=\"" + jsonObj.list[i].CTR_SEQ + "\">"; */
			
			tag += "   <span class='w80'>";
			tag += "   <span class='title ep'>";
			tag += "    <a href=\"BusictrDetail.do?ctr_seq=" + jsonObj.list[i].CTR_SEQ + "\">";
			tag += "     " + jsonObj.list[i].TITLE + "</span></a><br/>";
			tag += "     " + jsonObj.list[i].USER_NAME + "&nbsp;|";
			tag += "     " + jsonObj.list[i].REG_DT + "";
			
			tag += "     <div class='select_status'>";
			tag += "<select class='status' onChange='disableCheck(this)' name='pro_"+jsonObj.list[i].CTR_SEQ+"' id='auth_"+ jsonObj.list[i].CTR_SEQ +"'>";
			if (jsonObj.list[i].PROGRESS == "R") {
				tag += "<option value='R'>신청</option>";
				tag += "<option value='RS' class=disabled >접수완료</option>";
				tag += "<option value='P' class=disabled>진행중</option>";
				tag += "<option value='TS' class=disabled>거래완료</option>";
			} else if (jsonObj.list[i].PROGRESS == "RS") {
				tag += "<option value='RS'>접수완료</option>";
				tag += "<option value='R' class=disabled>신청</option>";
				tag += "<option value='P' class=disabled>진행중</option>";
				tag += "<option value='TS' class=disabled>거래완료</option>";
			} else if (jsonObj.list[i].PROGRESS == "P") {
				tag += "<option value='P'>진행중</option>";
				tag += "<option value='R' class=disabled>신청</option>";
				tag += "<option value='RS' class=disabled>접수완료</option>";
				tag += "<option value='TS' class=disabled>거래완료</option>";
			} else if (jsonObj.list[i].PROGRESS == "TS") {
				tag += "<option value='TS'>거래완료</option>";
				tag += "<option value='R' class=disabled>신청</option>";
				tag += "<option value='RS' class=disabled>접수완료</option>";
				tag += "<option value='P' class=disabled>진행중</option>";
			}
			tag += "</select>";
			tag += "</div>";
			tag += "</span>";
			tag += "</span>";
			tag += "</li>";

		}

		$("#replyListArea").html(tag);

		varCommentListCnt = jsonObj.listCnt;

		curViewSize += jsonObj.list.length; //현재 게시글 갯수 업데이트

		displayBtnMoreView();

	}

	//리스트 더보기(상단에 선언된 변수만큼 보여줄 리스트 내용 증가)
	function moreViewComment() {

		var start_page = parseInt(curViewSize) + 1;
		var end_page = parseInt(curViewSize) + parseInt(viewSize) + 1;

		var actionUrl = "/ctr/GuestCtrIndex.do"; //호출 url 

		var submitParameter = "start_page=" + start_page + "&end_page="
				+ end_page;

		var resultFunction = "viewResultMoreView"; //실행후 실행할 함수명

		xmlHttpPost(actionUrl, submitParameter + "&" + searchParameter,
				resultFunction);

	}

	function displayBtnMoreView() {

		//alert("curViewSize : "+ curViewSize + "|| varCommentListCnt :  "+ varCommentListCnt);
		//현재 리스트 수가 리스트 총 수보다 작다면, 더보기 보여줌
		if (curViewSize < varCommentListCnt) {

			document.getElementById("btnMoreView").style.display = "";

		} else {

			document.getElementById("btnMoreView").style.display = "none";

		}

	}
	function doSearchForm() {
		var search = document.getElementById("search");
		search.submit();
	}
</script>
<%@include file="/guestinc/apptop.jsp"%>
</head>
<body onload="doOnload()">
	<!-- S: WRAPPER -->
	<div class="wrapper">
		<!-- S: HEADER -->
		<%@include file="/guestinc/appheader.jsp"%>
		<!-- E: HEADER -->
		<%@include file="/guestinc/appmenu.jsp"%>
		<!-- S: CONTENT -->
		

		<!-- login -->
		<div class="content" style='display: block;'>
			<div class="content_wrapper">
				<header>
					<span>케이터링 상담문의</span>
				</header>
				<form id="search" name="search" method="post" action="/ctr/GuestctrList.do">
					<div class='section'>
						<!-- group -->
						<div class="group">
							<div id="search">
								<div class="input_select phone w25"> 
									<select id="searchBox" name="searchBox">
										<option value="">선택</option>
										<option value="TITLE" >제목</option>
										<option value="USER_ID">아이디</option>
									</select>
								</div>
								<div class="input_row w45">
									<span class="input_box"> <input type="text" id="searchText" name="searchText" placeholder="제목 / 아이디"
										class="input_email" value=''>
									</span>
								</div>
								<input type="button" title="검색" value="검색"
									class="btn_small w10 inline" onclick="doSearchForm()"/>
							</div>
						</div>
					</div>
				</form>
				<form name="f" id="f" method="post"
					action="GuestdeleteAllCheckList.do">
					<div class='section'>
						<!-- group -->
						
						<!-- group -->
						<!-- list -->
<!-- 						<ul class='member book'> -->
<!-- 							<li class='list_head'><input type="checkbox" name="all" -->
<!-- 								onclick="checkboxChange(this.form, this)" /><span>전체선택</span></li> -->
<!-- 						</ul> -->
						<ul id="replyListArea" class='member book'>
						</ul>
						<!-- 데이터 끝 -->
						<!-- list -->

						</select>
						<div class='wrapper50'>

							<%-- <%if(auth.equals("A") || auth.equals("P")) {%>
							<button type="button" value="글쓰기" onclick="userReg()"
								align="left" class="btn_tri">글쓰기</button>
							<button type="button" value="수정" onclick="userupdate_check()"
								align="center" class="btn_tri">수정</button>
							<input type="button" value="삭제" onclick="userdel_check()"
								align="right" class="btn_tri">
						<%}else if(auth.equals("U")) { %> --%>
							<button type="button" value="글쓰기" onclick="userReg()"
								align="left" class="btn_global">글쓰기</button>
							<%-- 	<%} %> --%>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- login -->



		<input id="btnMoreView" type="button" title="더보기" value="더보기"
			onclick="moreViewComment()" class="btn_white">
		<!-- list -->
		<!-- S: FOOTER -->
		<%@include file="/guestinc/appfooter.jsp"%>
		<!-- E: FOOTER -->
	</div>
	<!-- E: WRAPPER -->
</body>
</html>
