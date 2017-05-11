<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.HygDTO"%>
<%@page import="java.util.List"%>    
<%
List<HygDTO> rList = (List<HygDTO>)request.getAttribute("rList"); 

if (rList==null){
	rList = new ArrayList<HygDTO>();
}

int listCnt = rList.size(); //리스트 크기
%>      
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>위생인증</title>

	<%@include file="/inc/top.jsp" %>



		<script type="text/javascript">

			function doDeleteList() {
				
				var checked = false; //체크된 상태여부
				var check = document.getElementsByName("chkMenu");
				var check = document.getElementsByName("chkMenu");
				
				for( var i=0; i<check.length;i++){
					if(check[i].checked){
						checked = true;
					}
				}
				
				if (checked){
					if (confirm("삭제하시겠습니까?")){
						var f = document.getElementById("f");
						f.submit();
					}
					
				}else{
					alert("하나 이상 체크해주시기 바랍니다.");
					
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
                        <div class="panel-heading">위생인증서
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
								<form name="f" id="f" method="post" action="deleteAllCheckList.do">
                                <table width="100%" border="0">
                                	<tr>
								    <%
								    int idx = 0;//반복 횟수
								    boolean tr = false; //3번째 항목이 넘어가면 true 변경
									Iterator<HygDTO> it = rList.iterator();
									while(it.hasNext()){
										HygDTO hygDTO = (HygDTO)it.next();
										
										if (hygDTO==null){
											hygDTO = new HygDTO();
										}
										
										idx++; //반복횟수 증가

										if (idx>3){
											tr = true;
										}
									
										System.out.println("idx%3 : "+ idx%3);
										System.out.println("tr : "+ tr);
										
										//반복횟수가 3보다 크고, 3으로 나눠지면 TR추가
										if (tr && idx%3==1){
											
											System.out.println("AAAAAAAAAAA");
											
											out.println("</tr>");
											out.println("<tr>");
											
										}
										
										
									%>
										<td>
											<table >
												<tr>
													<td><input type="checkbox" name="chkMenu" value="<%=CmmUtil.nvl(hygDTO.getHgn_seq())%>"/></td>
													<td align="center">
													<a href="/hyg/hygDetail.do?hgn_seq=<%=CmmUtil.nvl(hygDTO.getHgn_seq())%>">
													
													<img src="<%=CmmUtil.nvl(hygDTO.getFile_name())%>"
															width="200px" height="300px" /></a>
															<br/>
														 <b><p class="text-muted"><%=CmmUtil.nvl(hygDTO.getTitle())%></p></b>
														
														<br/>
													</td>
												
												
												
												
												
												</tr>
											</table>										
										</td>
										
									<%
									}
									%>
									</tr>
                                </table>
								</form>
	                            <p align="right">
	                           	    <button type="button" class="btn btn-outline btn-success" onclick="location.href='/hyg/hygReg.do'">등록</button></a>
									<button type="button" class="btn btn-outline btn-danger" onclick="doDeleteList()">삭제</button>
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
    