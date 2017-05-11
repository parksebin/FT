<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ac.kr.ft.com.dto.ScheduleDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
Calendar cal = Calendar.getInstance();
List<ScheduleDTO> list = (List<ScheduleDTO>)request.getAttribute("list");
String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");
 
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int date = cal.get(Calendar.DATE);
 
if(strYear != null){
	year = Integer.parseInt(strYear);
	month = Integer.parseInt(strMonth);
}
//년도/월 셋팅
cal.set(year, month, 1);
 
int startDay = cal.getMinimum(java.util.Calendar.DATE);
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
int newLine = 0;
 
//오늘 날짜 저장.
Calendar todayCal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
 
String session_auth = (String) session.getAttribute("AUTH");
if(session_auth==null){
	session_auth="";
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>라오푸드트럭</title>
    <meta charset="EUC-KR">
    <meta http-equiv='X-UA-Compatible' content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">
    <script type="text/javascript">
	function div2Resize() {
		var dul = document.getElementById("days");
		var items = dul.getElementsByTagName("li");
		
		var wul = document.getElementById("weekdays");
		var witems = wul.getElementsByTagName("li");
		if(window.innerHeight >= 800){
        	for(var i = 0; i<items.length; i++){
        		items[i].style.fontSize = '30px';
        		items[i].style.marginBottom = '15px';
        	}
        	for(var i=0; i<witems.length; i++){
        		witems[i].style.fontSize = '30px';
        	}
        	var dates = document.getElementById("dates");
        	dates.style.fontSize = '30px';
        }
    }
    window.onload = function() {
        div2Resize();

        // 브라우저 크기가 변할 시 동적으로 사이즈를 조절해야 하는경우
    }
	</script>
<%@include file="/busiinc/apptop.jsp"%>
</head>
<body>
<!-- S: WRAPPER -->
<div class="wrapper">
    <!-- S: HEADER -->
		<%@include file="/busiinc/appheader.jsp"%>
	<!-- S: WRAPPER -->
	<!-- E: HEADER -->
		<%@include file="/busiinc/appmenu.jsp"%>
	<!-- S: WRAPPER -->
	
    <!-- S: CONTENT -->
    <!-- join -->
    <div class="content" style="display:block;">
        <div class="content_wrapper">
        	<header><span>일정</span></header>
			<div class="section">
                <div class='calendar'>
					<div class="month"> 
						<ul>
							<li class="prv"><a href='calendar.do?year=<%=year-1%>&amp;month=<%=month%>'>&#10094;&#10094;</a></li>
							<li class="prv"><a href='calendar.do?year=<%=month==0?year-1:year%>&amp;month=<%=month==0?11:month-1%>'>&#10094;</a></li>
							<li class="nxt"><a href='calendar.do?year=<%=year+1%>&amp;month=<%=month%>'>&#10095;&#10095;</a></li>
							<li class="nxt"><a href='calendar.do?year=<%=month==11?year+1:year%>&amp;month=<%=month==11?0:month+1%>'>&#10095;</a></li>
							<li>
							<span style="font-size:18px" id="dates"><%=year %> <%=month+1%>월</span>
							</li>
						</ul>
					</div>

					<ul class="weekdays" id="weekdays">
					  <li>Mo</li>
					  <li>Tu</li>
					  <li>We</li>
					  <li>Th</li>
					  <li>Fr</li>
					  <li>Sa</li>
					  <li>Su</li>
					</ul>

					<ul class="days" id="days"> 
					<%
						for(int index = 1; index < start ; index++ ){
							out.println("<li>&nbsp;</li>");
							newLine++;
						}
					
					
						for(int i=1;i<=endDay;i++){
							String sUseDate = Integer.toString(year); 
						    sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
						    sUseDate += Integer.toString(i).length() == 1 ? "0" + Integer.toString(i) : Integer.toString(i);
						 	
						    int iUseDate = Integer.parseInt(sUseDate);
						    
						    String endSpan = "";
						    String endFont = "";
						    
						    out.println("<li>");
						    if(iUseDate == intToday ) {
						    	out.println("<span class='active'>");
						    	endSpan = "</span>";
					       	}
						    
						    for(ScheduleDTO scheduleDto:list){
						    	   int pl_dt1 = Integer.parseInt(scheduleDto.getPl_dt1());
						    	   int pl_dt2 = Integer.parseInt(scheduleDto.getPl_dt2());
						    	   if(pl_dt1==pl_dt2){
						    		   if(pl_dt1==iUseDate){
										out.println("<a href='schedulelist.do?useDate="+iUseDate+"'>");
										out.println("<font color='#47C83E'>");
										endFont = "</font></a>";
						    		   }
					    		   }else{
					    			   if(pl_dt1<=iUseDate && pl_dt2>=iUseDate){
											out.println("<a href='schedulelist.do?useDate="+iUseDate+"'>");
											out.println("<font color='#47C83E'>");
											endFont = "</font></a>";
					    			   }
					    		   }
							    }
						    
						    out.println(i);
						    out.println(endFont + endSpan);
						    out.println("</li>");
						}
					%>
					</ul>
				</div>
            </div>
        </div>
    </div>
	    <input type="button" title="글쓰기" value="글쓰기" class="btn_global" onclick="location.href='/busi/schedule/scheduleInsertForm.do'">
    <!-- join -->
    <!-- E: CONTENT -->

    <!-- S: FOOTER -->
    	<%@include file="/busiinc/appfooter.jsp"%>
    <!-- E: FOOTER -->
</div>
<!-- E: WRAPPER -->
</body>
</html>
