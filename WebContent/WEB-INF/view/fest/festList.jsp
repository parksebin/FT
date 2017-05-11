<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.FestivalDTO"%>
<%@page import="java.util.List"%>    

<%
List<FestivalDTO> rList = (List<FestivalDTO>)request.getAttribute("festivallist"); 

if (rList==null){
   rList = new ArrayList<FestivalDTO>();
}
%>    
<!DOCTYPE html>
<html lang="en">

<head>  
<!-- <!--   --> 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>축제정보</title>

   <%@include file="/inc/top.jsp" %>

</head>

<body>

    <div id="wrapper">

   <%@include file="/inc/menu.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">축제정보 관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">축제정보
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>소재지</th>
                                            <th>관광지</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                   
                               <%
                              Iterator<FestivalDTO> it = rList.iterator();
                              while(it.hasNext()){
                                 FestivalDTO festivalDTO = (FestivalDTO)it.next();
                                 
                                 if (festivalDTO==null){
                                    festivalDTO = new FestivalDTO();
                                 }
                              %>
                              
                                        <tr class="even gradeA">
                                            <td><%= CmmUtil.nvl(festivalDTO.getFst_seq())%></a></td>
                                            <td><%=CmmUtil.nvl(festivalDTO.getCity())%>&nbsp;<%=CmmUtil.nvl(festivalDTO.getLocal())%></td>
                                            <td><a href="/fest/festdetail.do?fst_seq=<%=CmmUtil.nvl(festivalDTO.getFst_seq())%>"><%=CmmUtil.nvl(festivalDTO.getAttractions())%></td>
                                        </tr>
                              <%                                                                               
                              }
                              %>
                                    </tbody>
                                </table>
                               <p align="right">
                                     <a href="/fest/festinsert.do"><button type="button" class="btn btn-success">축제등록</button></a>
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