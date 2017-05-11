<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.CtrDTO"%>
<%@page import="java.util.List"%>    
<%
List<CtrDTO> rList = (List<CtrDTO>)request.getAttribute("rList"); 

if (rList==null){
	rList = new ArrayList<CtrDTO>();
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

    <title>케이터링</title>

	<%@include file="/inc/top.jsp" %>

</head>

<body>

    <div id="wrapper">

	<%@include file="/inc/menu.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">케이터링 관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">상담문의
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>등록일</th>
                                            <th>진행상황</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <!--  
                                        <tr class="odd gradeX">
                                            <td>Trident</td>
                                            <td>Internet Explorer 4.0</td>
                                            <td>Win 95+</td>
                                            <td class="center">4</td>
                                            <td class="center">X</td>
                                        </tr>
                                        <tr class="even gradeC">
                                            <td>Trident</td>
                                            <td>Internet Explorer 5.0</td>
                                            <td>Win 95+</td>
                                            <td class="center">5</td>
                                            <td class="center">C</td>
                                        </tr>
                                        <tr class="odd gradeA">
                                            <td>Trident</td>
                                            <td>Internet Explorer 5.5</td>
                                            <td>Win 95+</td>
                                            <td class="center">5.5</td>
                                            <td class="center">A</td>
                                        </tr>
									-->         
									    <%
										Iterator<CtrDTO> it = rList.iterator();
										while(it.hasNext()){
											CtrDTO ctrDTO = (CtrDTO)it.next();
											
											if (ctrDTO==null){
												ctrDTO = new CtrDTO();
											}
										%>
										
                                        <tr class="even gradeA">
                                            <td><a href="detail.do?ctr_seq=<%=CmmUtil.nvl(ctrDTO.getCtr_seq())%>"><%=CmmUtil.nvl(ctrDTO.getCtr_seq())%></a></td>
                                            <td><%=CmmUtil.nvl(ctrDTO.getTitle())%></td>
                                            <td><%=CmmUtil.nvl(ctrDTO.getReg_user_no())%></td>
                                            <td class="center"><%=CmmUtil.nvl(ctrDTO.getReg_dt())%></td>
                                            <td class="center"><%=CmmUtil.nvl(ctrDTO.getProgress())%></td>
                                        </tr>
										<%                                        													
										}
										%>
                                    
                            <p>
                           	    <a href="ctrInsert.jsp"><button type="button" class="btn btn-success">글쓰기</button></a>
                                <button type="button" class="btn btn-warning">수정</button>
                                <button type="button" class="btn btn-danger">삭제</button>
                            </p>
                         
                                    </tbody>
                                </table>
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
    