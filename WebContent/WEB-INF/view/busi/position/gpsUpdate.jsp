<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv='X-UA-Compatible' content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="/css/style.css?ver=2">
<title>라오푸드트럭</title>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
 
<script type="text/javascript">  
function loadPost() {
  if (!!navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(successCallback,errorCallback);  
  }else {
    alert("이 브라우저는 Geolocation를 지원하지 않습니다");
  }
}    
 
function errorCallback(error){
    alert(error.message);
}    
 
function successCallback(position) { 
        var lat = position.coords.latitude;
        var lng = position.coords.longitude;
        document.getElementById("lat").value=lat;
        document.getElementById("lng").value=lng;
}
</script>
<%@include file="/inc/apptop.jsp"%>
</head>
<body onload="loadPost();">
<div class="wrapper">
    <!-- S: HEADER -->
		<%@include file="/inc/appheader.jsp"%>
	<!-- S: WRAPPER -->
	<!-- E: HEADER -->
		<%@include file="/inc/appmenu.jsp"%>
	<!-- S: WRAPPER -->

    <!-- S: CONTENT -->
    <!-- join -->
    <form action="/busi/position/gpsUpdateProc.do" name="f" method="post">
    <div class="content" style="display:block;">
        <div class="content_wrapper">
        	<header><span>위치</span></header>
	       <div class="section">
	       		<div class="input_row">
	       			<span class="input_box">
						<label class="lbl" >제목</label>
						<input type="text" placeholder="제목" class="input_area" value="" name="title">
					</span>
				</div>
				
				<div class="input_row">
					<span class="input_box">
						<label class="lbl" >위도</label>
						<input type="text" placeholder="위도" class="input_area" value="" id="lat" name="lat" />
					</span>
				</div>
				
				<div class="input_row">
					<span class="input_box">
						<label class="lbl" >경도</label>
						<input type="text" placeholder="경도" class="input_area" value="" id="lng" name="lng" />
					</span>
				</div>
        </div>
    </div>
    <!-- join -->
    <!-- E: CONTENT -->
	 <div class="content wrapper50">
	    <input type="submit" title="수정" value="수정" class="btn_half left">
	    <input type="button" title="취소" value="취소" class="btn_half left" onclick="location.href='/busi/position/position.do'">
    </div>
    </form>
    <!-- S: FOOTER -->
    	<%@include file="/inc/appfooter.jsp" %>
    <!-- E: FOOTER -->
</div>
<!-- E: WRAPPER -->

</body>
</html>