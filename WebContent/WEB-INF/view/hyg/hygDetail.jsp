<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ac.kr.ft.com.dto.HygDTO"%>

<%
List<HygDTO> rList = (List<HygDTO>)request.getAttribute("rList"); 

if (rList==null){
	rList = new ArrayList<HygDTO>();
}

int listCnt = rList.size(); //리스트 크기
%>    
<%
HygDTO hygDto = (HygDTO)request.getAttribute("hygDto"); 

if (hygDto==null){
	hygDto = new HygDTO();
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

    <title>위생인증서</title>

	<%@include file="/inc/top.jsp" %>
	
	<script type="text/javascript">
	function doAction(gubun) {
		var f = document.getElementById("form1");
		if (gubun == "U") {
			f.action = "updateForm.do";
			f.submit();
		} else if (gubun == "D") {
			if (confirm("삭제하시겠습니까?")) {
				f.action = "delete.do";
				f.submit();
			}
		}
	}
</script>


	
</head>

<body>

    <div id="wrapper">

	<%@include file="/inc/menu.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">위생인증서</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">위생인증서상세
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <div class="dataTable_wrapper">
                       
								
						                         
						<form name="form1" id="form1" method="post">
						  <input type="hidden" name="hgn_seq" value="<%=CmmUtil.nvl(hygDto.getHgn_seq()) %>">
						                   
						<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">				
					
							<tr>
								<td align="center" width="30%" height="50%"> 
								<img src="<%=CmmUtil.nvl(hygDto.getFile_name())%>" /></td>
								<td  class="panel-body">
                            <h1><%=CmmUtil.nvl(hygDto.getTitle())%><br/>
                            <small><pre><%=CmmUtil.nvl(hygDto.getContents())%></pre></small>
                            </h1>
								
							</tr>
							
						
							</table>
							
						</form>         
	                            <p align="right">
	                            	
	                            	<input type="button" class="btn btn-outline btn-warning" value="수정" onclick="doAction('U')" /> 
									<input type="button" class="btn btn-outline btn-danger" value="삭제" onclick="doAction('D')" />
									<input type="button" class="btn btn-outline btn-default" value="목록" onclick="location.href='/hyg/hygList.do'" />
							
	                            </p>
                          
                          
                          
                          
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