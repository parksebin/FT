<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%

	List<UserDTO> rList = (List<UserDTO>) request.getAttribute("rList");

	if (rList == null) {
		rList = new ArrayList<UserDTO>();
	}
	String searchBox = (String) request.getAttribute("searchBox");
	String searchText = (String) request.getAttribute("searchText");
	String searchParameter = "";
	
	if(searchText != null && searchBox != null){
		searchParameter = "searchBox=" + searchBox + "&searchText=" + searchText;
	}
	
	System.out.println(searchParameter);
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>라오푸드트럭</title>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="/css/style.css?ver=2">
<script src="../bower_components/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
	/*
	 #######################################################
	 #	게시글 더보기 변수 시작	
	 #######################################################
	 */
	var viewSize = 5; //한번에 보여줄 댓글 갯수
	var curViewSize = 0; //현재 댓글 갯수
	var varCommentListCnt = 0; //댓글 총 갯수
	var searchParameter = "<%=searchParameter %>"; 
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
		xmlHttpPost("/user/busiUserIndex.do",searchParameter , "viewResult");

	}
	//게시물 리스트 조회 후처리
	function viewResult(result) {
		var jsonObj = eval("(" + result + ")");
		tag = "";

		//배열수만큼 반복하기
		for (var i = 0; i < jsonObj.list.length; i++) {

			//객체가 널이 아니라면.....

			tag += "<li>";
			tag += "<input type=\"checkbox\" name=\"del_chk\" value=\""+ jsonObj.list[i].USER_NO +"\">";
			tag += "   <span class='w80' ><span>";
			tag += "    <a href=\"busiUserDetail.do?user_no="
					+ jsonObj.list[i].USER_NO + "\">";
			tag += "     " + jsonObj.list[i].USER_NAME + "</span><br/>";
			tag += "      		" + jsonObj.list[i].EMAIL1 + "@";
			tag += "     " + jsonObj.list[i].EMAIL2 + "</a></span>";
			tag += "</li>";
		}

		// 	  <li><input type='checkbox'/><span class='w80'><span>박지민</span><br/>gimini@gmail.com</span></li>

		$("#reply").html(tag);

		varCommentListCnt = jsonObj.listCnt;

		curViewSize = jsonObj.list.length; //현재 댓글 갯수 업데이트

		displayBtnMoreView();

	}

	//리스트 더보기 조회 후처리
	function viewResultMoreView(result) {

		var jsonObj = eval("(" + result + ")");

		//alert(tag);
		//배열수만큼 반복하기
		for (var i = 0; i < jsonObj.list.length; i++) {

			//객체가 널이 아니라면.....
			tag += "<li>";
			tag += "<input type=\"checkbox\" name=\"del_chk\" value=\""+ jsonObj.list[i].USER_NO +"\">";
			tag += "   <span class='w80' ><span>";
			tag += "    <a href=\"busiUserDetail.do?user_no="
					+ jsonObj.list[i].USER_NO + "\">";
			tag += "     " + jsonObj.list[i].USER_NAME + "</span><br/>";
			tag += "      		" + jsonObj.list[i].EMAIL1 + "@";
			tag += "     " + jsonObj.list[i].EMAIL2 + "</a></span>";
			tag += "</li>";
		}

		$("#reply").html(tag);

		varCommentListCnt = jsonObj.listCnt;

		curViewSize += jsonObj.list.length; //현재 게시글 갯수 업데이트

		displayBtnMoreView();

	}

	//리스트 더보기(상단에 선언된 변수만큼 보여줄 리스트 내용 증가)
	function moreViewComment() {

		var start_page = parseInt(curViewSize) + 1;
		var end_page = parseInt(curViewSize) + parseInt(viewSize) + 1;

		var actionUrl = "/user/busiUserIndex.do"; //호출 url 

		var submitParameter = "start_page=" + start_page + "&end_page="	+ end_page;

		var resultFunction = "viewResultMoreView"; //실행후 실행할 함수명

		xmlHttpPost(actionUrl, submitParameter + "&" + searchParameter, resultFunction);

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

	/*
	 #######################################################
	 #	더보기 끝	
	 #######################################################
	 */

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
	
	function doSearchForm() {
		var search = document.getElementById("search");
		search.submit();
	}
	//검색 스크립트

	/* function fn_search() {
		if (jQuery("#searchS").val() == "") {
			return;
		} else {
			jQuery("input[name=searchFiled]").val(jQuery("#searchS").val());
		}
		var searchValue = jQuery("#searchI").val();
		jQuery("input[name=searchValue]").val(searchValue);

		jQuery("form[name=f]").attr("method", "post");
		jQuery("form[name=f]").attr("action", "").submit();
	} */
</script>
<%@include file="/busiinc/apptop.jsp"%>
</head>
<body onload="doOnload()">
	<!-- S: WRAPPER -->
	<div class="wrapper">
		<!-- S: HEADER -->
		<%@include file="/busiinc/appheader.jsp"%>
		<!-- E: HEADER -->

		<!-- S: CONTENT -->
		<%@include file="/busiinc/appmenu.jsp"%>
		<!-- login -->
		<div class="content" style='display: block;'>
			<div class="content_wrapper">
				<header>
					<span>회원리스트</span>
				</header>

				<!-- 				<input type="hidden" name="searchFiled" -->
				<%-- 					value="${search.searchFiled }" /> --%>
				<!-- 				//검색조건 -->
				<!-- 				<input type="hidden" name="searchValue" -->
				<%-- 					value="${search.searchValue }" /> --%>
				<!-- //검색어 -->
				<!-- //검색어 -->
				<form id="search" name="search" method="post" action="/user/busiUserList.do">
					<div class='section'>
						<!-- group -->
						<div class="group">
							<div id="search">
								<div class="input_select phone w20">
									<select id="searchBox" name="searchBox">
										<option value="">선택</option>
										<option value="USER_NAME" >이름</option>
										<option value="USER_ID">아이디</option>
									</select>
								</div>
								<div class="input_row w50">
									<span class="input_box"> <input type="text" id="searchText" name="searchText" placeholder="이름 / 아이디"
										class="input_email" value=''>
									</span>
								</div>
								<input type="button" title="검색" value="검색"
									class="btn_small w10 inline" onclick="doSearchForm()"/>
							</div>
						</div>
					</div>
				</form>
				<form id="f" name="f" method="post" action="busiDeleteCheck.do">
					<!-- group -->
					<!-- list -->
					<ul class='member'>
						<li class='list_head'><input type="checkbox" name="all"
							onclick="checkboxChange(this.form, this)" /> <span>전체선택</span> <a
							href='#' class="icon-trash">
						</a></li>
						<!-- list -->
					</ul>
					<ul class='board' id="reply">
					</ul>
					<!-- //검색어 -->
					<!-- group -->
					<!-- list -->
				</form>
					<input type="button" title="삭제" value="삭제"
					onclick="userdel_check()" class="btn_global">

				<input id="btnMoreView" type="button" title="더보기" value="더보기"
					onclick="moreViewComment()" class="btn_white">
			</div>
		</div>
	</div>
	<!-- login -->

	<!-- S: FOOTER -->

	<%@include file="/busiinc/appfooter.jsp"%>
	<!-- E: FOOTER -->
	</div>
	<!-- E: WRAPPER -->
</body>
</html>