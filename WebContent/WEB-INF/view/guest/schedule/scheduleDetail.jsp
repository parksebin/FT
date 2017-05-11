<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="ac.kr.ft.com.dto.ScheduleDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	ScheduleDTO scheduleDto = (ScheduleDTO)request.getAttribute("scheduleDto");
	if(scheduleDto==null){
		scheduleDto = new ScheduleDTO();
	}
	String date = "";
	if(scheduleDto.getPl_dt1().equals(scheduleDto.getPl_dt2())){
		String pl_dt1 = scheduleDto.getPl_dt1();
		date = pl_dt1.substring(0,4) + "." + pl_dt1.substring(4,6) + "." + pl_dt1.substring(6);
	}else{
		String pl_dt1 = scheduleDto.getPl_dt1();
		String pl_dt2 = scheduleDto.getPl_dt2();
		date = pl_dt1.substring(0,4) + "." + pl_dt1.substring(4,6) + "." + pl_dt1.substring(6) + " ~ " +
				pl_dt2.substring(0,4) + "." + pl_dt2.substring(4,6) + "." + pl_dt2.substring(6);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>라오푸드트럭</title>
    <meta charset="EUC-KR">
    <meta http-equiv='X-UA-Compatible' content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">
<%@include file="/guestinc/apptop.jsp"%>
</head>
<body>
<div class="wrapper">
    <!-- S: HEADER -->
		<%@include file="/guestinc/appheader.jsp"%>
	<!-- S: WRAPPER -->
	<!-- E: HEADER -->
		<%@include file="/guestinc/appmenu.jsp"%>
	<!-- S: WRAPPER -->

    <!-- S: CONTENT -->
     <!-- join -->
    <div class="content view" style="display:block;">
        <div class="content_wrapper">
        	<header>
                <div class='view_title'>
                   <%=CmmUtil.nvl(scheduleDto.getTitle()) %>
                </div>
                <span class='view_info'>
                    <%=date %>
                </span>
                
            </header>
			<div class="section">
                <!-- group -->
                <div class="view_detail">
                    <%=CmmUtil.nvl(scheduleDto.getContents()) %>
				</div>
            </div>
            <div class='wrapper50'>
                <input type='button' title="확인" value="확인" class='btn_global' onclick="location.href='/guest/schedule/calendar.do'" />
            </div>
            
        </div>
    </div>
    <!-- E: CONTENT -->
    
    <!-- S: FOOTER -->
    	<%@include file="/guestinc/appfooter.jsp" %>
    <!-- E: FOOTER -->
</div>
</body>
</html>