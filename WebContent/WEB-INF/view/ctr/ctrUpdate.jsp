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

    <title>케이터링 수정수정</title>

	<%@include file="/inc/top.jsp" %>


	<script type="text/javascript">
		function doAction(gubun) {
			var f = document.getElementById("form1");
			if(gubun=="U"){
				f.action = "ctrUpdate.do";
				f.submit();
			}else if(gubun=="D"){
				if(confirm("삭제하시겠습니까?")){
					f.action = "delete.do";
					f.submit();
				}
			}
		}
		 var SetComma1 = function(str) {

		       var regMustNumberComma = /^[\t|0-9]+$/;
		       str = str.replace(/,/g,'');

		       var retValue = "";
		           for( i = 1; i <= str.length; i++ ) {
		               if( i > 1 && (i%3) == 1 )
		                   retValue = str.charAt(str.length - i) + retValue;
		               else
		                   retValue = str.charAt(str.length - i) + retValue;
		           }
		        
		           if( regMustNumberComma.test(retValue) == false ) {
		               alert("숫자만 입력하실 수 있습니다.");
		               return "";
		           }
		           return retValue;

		   }

		
		function doKeyOnlyNumber(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.KeyCode;
			if((keyID >= 48 && keyID <= 57) || (keyID>=96 && keyID <=105) || keyID==8 || keyID==9 ){
				return true;
			}else{
				return false;
			}
		}
		function disableCheck(obj) {
		    if (obj[obj.selectedIndex].className=='disabled') {
		        alert("이미 완료된 거래입니다.");
		        for (var i=0; obj[i].className=="disabled"; i++); obj.selectedIndex = i; return;
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
			
			
			<form name="f" method="post" action="ctrUpdate.do">
				<input type="hidden" name="ctr_seq" value="<%=CmmUtil.nvl(ctrDto.getCtr_seq()) %>"/>
								
								
			<table border="1" class="table table-striped table-bordered table-hover" id="dataTables-example">
				<tr>
					<td align="center" width="120px"><b>회원이름</b></td>
					<td width="120px" >
						<input type="text" name="user_name"
							value="<%=CmmUtil.nvl(ctrDto.getUser_name())%>"
							class="form-control" style="width :200px"/>
					</td>
					<td align="center" width="120px"><b>날짜</b></td>
					<td width="120px" >
						<input type="text" name="reg_dt" 
							value="<%=CmmUtil.nvl(ctrDto.getReg_dt())%>"
							class="form-control" style="width :170px" onkeyup="this.value=SetComma1(this.value)"/>
					</td>
					<td align="center" width="120px"><b>진행상황</b></td>
					<td width="120px" >
						<select class="form-control" name="progress" onChange="disableCheck(this)">
                        <!-- 
                        Register = 신청 
                        Register Success = 접수완료
                        Progressing = 진행중
                        Trade Success = 거래완료
                        -->
                               <% if(CmmUtil.nvl(ctrDto.getProgress()).equals("R")){
                                  out.print("<option value='R'>신청</option>");
                                  out.print("<option value='RS'>접수완료</option>");
                                  out.print("<option value='P'>진행중</option>");
                                  out.print("<option value='TS'>거래완료</option>");
                               }else if(CmmUtil.nvl(ctrDto.getProgress()).equals("RS")){
                                   out.print("<option value='RS'>접수완료</option>");
                              		out.print("<option value='R'>신청</option>");
                                   out.print("<option value='P'>진행중</option>");
                                   out.print("<option value='TS'>거래완료</option>");
                               }else if(CmmUtil.nvl(ctrDto.getProgress()).equals("P")){
                                   out.print("<option value='P'>진행중</option>");
                              	 out.print("<option value='R'>신청</option>");
                                   out.print("<option value='RS'>접수완료</option>");
                                   out.print("<option value='TS'>거래완료</option>");
                               }else if(CmmUtil.nvl(ctrDto.getProgress()).equals("TS")){
                                   out.print("<option value='TS'>거래완료</option>");
                              	 out.print("<option value='R' class=disabled >신청</option>");
                                   out.print("<option value='RS'class=disabled >접수완료</option>");
                                   out.print("<option value='P' class=disabled >진행중</option>");
                               }else{
                                  out.print("오류");
                               }
                                  %>
                        </select>
					</td>
				</tr>
					
				<tr>
					<td align="center"><b>이메일</b></td>
					<td colspan="5">
					<input type="text" name="email1" value="<%=CmmUtil.nvl(ctrDto.getEmail1()) %>" class="form-control" style="width :120px"/> 
					@<input type="text" name="email2" value="<%=CmmUtil.nvl(ctrDto.getEmail2()) %>" class="form-control" style="width :120px"/>
					</td>	
				</tr>
				
				<tr>
					<td align="center"><b>휴대전화</b></td>
					<td colspan="5">
						<input type="text" name="tel_1" value="<%=CmmUtil.nvl(ctrDto.getTel_1())%>" class="form-control" style="width :80px" onkeyup="this.value=SetComma1(this.value)"/>
						-<input type="text" name="tel_2" value="<%=CmmUtil.nvl(ctrDto.getTel_2())%>" maxlength="4" class="form-control" style="width :80px" onkeyup="this.value=SetComma1(this.value)"/>
						-<input type="text" name="tel_3" value="<%=CmmUtil.nvl(ctrDto.getTel_3())%>" maxlength="4" class="form-control" style="width :80px" onkeyup="this.value=SetComma1(this.value)"/></td>		
				</tr>
				<!-- ★제목 부분의 value 값이 핵심임 ★ -->
				<tr>
					<td align="center"><b>제목</b></td>
					<td colspan="2"><input type="text" name="title" value="<%=CmmUtil.nvl(ctrDto.getTitle())%>" class="form-control" style="width :350px"/></td>
					
				<%-- <td align="center"><b>공지여부</b></td>
				<td colspan="2"><%if(CmmUtil.nvl(ctrDto.getCtr_yn()).equals("1")){
					out.print("예");
					out.print("<input type='radio' name='ctr_yn' value='1' checked/>");
					out.print("아니오");
					out.print("<input type='radio' name='ctr_yn' value='2' />");
				 }else{
					out.print("예");
					out.print("<input type='radio' name='ctr_yn' value='1'/>");
					out.print("아니오");
					out.print("<input type='radio' name='ctr_yn' value='2' checked/>");
				 }%>
			 	</td> --%>
					
				</tr>
				<tr>
					<td align="center"><b>내용</b></td>
					<td colspan="5">
						<textarea name="contents" rows="10" cols="20" class="form-control"><%=CmmUtil.nvl(ctrDto.getContents())%></textarea>
					</td>
				</tr>
</table>
	                            <p align="right">
									<!-- <input type="button" value="수정" onclick="doAction('U')" />
									<input type="button" value="삭제" onclick="doAction('D')"/> -->
									<input type="submit" value="확인" class="btn btn-outline btn-success"/>
									<input type="button" value="취소" onclick="location.href='/ctr/ctrList.do'" class="btn btn-outline btn-danger"/>
	                            </p>
	                            
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
    