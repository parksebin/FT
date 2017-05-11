<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="ac.kr.ft.com.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	UserDTO userDTO = (UserDTO) request.getAttribute("userDTO");
	if (userDTO == null) {
		userDTO = new UserDTO();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 상세정보</title>
<%@include file="/inc/top.jsp"%>

<script type="text/javascript">
	function doAction(gubun) {
		var f = document.getElementById("form1");
		if (gubun == "U") {
			f.action = "userupdateForm.do";
			f.submit();
		} else if (gubun == "D") {
			if (confirm("삭제하시겠습니까?")) {
				f.action = "delete.do";
				f.submit();
			}
		}
	}
</script>


</head>
<body>

	<%@include file="/inc/menu.jsp"%>

	<div id="wrapper">


		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h3><%=CmmUtil.nvl(userDTO.getUser_name())%>님의 회원 상세정보
					</h3>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading"><%=CmmUtil.nvl(userDTO.getUser_name())%>님의 회원 상세
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">

								<table width="100%"
									class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<tbody>
										<tr>
											<td width="150px"><b>아이디</b></td>
											<td><%=CmmUtil.nvl(userDTO.getUser_id())%></td>
										</tr>

										<tr>
											<td style="width: 300px"><b>비밀번호</b></td>
											<td><%=CmmUtil.nvl(userDTO.getPassword())%></td>
										</tr>
										<tr>
											<td align="left"><b>이름</b></td>
											<td><%=CmmUtil.nvl(userDTO.getUser_name())%></td>
										</tr>
										<tr>
											<td><b>이메일</b></td>
											<td><%=CmmUtil.nvl(userDTO.getEmail1())%>@<%=CmmUtil.nvl(userDTO.getEmail2())%></td>
										</tr>
										<tr>
											<td>전화번호</td>
											<td><%=CmmUtil.nvl(userDTO.getTel_1())%>-<%=CmmUtil.nvl(userDTO.getTel_2())%>-<%=CmmUtil.nvl(userDTO.getTel_3())%></td>
										</tr>
										<tr>
											<td>생년월일</td>
											<td><%=CmmUtil.nvl(userDTO.getBirthday())%></td>
										</tr>

									</tbody>
								</table>


								<form name="form1" id="form1" method="post">
									<input type="hidden" name="user_no"
										value="<%=CmmUtil.nvl(userDTO.getUser_no())%>">
								</form>

								<p align="right">
									<input type=button value="수정" class="btn btn-outline btn-warning" onclick="doAction('U')"> 
									<input type=button value="삭제" class="btn btn-outline btn-danger" onclick="doAction('D')"> 
									<input type=button value="목록" class="btn btn-outline btn-defult" onclick="location.href='userlist.do'" /><br />
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
	<script
		src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
	<script
		src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
	<script
		src="../bower_components/datatables-responsive/js/dataTables.responsive.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../dist/js/sb-admin-2.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>


</body>

</html>