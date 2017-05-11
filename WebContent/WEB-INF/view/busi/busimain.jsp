<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.Iterator"%>
<%@ page import="ac.kr.ft.com.dto.ComDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%
	String MAIN_AUTH = (String) session.getAttribute("AUTH");
	if (MAIN_AUTH == null) {
		MAIN_AUTH = "";
	}
	List<ComDTO> rList = (List<ComDTO>) request.getAttribute("rList");

	if (rList == null) {
		rList = new ArrayList<ComDTO>();
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
        
            <li><div class='bgframe'><img src='/img/bg/b1.jpg?20161031'/></div>
            <a href='/notice/businoticeList.do' ><div class='bgfilter'></div>
            <span>공지사항
            <%
            		Iterator<ComDTO> it = rList.iterator();
            		while(it.hasNext()){
            			ComDTO cDto = it.next();
            			
            			if(cDto.getKind().equals("NOTICE")){  %>
            		
            				<img style="width:50px; height:30px; position:absolute; margin-top:50%; float:right; margin-left:10%;" src="${pageContext.request.contextPath}/img/SDS.png">
            			<%	
            				break;
            			}
            	%>
            	<%} %>
            </span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b2.jpg?20161031'/></div>
            <a href='/event/busieventList.do' ><div class='bgfilter'></div>
            <span>이벤트
             <% Iterator<ComDTO> eit = rList.iterator();
            		while(eit.hasNext()){
            			ComDTO eDto = eit.next();
            			
            			if(eDto.getKind().equals("EVENT")){ %>
            				<img style="width:50px; height:30px; position:absolute; margin-top:63%; float:right; margin-left:10%;" src="${pageContext.request.contextPath}/img/SDS.png">
            	<%			break;
            			}	
            		
            		} %>
            </span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b3.jpg?20161031'/></div>
            <a href='/community/busicommunityList.do' ><div class='bgfilter'></div>
            <span>커뮤니티</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b4.jpg?20161031'/></div>
            <a href='/menu/busiMenuList.do' ><div class='bgfilter'></div>
            <span>메뉴정보
             <% Iterator<ComDTO> mit = rList.iterator();
            		while(mit.hasNext()){
            			ComDTO mDto = mit.next();
            			
            			if(mDto.getKind().equals("MENU")){ %>
            			<img style="width:50px; height:30px; position:absolute; margin-top:50%; float:right; margin-left:10%;" src="${pageContext.request.contextPath}/img/SDS.png">
            			
            			<% 
            				break;
            			}	} %></span></a></li>
            
             <li><div class='bgframe'><img src='/img/bg/b8.jpg'/></div>
            <a href='/hyg/busiHygList.do.do' ><div class='bgfilter'></div>
            <span>위생인증서</span></a></li>
            
            <li><div class='bgframe'><img src='/img/bg/b5.jpg?20161031'/></div>
            <a href='/fest/busiFestlist.do' ><div class='bgfilter'></div>
            <span>축제정보</span></a></li>
            
             <li><div class='bgframe'><img src='/img/bg/b11.jpg'/></div>
            <a href='/busi/rankcondition.do' ><div class='bgfilter'></div>
            <span>종합순위 조회</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b6.jpg?20161031'/></div>
            <a href='/ctr/BusictrList.do' ><div class='bgfilter'></div>
            <span>케이터링</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b7.jpg?20161031'/></div>
            <a href='/busi/position/position.do' ><div class='bgfilter'></div>
            <span>위치</span></a></li>
            
             <li><div class='bgframe'><img src='/img/bg/b9.jpg?20161031'/></div>
            <a href='/busi/schedule/calendar.do' ><div class='bgfilter'></div>
            <span>일정</span></a></li>
            
            
        </ul>
    </div>
		<%
			}
		%>
		<%@include file="/busiinc/appfooter.jsp"%>
		<!-- E: FOOTER -->
	</div>



</body>

</body>
</html>
