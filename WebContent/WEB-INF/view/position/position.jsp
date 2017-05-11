<%@page import="ac.kr.ft.com.dto.PositionDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	PositionDTO positionDto = (PositionDTO)request.getAttribute("positionDto");
	if(positionDto==null){
		positionDto = new PositionDTO();
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<title>위치</title>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=VWiK2HOmrEBqn2f11FM7"></script>
	<%@include file="/inc/top.jsp" %>
	<style type="text/css">
	#map { height: 600px; }
	</style>	
</head>

<body>
<!-- 되는거 -->
    <div id="wrapper">

	<%@include file="/inc/menu.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">위치</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">위치
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                            <div id="map" style="width:100%;height:600px;"></div>
                            	<script type="text/javascript">
	        var HOME_PATH = window.HOME_PATH || '.';
	        var cityhall = new naver.maps.LatLng(<%=positionDto.getLat() %>, <%=positionDto.getLng() %>),
	            map = new naver.maps.Map('map', {
	                center: cityhall,
	                zoom: 11
	            }),
	            marker = new naver.maps.Marker({
	                map: map,
	                position: cityhall
	            });

	       /*  var infowindow = new naver.maps.InfoWindow({
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
	   					<table width="100%">
	   					<tr>
	   						<td align="center"><h3>위치는 <%=positionDto.getTitle() %>입니다.</h3></td>
	   					</tr>
	   					<tr>
	   					<td align="right">
	   						<input type="button" onclick="location.href='/position/positionGps.do'" value="위치 수정" class="btn btn-outline btn-success"/>
	   					</td>
	   					</tr>
	   					</table>
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
    