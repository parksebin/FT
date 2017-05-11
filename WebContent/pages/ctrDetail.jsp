<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
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
                                        
                                        <tr class="even gradeA">
                                            <td>1</td>
                                            <td>1박2일 신청합니다/</td>
                                            <td>황금독수리</td>
                                            <td class="center">2016-07-11</td>
                                            <td class="center">거래완료</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>2</td>
                                            <td>EXO 오빠들을 위한 팬케이크~♥</td>
                                            <td>카시오페아</td>
                                            <td class="center">2016-07-13</td>
                                            <td class="center">진행중</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>3</td>
                                            <td>여의도 밤 도깨비 100명분 신청합니다.</td>
                                            <td>여의나루</td>
                                            <td class="center">2016-07-14</td>
                                            <td class="center">접수완료</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>4</td>
                                            <td>초등학교 운동회 닭꼬치</td>
                                            <td>김말순</td>
                                            <td class="center">2016-07-20</td>
                                            <td class="center">신청</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>5</td>
                                            <td>Firefox 3.0</td>
                                            <td>Win 2k+ / OSX.3+</td>
                                            <td class="center">1.9</td>
                                            <td class="center">A</td>
                                        </tr>
                                        
                                        <tr class="gradeU">
                                            <td>공지</td>
                                            <td>케이터링 신청 글 양식입니다.</td>
                                            <td>관리자</td>
                                            <td class="center">2016-08-21</td>
                                            <td class="center"> </td>
                                        </tr>
                                    
                            <p>
                           	    <a href="ctrInsert.jsp"><button type="button" class="btn btn-success">글쓰기</button></a>
                                <button type="button" class="btn btn-warning">수정</button>
                                <button type="button" class="btn btn-danger">삭제</button>
                                <button type="button" class="btn btn-link">Link</button>
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
    