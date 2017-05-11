<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
	System.out.print(rList.size());
%>
<!DOCTYPE html>
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
            <li><div class='bgframe'><img src='/img/bg/b1.jpg?20161031'/></div>
            <a href='/notice/guestnoticeList.do' ><div class='bgfilter'></div>
            <span>
            	공지사항
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
            <a href='/event/guestEventList.do' ><div class='bgfilter'></div>
            <span>이벤트 	
            <% Iterator<ComDTO> eit = rList.iterator();
            		while(eit.hasNext()){
            			ComDTO eDto = eit.next();
            			
            			if(eDto.getKind().equals("EVENT")){ %>
            				<img style="width:50px; height:30px; position:absolute; margin-top:63%; float:right; margin-left:10%;" src="${pageContext.request.contextPath}/img/SDS.png">
            	<%			break;
            			}	
            		
            		} %>
            			</span>
            			</a>
            			</li>
<%--             <img src="${pageContext.request.contextPath}/new/new.png" width="1" height="1"> --%>
            
            <li><div class='bgframe'><img src='/img/bg/b3.jpg?20161031'/></div>
            <a href='/community/guestcommunityList.do' ><div class='bgfilter'></div>
            <span>커뮤니티</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b4.jpg?20161031'/></div>
            <a href='/menu/userMenuList.do' ><div class='bgfilter'></div>
            <span>메뉴정보
            <% Iterator<ComDTO> mit = rList.iterator();
            		while(mit.hasNext()){
            			ComDTO mDto = mit.next();
            			
            			if(mDto.getKind().equals("MENU")){ %>
            			<img style="width:50px; height:30px; position:absolute; margin-top:50%; float:right; margin-left:10%;" src="${pageContext.request.contextPath}/img/SDS.png">
            			
            			<% 
            				break;
            			}	} %>
            
            </span></a></li>
            
             <li><div class='bgframe'><img src='/img/bg/b8.jpg?20161031'/></div>
            <a href='/hyg/userHygList.do' ><div class='bgfilter'></div>
            <span>위생인증서</span></a></li>
            
            <li><div class='bgframe'><img src='/img/bg/b6.jpg?20161031'/></div>
            <a href='/ctr/GuestctrList.do' ><div class='bgfilter'></div>
            <span>케이터링</span></a></li>
            
            <li><div class='bgframe'><img src='/img/bg/b7.jpg?20161031'/></div>
            <a href='/guest/position/position.do' ><div class='bgfilter'></div>
            <span>위치조회</span></a></li>
            
             <li><div class='bgframe'><img src='/img/bg/b9.jpg?20161031'/></div>
            <a href='/guest/schedule/calendar.do' ><div class='bgfilter'></div>
            <span>일정조회</span></a></li>
            
            
        </ul>
    </div>
    	<%}else{%>
    	<div class="content photomain" style='display:block;'>
        <ul>
            <li><div class='bgframe'><img src='/img/bg/b1.jpg?20161031'/></div>
            <a href='/notice/guestnoticeList.do' ><div class='bgfilter'></div>
            <span>
            	공지사항
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
            <a href='/event/guestEventList.do' ><div class='bgfilter'></div>
            <span>이벤트 	
            <% Iterator<ComDTO> eit = rList.iterator();
            		while(eit.hasNext()){
            			ComDTO eDto = eit.next();
            			
            			if(eDto.getKind().equals("EVENT")){ %>
            				<img style="width:50px; height:30px; position:absolute; margin-top:63%; float:right; margin-left:10%;" src="${pageContext.request.contextPath}/img/SDS.png">
            	<%			break;
            			}	
            		
            		} %>
            			</span>
            			</a>
            			</li>
<%--             <img src="${pageContext.request.contextPath}/new/new.png" width="1" height="1"> --%>
            
            <li><div class='bgframe'><img src='/img/bg/b3.jpg?20161031'/></div>
            <a href='/community/guestcommunityList.do' ><div class='bgfilter'></div>
            <span>커뮤니티</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b4.jpg?20161031'/></div>
            <a href='/menu/userMenuList.do' ><div class='bgfilter'></div>
            <span>메뉴정보
            <% Iterator<ComDTO> mit = rList.iterator();
            		while(mit.hasNext()){
            			ComDTO mDto = mit.next();
            			
            			if(mDto.getKind().equals("MENU")){ %>
            			<img style="width:50px; height:30px; position:absolute; margin-top:50%; float:right; margin-left:10%;" src="${pageContext.request.contextPath}/img/SDS.png">
            			
            			<% 
            				break;
            			}	} %>
            
            </span></a></li>
            
             <li><div class='bgframe'><img src='/img/bg/b8.jpg?20161031'/></div>
            <a href='/hyg/userHygList.do' ><div class='bgfilter'></div>
            <span>위생인증서</span></a></li>
            
            <li><div class='bgframe'><img src='/img/bg/b6.jpg?20161031'/></div>
            <a href='/ctr/GuestctrList.do' ><div class='bgfilter'></div>
            <span>케이터링</span></a></li>
            
            <li><div class='bgframe'><img src='/img/bg/b7.jpg?20161031'/></div>
            <a href='/guest/position/position.do' ><div class='bgfilter'></div>
            <span>위치조회</span></a></li>
            
             <li><div class='bgframe'><img src='/img/bg/b9.jpg?20161031'/></div>
            <a href='/guest/schedule/calendar.do' ><div class='bgfilter'></div>
            <span>일정조회</span></a></li>
            
            
        </ul>
    </div>
    	<%} %>
		<%@include file="/guestinc/appfooter.jsp"%>
		<!-- E: FOOTER -->
	</div>



</body>

</body>
</html>
