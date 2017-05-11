<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String MAIN_AUTH = (String) session.getAttribute("AUTH");
	if (MAIN_AUTH == null) {
		MAIN_AUTH = "";
	}
%><!DOCTYPE html>
<html lang="en">
<head>
<title>라오푸드트럭</title>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="/css/style.css?ver=2">
<%@include file="/guestinc/apptop.jsp"%>
</head>
<body>
<body>
	<%@include file="/guestinc/appmenu.jsp"%>
	<!-- S: WRAPPER -->
	<div class="wrapper">
		<!-- S: HEADER -->
		<%@include file="/guestinc/appheader.jsp"%>
		<!-- E: HEADER -->
		<!-- S: CONTENT -->
		<!-- E: CONTENT -->
		<%
			if (MAIN_AUTH.equals("U")) {
		%>
		<!-- S: FOOTER -->
		<div class="content main" style='display: block;'>
			<ul>
				<li><a href="/notice/guestnoticeList.do"><button>공지사항</button></a></li>
				<li><a href="/community/guestcommunityList.do"><button>커뮤니티</button></a></li>
				<li><a href="/event/guestEventList.do"><button>이벤트</button></a></li>
				<li><a href="/menu/userMenuList.do"><button>메뉴</button></a></li>
				<li><a href="/hyg/userHygList.do"><button>위생인증서</button></a></li>
				<li><a href="/ctr/GuestctrList.do"><button>케이터링</button></a></li>
				<li><a href="/guest/schedule/calendar.do"><button>일정조회</button></a></li>
				<li><a href="/busi/position/position.do"><button>위치조회</button></a></li>
			</ul>
		</div>
		<%
			} else {
		%>
		<div class="content main" style='display: block;'>
			<ul>
				<li><a href="/notice/guestnoticeList.do"><button>공지사항</button></a></li>
				<li><a href="/community/guestcommunityList.do"><button>커뮤니티</button></a></li>
				<li><a href="/event/guestEventList.do"><button>이벤트</button></a></li>
				<li><a href="/menu/userMenuList.do"><button>메뉴</button></a></li>
				<li><a href="/hyg/userHygList.do"><button>위생인증서</button></a></li>
				<li><a href="/ctr/GuestctrList.do"><button>케이터링</button></a></li>
				<li><a href="/guest/schedule/calendar.do"><button>일정조회</button></a></li>
				<li><a href="/busi/position/position.do"><button>위치조회</button></a></li>
			</ul>
		</div>
		<%
			}
		%>
		<%@include file="/guestinc/appfooter.jsp"%>
		<!-- E: FOOTER -->
	</div>



</body>

</body>
</html>
