<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%@ page import="ac.kr.ft.com.dto.UserDTO"%>
<%
UserDTO rDTO = (UserDTO) request.getAttribute("rDTO");
if (rDTO == null) {
	rDTO = new UserDTO();
}
System.out.print("asdasd : "+ CmmUtil.nvl(rDTO.getUser_name()));

String user_name = CmmUtil.nvl(rDTO.getUser_name()); //이름
String user_id = CmmUtil.nvl(rDTO.getUser_id()); //아이디
String msg = ""; //결과 보여줄 변수

if (user_id.length()==0){
	msg = "아이디가 존재하지 않습니다.";
}

%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <title>라오푸드트럭</title>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">
   	<script type="text/javascript">
   	<%
   	if (msg.length()>0){
   		out.println("alert('"+ msg +"');");
   		out.println("location.href='/user/appIdFindForm.do'");
   	}
   	%>
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
	<!-- find_id result -->
    <div class="content find_id" style='display:block;'>
        <div class="content_wrapper">
        	<header><span>아이디 찾기</span></header>
			<div class='section'>
                <div class="notice desc"><span><%=CmmUtil.nvl(rDTO.getUser_name()) %></span>님!<br/><br/>본인의 아이디는 <span><%=CmmUtil.nvl(rDTO.getUser_id()) %></span> 입니다.</div>
				<a href="/user/appLoginForm.do"><input type="button" title="확인" value="확인" class="btn_global" ></a>
                <div class="notice ask">혹시 비밀번호도 찾으시나요? <a href="/user/appPwFindForm.do"><span>비밀번호 찾기</span></a></div>
        	</div>
		</div>
    </div>
    <!--find id result-->
    <!-- E: CONTENT -->

    <!-- S: FOOTER -->
   <%@include file="/guestinc/appfooter.jsp"%>
    <!-- E: FOOTER -->
</div>
<!-- E: WRAPPER -->
</body>
</html>
