<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.CtrDTO"%>
<%
	CtrDTO ctrDto = (CtrDTO) request.getAttribute("ctrDto");

	if (ctrDto == null) {
		ctrDto = new CtrDTO();
	}
	
	/* String auth = (String)request.getSession().getAttribute("AUTH");
	if (auth == null){
		auth = "";
	} */
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>라오푸드트럭</title>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="/css/style.css?ver=2">

<script type="text/javascript">
	function doAction(gubun) {
		var f = document.getElementById("form1");
		if (gubun == "U") {
			f.action = "GuestctrUpdateForm.do";
			f.submit();
		} else if (gubun == "D") {
			if (confirm("삭제하시겠습니까?")) {
				f.action = "Guestdelete.do";
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
		<!-- S: WRAPPER -->
		<!-- E: HEADER -->
		<%@include file="/guestinc/appmenu.jsp"%>
		<!-- S: WRAPPER -->
		<!-- S: CONTENT -->
		<!-- join -->
		<div class="content view" style="display: block;">
			<div class="content_wrapper">
				<header>
					<div class='view_title'>
						<%=CmmUtil.nvl(ctrDto.getTitle())%>
					</div>
					<span class='view_info'> <span><%=CmmUtil.nvl(ctrDto.getUser_name())%></span>  <br /> <%=CmmUtil.nvl(ctrDto.getReg_dt())%>
					</span>
				</header>

				<div class="section">

					<!-- 폼테그 모르겠음. -->
					<form name="f" method="post">

						<div class='tb_section'>
							<span class="sc_head">제목</span> <span class="sc_desc"><%=CmmUtil.nvl(ctrDto.getTitle())%></span>
						</div>

						<div class='tb_section'>
							<span class="sc_head">날짜</span> <span class="sc_desc"><%=CmmUtil.nvl(ctrDto.getReg_dt())%></span>
						</div>

						<div class='tb_section'>
							<span class="sc_head">진행상황</span> <span class="sc_desc">
								<%
									if (CmmUtil.nvl(ctrDto.getProgress()).equals("R")) {
										out.print("신청");
									} else if (CmmUtil.nvl(ctrDto.getProgress()).equals("RS")) {
										out.print("접수완료");
									} else if (CmmUtil.nvl(ctrDto.getProgress()).equals("P")) {
										out.print("진행중");
									} else if (CmmUtil.nvl(ctrDto.getProgress()).equals("TS")) {
										out.print("거래완료");
									} else {
										out.print("오류");
									}
								%>
							</span>
						</div>

						<div class='tb_section'>
							<span class="sc_head">예상인원</span> <span class="sc_desc"><%=CmmUtil.nvl(ctrDto.getPeople())%></span>
						</div>

						<div class='tb_section bl'>
							<span class="sc_head">장소</span> <span class="sc_desc"><%=CmmUtil.nvl(ctrDto.getPlace())%></span>
						</div>

						<div class='tb_section'>
							<span class="sc_head">이름</span> <span class="sc_desc"><%=CmmUtil.nvl(ctrDto.getUser_name())%></span>
						</div>

						<div class='tb_section'>
							<span class="sc_head">전화번호</span> <span class="sc_desc"><%=CmmUtil.nvl(ctrDto.getTel_1())%>
								-<%=CmmUtil.nvl(ctrDto.getTel_2())%> -<%=CmmUtil.nvl(ctrDto.getTel_3())%></span>
						</div>

						<%--                 <div class='tb_section'>
                    <span class="sc_head">공지여부</span>
                    <span class="sc_desc"><% if(CmmUtil.nvl(ctrDto.getCtr_yn()).equals("1")){
                                                         out.print("예");
                                         			 }else if(CmmUtil.nvl(ctrDto.getCtr_yn()).equals("2")){
                                                         out.print("아니오");
                                                     }else{
                                                        out.print("오류");
                                                     }
                                          			  %></span>
                </div> --%>

						<div class='tb_section'>
							<!-- <span class="sc_head">내용</span> --> <span class="sc_desc"><%=CmmUtil.nvl(ctrDto.getContents())%></span>
						</div>

						<div class='wrapper50'>
					<%-- 	<%if(auth.equals("A") || auth.equals("P")) {%>
							<input type="button" value="수정" onclick="doAction('U')" class="btn_tri" /> 
							<input type="button" value="삭제" onclick="doAction('D')" class="btn_tri" /> 
							<input type="button" value="목록" onclick="location.href='/ctr/GuestctrList.do'" class="btn_tri"/>
						<%} else if(auth.equals("U")){ %> --%>
							<input type="button" value="수정" onclick="doAction('U')" class="btn_half" />
							<input type="button" value="목록" onclick="location.href='/ctr/GuestctrList.do'" class="btn_half" />
				<%-- 		<%} %> --%>
					</form>

					<!-- 아 폼테그 모르겠어. 도와줘 -->
					<form name="form1" id="form1" method="post">
						<input type="hidden" name="ctr_seq"
							value="<%=CmmUtil.nvl(ctrDto.getCtr_seq())%>">
					</form>

				</div>
			</div>
		</div>
	</div>
	<!-- join -->
	<!-- E: CONTENT -->

	<!-- S: FOOTER -->
	<%@include file="/guestinc/appfooter.jsp"%>
	<!-- S: WRAPPER -->
	<!-- E: FOOTER -->
	</div>
	<!-- E: WRAPPER -->
</body>
</html>
