<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%
	List<UserDTO> rList = (List<UserDTO>) request.getAttribute("rList");

	if (rList == null) {
		rList = new ArrayList<UserDTO>();
	}
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<%@include file="/inc/top.jsp"%>
<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>회원 리스트</title>

<script type="text/javascript">
	//전체 선택 해제
	function checkboxChange(f, cObj) {

		var cbox = document.getElementsByName("del_chk");

		//전체 선택한 경우
		if (cObj.checked) {
			for (var i = 0; i < cbox.length; i++) {
				cbox[i].checked = true;

			}

			//전체 선택해제한 경우
		} else {
			for (var i = 0; i < cbox.length; i++) {
				cbox[i].checked = false;

			}
		}
	}

	function checkcheck() {
		var check = document.f.del_chk;
		if (check.length >= 1) {
			for (var i = 0; i < check.length; i++) {
				if (check[i].checked) {
					return true;
				}
			}
		}
		alert("하나 이상 체크해주시기 바랍니다.");
		return false;
	}

	function userdel_check() {
		var checked = false; //체크 여부 확인 변수
		var check = document.getElementsByName("del_chk");
		var f = document.getElementById("f"); //폼객체

		if (check.length) {
			for (var i = 0; i < check.length; i++) {
				if (check[i].checked) {
					checked = true;
					break; //하나라도 선택된 것이 있다면, 계속 for문 돌 필요 없음
				}
			}
		}

		//선택된 항목이 있다면..
		if (checked) {
			if (confirm("선택한것을 삭제하시겠습니까?")) {
				f.submit(); //폼 submit;
			}

		} else {
			alert("하나도 선택된 것이 없습니다.");

		}
	}
	
	//팝업 띄우기
	function doPopUp(url, w, h) {
		
		var cw=screen.availWidth;     //화면 넓이
		var ch=screen.availHeight;    //화면 높이
		
		var ml=(cw-w)/2; //가운데 띄우기위한 창의 x위치
		var mt=(ch-h)/2; //가운데 띄우기위한 창의 y위치
		
		window.open(url, "", "width="+ w +",height="+ h +",top="+ mt +",left="+ ml +",resizable=no,scrollbars=yes");
	}
	
</script>

</head>
<body>

	<div id="wrapper">

		<%@include file="/inc/menu.jsp"%>
	
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">회원 관리</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">회원관리 리스트</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">

								<form id="f" name="f" method="post" action="deleteCheck.do">
									<table width="100%"
										class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th width="90"><input type="checkbox" name="all" onclick="checkboxChange(this.form, this)" /> 전체</th>
												<th>아이디</th>
												<th>이름</th>
												<th>전화번호</th>
												<th>등록일</th>
											</tr>
										</thead>
										<tbody>

											<%
												Iterator<UserDTO> it = rList.iterator();
												while (it.hasNext()) {
													UserDTO userDTO = (UserDTO) it.next();

													if (userDTO == null) {
														userDTO = new UserDTO();
													}
											%>

											<tr class="even gradeA">

												<td><input type="checkbox" name="del_chk" value="<%=CmmUtil.nvl(userDTO.getUser_no())%>"/></td>
												<td><a href="userdetail.do?user_no=<%=CmmUtil.nvl(userDTO.getUser_no())%>"><%=CmmUtil.nvl(userDTO.getUser_id())%></a></td>
												<td><%=CmmUtil.nvl(userDTO.getUser_name())%>
												<td><%=CmmUtil.nvl(userDTO.getTel_1())%>-<%=CmmUtil.nvl(userDTO.getTel_2())%>-<%=CmmUtil.nvl(userDTO.getTel_3())%></td>
												<td><%=CmmUtil.nvl(userDTO.getReg_dt())%></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table>

								</form>
								<p align="right">
									<a href="javascript:doPopUp('/user/userinsertForm.do', 650, 500);">
									<button type="button" class="btn btn-outline btn-success">등록</button></a> 
									<input type="button" value="삭제" class="btn btn-outline btn-danger" onclick="userdel_check()">

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
