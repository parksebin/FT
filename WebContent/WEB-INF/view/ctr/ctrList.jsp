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
                            
							<script type="text/javascript">
							
							//전체 선택 해제
						function checkboxChange(f, cObj) {
								
								var cbox = document.getElementsByName("del_chk");
								
								//전체 선택한 경우
								if(cObj.checked) {
									for(var i= 0; i<cbox.length;i++) {
										cbox[i].checked = true;
										
									}
								
								//전체 선택해제한 경우
								} else {
									for(var i = 0; i<cbox.length;i++) {
										cbox[i].checked = false ;
										
									}									
								}
							}
							
							
							function checkcheck() {
								var check = document.f.del_chk;
								if(check.length>=1){
									for( var i=0; i<check.length;i++){
										if(check[i].checked){
											return true;
										}
									}
								}
								alert("하나 이상 체크해주시기 바랍니다.");
								return false;
							}
							
							function userupdate_check() {
								var checked = false;
								var check = document.getElementsByName("del_chk");
								var f = document.getElementById("f");
								
								if(check.length){
									for( var i=0; i<check.length;i++){
										if(check[i].checked){
											checked = true;
											break; //하나라도 선택된 것이 있다면, 계속 for문 돌 필요 없음
										}
									}
								}
								
								if (checked){
									if(confirm("선택한것을 수정하시겠습니까?")){
										f.action="/ctr/updateCheck.do";
										f.submit(); //폼 submit;
									}
									
								}else{
									alert("하나도 선택된 것이 없습니다.");
									
								}
							}
							
							function userdel_check() {
								var checked = false; //체크 여부 확인 변수
								var check = document.getElementsByName("del_chk");
								var f = document.getElementById("f"); //폼객체
								
								if(check.length){
									for( var i=0; i<check.length;i++){
										if(check[i].checked){
											checked = true;
											break; //하나라도 선택된 것이 있다면, 계속 for문 돌 필요 없음
										}
									}
								}
								
								//선택된 항목이 있다면..
								if (checked){
									if(confirm("선택한것을 삭제하시겠습니까?")){
										f.submit(); //폼 submit;
									}
									
								}else{
									alert("하나도 선택된 것이 없습니다.");
									
								}
							}

							</script>
                            
                            <form name="f" id="f" method="post" action="deleteAllCheckList.do">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox" name="all" onclick="checkboxChange(this.form, this)"/></th>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>등록일</th>
                                            <th>진행상황</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                            
									    <%
										Iterator<CtrDTO> it = rList.iterator();
										while(it.hasNext()){
											CtrDTO ctrDTO = (CtrDTO)it.next();
											
											if (ctrDTO==null){
												ctrDTO = new CtrDTO();
											}
										%>
										
                                        
                                        <tr class="even gradeA">
                                            <td><input type="checkbox" name="del_chk" value="<%=CmmUtil.nvl(ctrDTO.getCtr_seq())%>"/></td>
				                            <td><%=CmmUtil.nvl(ctrDTO.getCtr_seq())%></td>
                                            <td><a href="/ctr/ctrDetail.do?ctr_seq=<%=CmmUtil.nvl(ctrDTO.getCtr_seq())%>"><%=CmmUtil.nvl(ctrDTO.getTitle())%></a></td>
                                            <td><%=CmmUtil.nvl(ctrDTO.getUser_name())%></td>
                                            <td class="center"><%=CmmUtil.nvl(ctrDTO.getReg_dt())%></td>
                                            
                                            <%-- <td class="center"><%=CmmUtil.nvl(ctrDTO.getProgress())%></td> --%>
                                            
                                             <td  align="right">
                                               <select class="form-control" name="pro_<%=CmmUtil.nvl(ctrDTO.getCtr_seq()) %>" id="auth_<%=CmmUtil.nvl(ctrDTO.getCtr_seq()) %>">
                                                    
                                                     <!-- 
                                                     Register = 신청 
                                                     Register Success = 접수완료
                                                     Progressing = 진행중
                                                     Trade Success = 거래완료
                                                      -->
                                                     
                                                     <% if(CmmUtil.nvl(ctrDTO.getProgress()).equals("R")){
                                                        out.print("<option value='R'>신청</option>");
                                                        out.print("<option value='RS'>접수완료</option>");
                                                        out.print("<option value='P'>진행중</option>");
                                                        out.print("<option value='TS'>거래완료</option>");
                                                     }else if(CmmUtil.nvl(ctrDTO.getProgress()).equals("RS")){
                                                         out.print("<option value='RS'>접수완료</option>");
                                                    	 out.print("<option value='R'>신청</option>");
                                                         out.print("<option value='P'>진행중</option>");
                                                         out.print("<option value='TS'>거래완료</option>");
                                                     }else if(CmmUtil.nvl(ctrDTO.getProgress()).equals("P")){
                                                         out.print("<option value='P'>진행중</option>");
                                                    	 out.print("<option value='R'>신청</option>");
                                                         out.print("<option value='RS'>접수완료</option>");
                                                         out.print("<option value='TS'>거래완료</option>");
                                                     }else if(CmmUtil.nvl(ctrDTO.getProgress()).equals("TS")){
                                                         out.print("<option value='TS'>거래완료</option>");
                                                    	 out.print("<option value='R'>신청</option>");
                                                         out.print("<option value='RS'>접수완료</option>");
                                                         out.print("<option value='P'>진행중</option>");
                                                     }else{
                                                        out.print("오류");
                                                     }
                                                        %>
                                                 
                                               </select>
                                              
                                               <%-- <input type="button" value="수정" onclick="updateOne(<%=CmmUtil.nvl(ctrDTO.getCtr_seq())%>)" class="btn btn-success"/> --%>
                                            </td>
                                            
                                        </tr>
                                      
										<%                                        													
										}
										%>
                                    </tbody>
                                </table>
                               
                                </form>
	                            <p align="right">
	                            	<a href="/ctr/ctrRegform.do"><button class="btn btn-outline btn-success"  align="right">글쓰기</button></a>
	                                <button type="button" value="수정" onclick="userupdate_check()" align="right" class="btn btn-outline btn-warning">수정</button>
	                                <input type="button" value="삭제" align="right" class="btn btn-outline btn-danger" onclick="userdel_check()">
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
    