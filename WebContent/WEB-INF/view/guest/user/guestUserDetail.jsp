<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="ac.kr.ft.com.dto.UserDTO"%>
<%
	UserDTO userDTO = (UserDTO) request.getAttribute("userDTO");
	if (userDTO == null) {
		userDTO = new UserDTO();
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>라오푸드트럭</title>
<meta http-equiv='X-UA-Compatible' content="IE=edge">
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="/css/style.css?ver=2">

<script type="text/javascript">
	function doAction(gubun) {
		var f = document.getElementById("form1");
		if (gubun == "U") {
			f.action = "/user/guestUserUpdateForm.do";
			f.submit();
		} else if (gubun == "D") {
			if (confirm("삭제하시겠습니까?")) {
				f.action = "/user/guestDelete.do";
				f.submit();
			}
		}
	}
</script>
<%@include file="/guestinc/apptop.jsp"%>
</head>
<body>
	<!-- S: WRAPPER -->
	<div class="wrapper">
		<!-- S: HEADER -->
		<%@include file="/guestinc/appheader.jsp"%>
		<!-- E: HEADER -->
		<%@include file="/guestinc/appmenu.jsp"%>
		<!-- S: CONTENT -->
		<!-- join -->
		<div class="content" style="display: block;">
			<div class="content_wrapper">
				<header>
					<span>회원상세</span>
				</header>

					<div class="section">
					<div class='tb_section'>
						<span class='sc_head'>아이디</span> <span class='sc_desc'><%=CmmUtil.nvl(userDTO.getUser_id())%></span>
					</div>
					<div class='tb_section'>
						<span class='sc_head'>생년월일</span> <span class='sc_desc'><%=CmmUtil.nvl(userDTO.getBirthday())%></span>
					</div>
					<div class='tb_section'>
						<span class='sc_head'>이름</span> <span class='sc_desc'><%=CmmUtil.nvl(userDTO.getUser_name())%></span>
					</div>
					<div class='tb_section bl'>
						<span class='sc_head'>마일리지</span> <span class='sc_desc'><%=CmmUtil.nvl(userDTO.getMileage())%></span>
					</div>
					<div class='tb_section'>
						<span class='sc_head'>이메일</span> <span class='sc_desc'><%=CmmUtil.nvl(userDTO.getEmail1())%>@<%=CmmUtil.nvl(userDTO.getEmail2())%></span>
					</div>
					<div class='tb_section bl'>
						<span class='sc_head'>전화번호</span> <span class='sc_desc'><%=CmmUtil.nvl(userDTO.getTel_1())%>-<%=CmmUtil.nvl(userDTO.getTel_2())%>-<%=CmmUtil.nvl(userDTO.getTel_3())%></span>
					</div>
					<div class='wrapper50'>

						<form name="form1" id="form1" method="post">
							<input type="hidden" name="user_no"
								value="<%=CmmUtil.nvl(userDTO.getUser_no())%>">
						</form>

						<input type="submit" title="수정" value="수정" class="btn_tri"
							onclick="doAction('U')"> <input type="submit" title="삭제"
							value="삭제" class="btn_tri" onclick="doAction('D')"> <input
							type="button" title="돌아가기" value="돌아가기" class="btn_tri"
							onclick="location.href='/appmain.do'">

					</div>
				</div>
			</div>
		</div>

		<!-- join -->
		<!-- E: CONTENT -->

		<!-- S: FOOTER -->
		<%@include file="/guestinc/appfooter.jsp"%>
		<!-- E: FOOTER -->
	</div>
	<!-- E: WRAPPER -->
</body>
</html>
