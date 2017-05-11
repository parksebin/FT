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
                        <div class="panel-heading">주문하기
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <!-- <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>등록일</th>
                                            <th>진행상황</th>
                                        </tr>
                                    </thead> -->
                                    <tbody>
                                        
                                       <tr>
					<td align="center" width="120px"><b>회원이름</b></td>
					<td width="360px" colspan="3"><input class="form-control" name="user_name" style= "width:200px"/></td>
				</tr>
				
				<tr>
					<td align="center"><b>이메일</b></td>
					<td colspan="3">
					<input type="text" name="email1" style= "width :100px"/> 
					@<input type="text" name="email2" style= "width :100px"/>
							
					<select name="email3">
						<option value="직접입력">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="empal.com">empal.com</option>
						<option value="hanafos.com">hanafos.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="paran.com">paran.com</option>
						<option value="korea.com">korea.com</option>
						<option value="freechal.com">freechal.com</option>
					</select>
					</td>	
				</tr>
				<tr>
					<td align="center"><b>휴대전화</b></td>
					
					<td colspan="3"><select name="tel_1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="019">019</option>
						<option value="016">016</option>
					</select>
					-
					<input type="text" name="tel_2" style= "width :60px"/> 
					-
					<input type="text" name="tel_3" style= "width :60px"/></td>		
				</tr>
				
					
				<tr>
					<td align="center"><b>제목</b></td>
					<td><input class="form-control" name="title" style= "width :250px"/></td>
				 	<td align="center"><b>공지여부</b></td>
				    <td>예 <input type="radio" name="CTR_YN" value="1">
					    아니오 <input type="radio" name="CTR_YN" value="2"> 
				</tr> 
				
				<tr>
					<td align="center"><b>내용</b></td>
					<td colspan="4">
					<textarea class="form-control" rows="10" cols="60"></textarea></td>
				</tr>
				
				<tr>
				<td colspan="4" align="center">
				<a href="ctrList.jsp"><button type="button" class="btn btn-success">확인</button></a>
                <a href="ctrList.jsp"><button type="button" class="btn btn-danger">취소</button></a>
				</td>
				<input type="reset" value="전송!!!" onclick="location.href='list.do'"/>
				
				</tr>
                                    
                          
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
    