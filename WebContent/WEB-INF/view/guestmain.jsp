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
<link rel="stylesheet" href="/css/main.css?ver=2">
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
		
		<div class="content photomain" style='display:block;'>
        <ul>
            <li><div class='bgframe'><img src='/img/bg/b1.jpg'/></div>
            <a href='/notice/guestnoticeList.do' ><div class='bgfilter'></div>
            <span>공지사항</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b2.jpg'/></div>
            <a href='/event/guestEventList.do' ><div class='bgfilter'></div>
            <span>이벤트</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b3.jpg'/></div>
            <a href='/community/guestcommunityList.do' ><div class='bgfilter'></div>
            <span>커뮤니티</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b4.jpg'/></div>
            <a href='/menu/userMenuList.do' ><div class='bgfilter'></div>
            <span>메뉴정보</span></a></li>
            
             <li><div class='bgframe'><img src='/img/bg/b8.jpg'/></div>
            <a href='/hyg/userHygList.do' ><div class='bgfilter'></div>
            <span>위생인증서</span></a></li>
            
            <li><div class='bgframe'><img src='/img/bg/b6.jpg'/></div>
            <a href='/ctr/GuestctrList.do' ><div class='bgfilter'></div>
            <span>케이터링</span></a></li>
            
            <li><div class='bgframe'><img src='/img/bg/b7.jpg'/></div>
            <a href='/busi/position/position.do' ><div class='bgfilter'></div>
            <span>위치조회</span></a></li>
            
             <li><div class='bgframe'><img src='/img/bg/b9.jpg'/></div>
            <a href='/guest/schedule/calendar.do' ><div class='bgfilter'></div>
            <span>일정조회</span></a></li>
            
            
        </ul>
    </div>
		
		<%
			} else {
		%>
	<div class="content photomain" style='display:block;'>
        <ul>
            <li><div class='bgframe'><img src='/img/bg/b1.jpg'/></div>
            <a href='/notice/guestnoticeList.do' ><div class='bgfilter'></div>
            <span>공지사항</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b2.jpg'/></div>
            <a href='/event/guestEventList.do' ><div class='bgfilter'></div>
            <span>이벤트</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b3.jpg'/></div>
            <a href='/community/guestcommunityList.do' ><div class='bgfilter'></div>
            <span>커뮤니티</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b4.jpg'/></div>
            <a href='/menu/userMenuList.do' ><div class='bgfilter'></div>
            <span>메뉴정보</span></a></li>
            
             <li><div class='bgframe'><img src='/img/bg/b8.jpg'/></div>
            <a href='/hyg/userHygList.do' ><div class='bgfilter'></div>
            <span>위생인증서</span></a></li>
            
            <li><div class='bgframe'><img src='/img/bg/b6.jpg'/></div>
            <a href='/ctr/GuestctrList.do' ><div class='bgfilter'></div>
            <span>케이터링</span></a></li>
            
            <li><div class='bgframe'><img src='/img/bg/b7.jpg'/></div>
            <a href='/busi/position/position.do' ><div class='bgfilter'></div>
            <span>위치조회</span></a></li>
            
             <li><div class='bgframe'><img src='/img/bg/b9.jpg'/></div>
            <a href='/guest/schedule/calendar.do' ><div class='bgfilter'></div>
            <span>일정조회</span></a></li>
            
            
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
