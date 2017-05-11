<%@page import="ac.kr.ft.com.dto.PositionDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	PositionDTO positionDto = (PositionDTO)request.getAttribute("positionDto");
	if(positionDto==null){
		positionDto = new PositionDTO();
	}
	
	String auth = (String)session.getAttribute("AUTH");
	if(auth == null){
		auth = "";
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>라오푸드트럭</title>
    <meta charset="EUC-KR">
    <meta http-equiv='X-UA-Compatible' content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">
    
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=iUojeNVkR6YtdwiMSzEb"></script>
    <script type="text/javascript">
	function div2Resize() {
        var divmap = document.getElementById('map');
        divmap.style.height = window.innerHeight * 0.7 + 'px';
    }
    window.onload = function() {
        div2Resize();

        // 브라우저 크기가 변할 시 동적으로 사이즈를 조절해야 하는경우
        window.addEventListener('resize', div2Resize);
    }
	</script>
</head>
<%@include file="/inc/apptop.jsp" %>
<body>
<!-- S: WRAPPER -->
<div class="wrapper">
    <!-- S: HEADER -->
	    <%@include file="/inc/appheader.jsp" %>
	    <%@include file="/inc/appmenu.jsp" %>
    <!-- E: HEADER -->

    <!-- S: CONTENT -->
    <!-- join -->
    <div class="content" style="display:block;">
        <div class="content_wrapper">
        	<header><span>위치</span></header>
			<div id="map" style="width:100%;height:500px"></div>
	        <script type="text/javascript">
	        var HOME_PATH = window.HOME_PATH || '.';
	        var cityhall = new naver.maps.LatLng(<%=positionDto.getLat() %>, <%=positionDto.getLng() %>),
	            map = new naver.maps.Map('map', {
	                center: cityhall,
	                zoom: 10
	            }),
	            marker = new naver.maps.Marker({
	                map: map,
	                position: cityhall
	            });

	        /* var contentString = [
	                '<div class="iw_inner">',
	                '   <h3>마지막 위치</h3>',
	                '</div>'
	            ].join('');

	        var infowindow = new naver.maps.InfoWindow({
	            content: contentString,
	            maxWidth: 140,
	            backgroundColor: "#eee",
	            borderColor: "#2db400",
	            borderWidth: 5,
	            anchorSize: new naver.maps.Size(30, 30),
	            anchorSkew: true,
	            anchorColor: "#eee",
	            pixelOffset: new naver.maps.Point(20, -20)
	        }); */

	        naver.maps.Event.addListener(marker, "click", function(e) {
	            if (infowindow.getMap()) {
	                infowindow.close();
	            } else {
	                infowindow.open(map, marker);
	            }
	        });
		    	
	   		</script>
	   		<h3>위치 : <%=positionDto.getTitle() %></h3>
	   		<br/>
        </div>
    </div>
    <!-- join -->
    <!-- E: CONTENT -->

    <!-- S: FOOTER -->
    	<%@include file="/inc/appfooter.jsp" %>
    <!-- E: FOOTER -->
</div>
<!-- E: WRAPPER -->
</body>
</html>
