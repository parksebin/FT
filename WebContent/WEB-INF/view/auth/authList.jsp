<%@page import="ac.kr.ft.com.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.CtrDTO"%>
<%@page import="java.util.List"%>    
<%
List<UserDTO> rList = (List<UserDTO>)request.getAttribute("list"); 

if (rList==null){
	rList = new ArrayList<UserDTO>();
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
    
	<script type="text/javascript">
	function updateOne(user_no) {
		var user_no = user_no;
		var x = document.getElementById('auth_'+user_no)
		x = x.options[x.selectedIndex].value;
		location.href="updateOne.do?user_no="+user_no+"&auth="+x;
	}
	
	function checkboxChange() {
		cbox = document.f.check;
	    if(cbox.length) {  // 여러 개일 경우
	        for(var i = 0; i<cbox.length;i++) {
	            cbox[i].checked=f.all.checked;
	        }
	    } else { // 한 개일 경우
	        cbox.checked=f.all.checked;
	    }
	}
	
	function checkcheck(f) {
		var check = f.check;
		if(check.length){
			for( var i=0; i<check.length;i++){
				if(check[i].checked){
					return true;
				}
			}
		}
		alert("하나 이상 체크해주시기 바랍니다.");
		return false;
	}
	</script>
    <title>권한</title>

	<%@include file="/inc/top.jsp" %>

</head>

<body>

    <div id="wrapper">

	<%@include file="/inc/menu.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">권한 관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">권한
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                            	<form name="f" action="updateAll.do" onsubmit="return checkcheck(this)">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th width="5%"><input type="checkbox" name="all" onclick="checkboxChange()"/></th>
                                            <th width="20%">유저 번호</th>
                                            <th width="25%">유저 아이디</th>
                                            <th width="25%">유저 이름</th>
                                            <th width="25%">권한</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
									    <%
										Iterator<UserDTO> it = rList.iterator();
										while(it.hasNext()){
											UserDTO userDTO = (UserDTO)it.next();
											
											if (userDTO==null){
												userDTO = new UserDTO();
											}
										%>
										
                                        <tr class="even gradeA">
                                            <td><input type="checkbox" name="check" value="<%=CmmUtil.nvl(userDTO.getUser_no())%>"/></td>
                                            <td><%=CmmUtil.nvl(userDTO.getUser_no())%></td>
                                            <td><%=CmmUtil.nvl(userDTO.getUser_id())%></td>
                                            <td><%=CmmUtil.nvl(userDTO.getUser_name())%></td>
                                            <td  align="right">
                                            	<select class="form-control" name="auth_<%=CmmUtil.nvl(userDTO.getUser_no()) %>" id="auth_<%=CmmUtil.nvl(userDTO.getUser_no()) %>">
                                            		<option value="<%=CmmUtil.nvl(userDTO.getAuth())%>">
                                            			<% if(userDTO.getAuth().equals("A")){
                                            				out.print("Admin");
                                            			}else if(userDTO.getAuth().equals("P")){
                                            				out.print("President");
                                            			}else if(userDTO.getAuth().equals("U")){
                                            				out.print("User");
                                            			}else{
                                            				out.print("오류");
                                            			}
                                            				%>
                                            		</option>
                                            		<option value="A">Admin</option>
                                            		<option value="P">President</option>
                                            		<option value="U">User</option>
                                            	</select>
                                            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            	<input type="button" value="수정" onclick="updateOne(<%=CmmUtil.nvl(userDTO.getUser_no())%>)" class="btn btn-primary" />
                                            </td>
                                        </tr>
										<%                                        													
										}
										%>
                                    </tbody>
                                </table>
                                 <p align="right">
	                                <input type="submit" class="btn btn-primary" value="전체 수정"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
    