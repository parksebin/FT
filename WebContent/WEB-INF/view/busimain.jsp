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
<%@include file="/busiinc/apptop.jsp"%>
</head>
<body>
<body>
	<%@include file="/busiinc/appmenu.jsp"%>
	<!-- S: WRAPPER -->
	<div class="wrapper">
		<!-- S: HEADER -->
		<%@include file="/busiinc/appheader.jsp"%>
		<!-- E: HEADER -->
		<!-- S: CONTENT -->
		<!-- main -->
		<%
			if (MAIN_AUTH.equals("P")) {
		%>
		
		 <div class="content photomain" style='display:block;'>
        <ul>
        	<li><div class='bgframe'><img src='/img/bg/b10.jpg'/></div>
            <a href='/user/busiUserList.do' ><div class='bgfilter'></div>
            <span>회원관리</span></a></li>
        
            <li><div class='bgframe'><img src='/img/bg/b1.jpg'/></div>
            <a href='/notice/businoticeList.do' ><div class='bgfilter'></div>
            <span>공지사항</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b2.jpg'/></div>
            <a href='/event/busieventList.do' ><div class='bgfilter'></div>
            <span>이벤트</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b3.jpg'/></div>
            <a href='/community/busicommunityList.do' ><div class='bgfilter'></div>
            <span>커뮤니티</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b4.jpg'/></div>
            <a href='/menu/busiMenuList.do' ><div class='bgfilter'></div>
            <span>메뉴정보</span></a></li>
            
             <li><div class='bgframe'><img src='/img/bg/b8.jpg'/></div>
            <a href='/menu/busiMenuList.do' ><div class='bgfilter'></div>
            <span>위생인증서</span></a></li>
            
            <li><div class='bgframe'><img src='/img/bg/b5.jpg'/></div>
            <a href='/fest/busiFestlist.do' ><div class='bgfilter'></div>
            <span>축제정보</span></a></li>
            
             <li><div class='bgframe'><img src='/img/bg/b11.jpg'/></div>
            <a href='/busi/rankcondition.do' ><div class='bgfilter'></div>
            <span>종합순위 조회</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b6.jpg'/></div>
            <a href='/ctr/BusictrList.do' ><div class='bgfilter'></div>
            <span>케이터링</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b7.jpg'/></div>
            <a href='/busi/position/position.do' ><div class='bgfilter'></div>
            <span>위치</span></a></li>
            
             <li><div class='bgframe'><img src='/img/bg/b9.jpg'/></div>
            <a href='/busi/schedule/calendar.do' ><div class='bgfilter'></div>
            <span>일정</span></a></li>
            
            
        </ul>
    </div>
	<!-- main -->
<!-- 		<div class="content main" style='display: block;'> -->
<!-- 			<ul> -->
<!-- 				<li><a href="/user/busiUserList.do"><button>회원관리</button></a></li> -->
<!-- 				<li><a href="/notice/businoticeList.do"><button>공지사항</button></a></li> -->
<!-- 				<li><a href="/community/busicommunityList.do"><button>커뮤니티</button></a></li> -->
<!-- 				<li><a href="/event/busieventList.do"><button>이벤트</button></a></li> -->
<!-- 				<li><a href="/menu/busiMenuList.do"><button>메뉴정보</button></a></li> -->
<!-- 				<li><a href="/hyg/busiHygList.do"><button>위생인증서</button></a></li> -->
<!-- 				<li><a href="/fest/busiFestlist.do"><button>축제정보</button></a></li> -->
<!-- 				<li><a href="/busi/rankcondition.do"><button>종합순위 -->
<!-- 							조회</button></a></li> -->
<!-- 				<li><a href="/ctr/BusictrList.do"><button>케이터링</button></a></li> -->
<!-- 				<li><a href="/busi/schedule/calendar.do"><button>일정</button></a></li> -->
<!-- 				<li><a href="/busi/position/position.do"><button>위치 -->
<!-- 							조회</button></a></li> -->


<!-- 			</ul> -->
<!-- 		</div> -->
		<!-- main -->
		<!-- E: CONTENT -->
		<%
			}
		%>
		<%@include file="/busiinc/appfooter.jsp"%>
		<!-- E: FOOTER -->
	</div>



</body>

</body>
</html>
