<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.ScheduleDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	List<ScheduleDTO> list = (List<ScheduleDTO>)request.getAttribute("list");
	if(list==null){
		list = new ArrayList<ScheduleDTO>();
	}
	
	int cnt = 0;
	
	String useDate = request.getParameter("useDate");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>라오푸드트럭</title>
    <meta charset="EUC-KR">
    <meta http-equiv='X-UA-Compatible' content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">
<%@include file="/guestinc/apptop.jsp"%>
</head>
<body>
<!-- S: WRAPPER -->
<div class="wrapper">
    <!-- S: HEADER -->
		<%@include file="/guestinc/appheader.jsp"%>
	<!-- S: WRAPPER -->
	<!-- E: HEADER -->
		<%@include file="/guestinc/appmenu.jsp"%>
	<!-- S: WRAPPER -->

    <!-- S: CONTENT -->

	<!-- login -->
    <div class="content" style='display:block;'>
        <div class="content_wrapper">
        	<header><span><%=useDate.substring(0, 4) %>년 <%=useDate.substring(4, 6) %>월 <%=useDate.substring(6, 8) %>일</span></header>
			<div class='section'>
                <!-- list -->
                <ul class='book'>
                <%
					Iterator<ScheduleDTO> it = list.iterator();
					while(it.hasNext()){
						ScheduleDTO scheduleDTO = (ScheduleDTO)it.next();
						
						if (scheduleDTO==null){
							scheduleDTO = new ScheduleDTO();
						}
				%>
                    <li>
                        <a href="/guest/schedule/scheduleDetail.do?sch_seq=<%=CmmUtil.nvl(scheduleDTO.getSch_seq()) %>">
                        	<span class='ep'><%=++cnt %>. <%=CmmUtil.nvl(scheduleDTO.getTitle()) %></span>
                        </a>
                    </li>
 				<%
					}
 				%>
                </ul>
                <!-- list -->
                <input type="button" title="확인" value="확인" class="btn_global" onclick="location.href = '/guest/schedule/calendar.do'">
        	</div>
		</div>
    </div>
	<!-- login -->

    <!-- S: FOOTER -->
    	<%@include file="/guestinc/appfooter.jsp" %>
    <!-- E: FOOTER -->
</div>
<!-- E: WRAPPER -->
</body>
</html>
