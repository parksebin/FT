<%@page import="ac.kr.ft.com.dto.PositionDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	PositionDTO positionDto = (PositionDTO)request.getAttribute("positionDto");
	if(positionDto==null){
		positionDto = new PositionDTO();
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<title>위치</title>
	<%@include file="/inc/top.jsp" %>
</head>

<body>

    <div id="wrapper">

	<%@include file="/inc/menu.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">위치</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">위치
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                            	<form name="f" id="f" method="post" action="/position/positionGpsProc.do">
                            		<table width="100%" class="table table-striped table-bordered">
                            			<tr>
                            				<td align="center" valign="middle">제 목</td>
                            				<td><input type="text" name="title"  class="form-control" value="<%=positionDto.getTitle() %>"/></td>
                            			</tr>
                            			
                            			<tr>
                            				<td align="center" valign="middle">위 도</td>
                            				<td><input type="text" name="lat"  class="form-control" value="<%=positionDto.getLat() %>"/></td>
                            			</tr>
                            			
                            			<tr>
                            				<td align="center" valign="middle">경 도</td>
                            				<td><input type="text" name="lng"  class="form-control" value="<%=positionDto.getLng() %>"/></td>
                            			</tr>
                            			
                            			<tr>
                            				<td colspan="2" align="center">
                            					<input type="submit" value="수정" class="btn  btn-outline btn-success"/>
                            					<input type="button" value="취소" onclick="location.href='/position/position.do'" class="btn  btn-outline btn-danger"/>
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
    