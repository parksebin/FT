<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="ac.kr.ft.com.dto.ScheduleDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	ScheduleDTO scheduleDto = (ScheduleDTO)request.getAttribute("scheduleDto");
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
    
    <script type="text/javascript">
    var contents = detailReplace("<%=CmmUtil.nvl(scheduleDto.getContents()) %>");
    
    var table1 = document.getElementById("table1");
    
    /* table1.rows[0].cells[0].innerHTML  = contents; */
    
    	function scheduleDelete() {
			if(confirm("삭제하시겠습니까?")){
				location.href="scheduleDelete.do?sch_seq=<%=scheduleDto.getSch_seq() %>";
			}
		}
    	
    	function detailReplace(contents) {
    		contents = contents.replace(/& lt;/g, "<").replace(/& gt;/g, ">");
            contents = contents.replace(/& #40;/g,"\\(" ).replace(/& #41;/g,"\\)");
            contents = contents.replace(/& #39;/g,"'" );
            contents = contents.replace(/\"\"/g, "[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']");
            return contents;
    	}
    </script>
    
	<title>일정</title>
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
                        <div class="panel-heading">일정
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                            	<form name="f" action="scheduleUpdateForm.do">
                            		<input type="hidden" value="<%=scheduleDto.getSch_seq() %>" name="sch_seq">
                            		<table width="100%" class="table table-striped table-bordered" id="table1">
                            			<tr>
                            				<td width="10%" align="center">제 목</td>
                            				<td><%=scheduleDto.getTitle() %></td>
                            			</tr>
                            			
                            			<tr>
                            				<td align="center">날 짜</td>
                            				<td><% if(scheduleDto.getPl_dt1().equals(scheduleDto.getPl_dt2())){
                            					out.print(scheduleDto.getPl_dt1());
                            				}else{
                            					out.print(scheduleDto.getPl_dt1()+"  ~ "+scheduleDto.getPl_dt2());
                            				}
                            				%>
                            				</td>
                            				
                            			</tr>
                            			
                            			<tr>
                            				<td align="center">내 용</td>
                            				<td height="400px" id="contents"><%=CmmUtil.nvl(scheduleDto.getContents()) %></td>
                            			</tr>
                            			
                            			<tr>
                            				<td colspan="2" align="center">
                            					<input type="button" value="확인" onclick="location.href='/schedule/calendar.do'" class="btn btn-outline btn-default"/>
                            					<%if(session_auth.equals("A") || session_auth.equals("P")) {%>
                            					<input type="submit" value="수정" class="btn  btn-outline btn-warning"/>&nbsp;
                            					<input type="button" value="삭제" onclick="scheduleDelete()" class="btn  btn-outline btn-danger"/>&nbsp;
                            					<%} %>
                            				</td>
                            			</tr>
                            		</table>
                            	</form>
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
    