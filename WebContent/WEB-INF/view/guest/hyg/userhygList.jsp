<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="ac.kr.ft.com.dto.HygDTO"%>
<%@ page import="java.util.List"%>   
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
    <title>라오푸드트럭</title>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">
    
    
    
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
        	<header><span>위생인증서</span></header>
			<div class="section">
			
			<%
				Iterator<HygDTO> it = rList.iterator();
				while(it.hasNext()){
					HygDTO rDTO = (HygDTO)it.next();
					
					if (rDTO==null){
						rDTO = new HygDTO();
					}	
					%>
					
					
                   <a href="userHygDetail.do?hgn_seq=<%=CmmUtil.nvl(rDTO.getHgn_seq())%>">
                   
                   <div class='certi'> <img src="<%=CmmUtil.nvl(rDTO.getFile_name())%>"  />
                   
                    </div></a>

	            <%
				}
	             %>
	             

                <div class='wrapper50'>
                   
                  
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
