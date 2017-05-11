<%@page import="ac.kr.ft.com.dto.ScheduleDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
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
 
String session_auth = (String) session.getAttribute("ADMINAUTH");
if(session_auth==null){
	session_auth="";
}
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
	
    <title>일정 달력</title>

       <script type="text/javaScript" language="javascript"> 
      
       </script>
	<%@include file="/inc/top.jsp" %>

</head>

<body>

    <div id="wrapper">

	<%@include file="/inc/menu.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">일정</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">일정</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                            
<!-- 여기서 부터 복붙 -->
                            <form name="calendarFrm" id="calendarFrm" action="" method="post">
<DIV id="content" style="width:712px;">
 
<table width="100%" border="0" cellspacing="1" cellpadding="1">
<tr>
       <td align ="right">
       		<%if(session_auth.equals("A") || session_auth.equals("P")) {%>
             <input type="button" onclick="javascript:location.href='<c:url value='scheduleInsertForm.do'/>'" value="일정 생성" class="btn btn-outline btn-success"/>
             <%} %>
       </td>
 
</tr>
</table>
<!--날짜 네비게이션  -->
<table width="100%" border="0" cellspacing="1" cellpadding="1" id="KOO" bgcolor="#F3F9D7" style="border:1px solid #CED99C">
 
<tr>
<td height="60">
 
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
       <tr>
             <td height="10">
             </td>
       </tr>
      
       <tr>
             <td align="center" >
                    <a href="<c:url value='calendar.do'/>?year=<%=year-1%>&amp;month=<%=month%>" target="_self">
                           <b>&lt;&lt;</b><!-- 이전해 -->
                    </a>
                    <%if(month > 0 ){ %>
                    <a href="<c:url value='calendar.do'/>?year=<%=year%>&amp;month=<%=month-1%>" target="_self">
                           <b>&lt;</b><!-- 이전달 -->
                    </a>
                    <%} else {%>
                           <b>&lt;</b>
                    <%} %>
                    &nbsp;&nbsp;
                    <%=year%>년
                   
                    <%=month+1%>월
                    &nbsp;&nbsp;
                    <%if(month < 11 ){ %>
                    <a href="<c:url value='calendar.do'/>?year=<%=year%>&amp;month=<%=month+1%>" target="_self">
                           <!-- 다음달 --><b>&gt;</b>
                    </a>
                    <%}else{%>
                           <b>&gt;</b>
                    <%} %>
                    <a href="<c:url value='calendar.do'/>?year=<%=year+1%>&amp;month=<%=month%>" target="_self">
                           <!-- 다음해 --><b>&gt;&gt;</b>
                    </a>
             </td>
       </tr>
       </table>
 
</td>
</tr>
</table>
<br>
<table border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
<THEAD>
<TR bgcolor="#CECECE">
       <TD width='150px'>
       <DIV align="center">일</DIV>
       </TD>
       <TD width='150px'>
       <DIV align="center">월</DIV>
       </TD>
       <TD width='150px'>
       <DIV align="center">화</DIV>
       </TD>
       <TD width='150px'>
       <DIV align="center">수</DIV>
       </TD>
       <TD width='150px'>
       <DIV align="center">목</DIV>
       </TD>
       <TD width='150px'>
       <DIV align="center">금</DIV>
       </TD>
       <TD width='150px'>
       <DIV align="center">토</DIV>
       </TD>
</TR>
</THEAD>
<TBODY>
<TR>
<%
 
//처음 빈공란 표시
for(int index = 1; index < start ; index++ ){
  out.println("<TD >&nbsp;</TD>");
  newLine++;
}
 
for(int index = 1; index <= endDay; index++){
       String color = "";
 
       color="black";
 
       String sUseDate = Integer.toString(year); 
       sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
       sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);
 
       int iUseDate = Integer.parseInt(sUseDate);
      
      
       String backColor = "#EFEFEF";
       if(iUseDate == intToday ) {
             backColor = "#c9c9c9";
       }
       out.println("<TD valign='top' align='left' height='92px' bgcolor='"+backColor+"' nowrap>");
       %>
       <font color='<%=color%>'>
             <%=index %>
       </font>
       <%
      
       for(ScheduleDTO scheduleDto:list){
    	   int pl_dt1 = Integer.parseInt(scheduleDto.getPl_dt1());
    	   int pl_dt2 = Integer.parseInt(scheduleDto.getPl_dt2());
    	   if(pl_dt1==pl_dt2){
    		   if(pl_dt1==iUseDate){ %>
    			   <BR>
    			   <a href="scheduleDetail.do?sch_seq=<%=scheduleDto.getSch_seq() %>"><%=scheduleDto.getTitle() %></a>
    	<%	   }
    	   }else{
    		   if(pl_dt1<=iUseDate && pl_dt2>=iUseDate){ %>
    			   <BR>
    			   <a href="scheduleDetail.do?sch_seq=<%=scheduleDto.getSch_seq() %>"><%=scheduleDto.getTitle() %></a>
    	<%	   }
    	   }
       }
       out.println("<BR>");
      
      
       //기능 제거 
       out.println("</TD>");
       newLine++;
 
       if(newLine == 7){
         out.println("</TR>");
         if(index <= endDay){
           out.println("<TR>");
         }
         newLine=0;
       }
}
//마지막 공란 LOOP
while(newLine > 0 && newLine < 7){
  out.println("<TD>&nbsp;</TD>");
  newLine++;
}
%>
</TR>
 
</TBODY>
</TABLE>
</DIV>
</form>
                            
          <!-- 여기서 부터 복붙끝 -->                  
                            </div>

                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
    <script src="../bower_components/datatables-responsive/js/dataTables.responsive.js"></script>
    
    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>

</body>

</html>
    