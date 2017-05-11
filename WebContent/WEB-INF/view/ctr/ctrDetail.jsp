<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.CtrDTO"%>
<%
CtrDTO ctrDto = (CtrDTO)request.getAttribute("ctrDto"); 

if (ctrDto==null){
	ctrDto = new CtrDTO();
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

    <title>케이터링 상세상세</title>

	<%@include file="/inc/top.jsp" %>


	<script type="text/javascript">
		function doAction(gubun) {
			var f = document.getElementById("form1");
			if(gubun=="U"){
				f.action = "ctrUpdateForm.do";
				f.submit();
			}else if(gubun=="D"){
				if(confirm("삭제하시겠습니까?")){
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
								
								<form name="f" method="post">
								<table border="1" class="table table-striped table-bordered table-hover" id="dataTables-example">
									<tr>
										<td align="center" width="120px"><b>회원이름</b></td>
										<td width="120px"><%=CmmUtil.nvl(ctrDto.getUser_name())%></td>
										<td align="center" width="120px"><b>날짜</b></td>
										<td width="120px"><%=CmmUtil.nvl(ctrDto.getReg_dt())%></td>
										<td align="center" width="120px"><b>진행상황</b></td>
										<td width="120px">
											<% if(CmmUtil.nvl(ctrDto.getProgress()).equals("R")){
                                                        out.print("신청");
                                                     }else if(CmmUtil.nvl(ctrDto.getProgress()).equals("RS")){
                                                         out.print("접수완료");
                                                     }else if(CmmUtil.nvl(ctrDto.getProgress()).equals("P")){
                                                         out.print("진행중");
                                                     }else if(CmmUtil.nvl(ctrDto.getProgress()).equals("TS")){
                                                         out.print("거래완료");
                                                     }else{
                                                        out.print("오류");
                                                     }
                                                        %>
										</td>									
									</tr>
									<tr>
										<td align="center"><b>이메일</b></td>
										<td colspan="5">
										<%=CmmUtil.nvl(ctrDto.getEmail1()) %> 
										@<%=CmmUtil.nvl(ctrDto.getEmail2()) %>
										<!-- 이메일3 뻐큐뻐큐ㅗㅗ -->
									
										</td>	
									</tr>
									<tr>
										<td align="center"><b>휴대전화</b></td>
										<td colspan="5">
										 <%=CmmUtil.nvl(ctrDto.getTel_1())%>
										-<%=CmmUtil.nvl(ctrDto.getTel_2())%>
										-<%=CmmUtil.nvl(ctrDto.getTel_3())%></td>		
									</tr>
									<tr>
										<td align="center" ><b>제목</b></td>
										<td colspan="2"><%=CmmUtil.nvl(ctrDto.getTitle())%></td>
									   <%--  <td align="center"><b>공지여부</b></td>
									    <td colspan="2"><%if(CmmUtil.nvl(ctrDto.getCtr_yn()).equals("1")){
									    	out.print("예");
									    }else{
									    	out.print("아니오");
									    }%></td> --%>
										    <!-- if문으로 바꿔라. -->
									
									</tr>
									<tr>
										<td align="center"><b>내용</b></td>           
										<td colspan="5">
										<!-- 	<textarea name="contents" rows="10" cols="68" disabled="disabled" class="form-control"> --><%=CmmUtil.nvl(ctrDto.getContents())%><!-- </textarea> -->
										</td>
									</tr>
                                    
                         
                                    </tbody>
                                </table>
	                            <p align="right">
									<input type="button" value="수정" onclick="doAction('U')" class="btn btn-outline btn-warning" />
									<input type="button" value="삭제" onclick="doAction('D')" class="btn btn-outline btn-danger"/>
									<input type="button" value="목록" onclick="location.href='/ctr/ctrList.do'" class="btn btn-outline btn-default"/>
	                            </p>
	                            </form>
	                            
	                            <form name="form1" id="form1" method="post">
								<input type="hidden" name="ctr_seq" value="<%=CmmUtil.nvl(ctrDto.getCtr_seq()) %>">
								</form>
								
								<!-- 난 수정한거 없는데 왜이럴까 -->
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
    