<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="ac.kr.ft.com.dto.HygDTO"%>
<%@ page import="java.util.List"%>   
<%

%>    
<%
HygDTO hygDto = (HygDTO)request.getAttribute("hygDto"); 

if (hygDto==null){
	hygDto = new HygDTO();
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
	function doAction(gubun) {
		var f = document.getElementById("form1");
		if (gubun == "U") {
			f.action = "busiupdateForm.do";
			f.submit();
		} else if (gubun == "D") {
			if (confirm("삭제하시겠습니까?")) {
				f.action = "busidelete.do";
				f.submit();
			}
		}
	}
      </script>
      <%@include file="/guestinc/apptop.jsp" %>
</head>
<body>
<!-- S: WRAPPER -->
<div class="wrapper">
    <!-- S: HEADER -->
  <%@include file="/guestinc/appheader.jsp"%>
    <!-- E: HEADER -->

    <!-- S: CONTENT -->
    <%@include file="/guestinc/appmenu.jsp"%>
    <!-- join -->
    <div class="content" style="display:block;">
        <div class="content_wrapper">
        	<header><span>위생인증 푸드트럭</span></header>
			<div class="section">
			<%=CmmUtil.nvl(hygDto.getTitle())%>
                <div class='certi_main'><img src="<%=CmmUtil.nvl(hygDto.getFile_name())%>" /></div>
             
															
                <div class='tb_section bl'>
                    <span class="certi_desc">
                    <form name="form1" id="form1" method="post">
                    <input type="hidden" name="hgn_seq" value="<%=CmmUtil.nvl(hygDto.getHgn_seq()) %>">
                    
                       
                       <%=CmmUtil.nvl(hygDto.getContents())%>
                	</form>  
                       </span>
                </div>
                <div class='wrapper50'>
                    
                    <input type="button" title="목록" value="목록" class="btn_global" onclick="location.href='/hyg/userHygList.do'">
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
