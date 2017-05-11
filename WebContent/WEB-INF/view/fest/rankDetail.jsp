<%@page import="ac.kr.ft.com.dto.PositionDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.FestivalDTO"%>
<%
	FestivalDTO festivalDTO = (FestivalDTO) request.getAttribute("festivalDTO");

	if (festivalDTO == null) {
		festivalDTO = new FestivalDTO();

	}
	
	PositionDTO pDto = (PositionDTO)request.getAttribute("pDto");
	if(pDto == null){
		pDto = new PositionDTO();
	}
	String reg_dt = CmmUtil.nvl(festivalDTO.getReg_dt());
	String chg_dt = CmmUtil.nvl(festivalDTO.getChg_dt());
	
%>
<%
java.util.Calendar cal2= java.util.Calendar.getInstance();
java.util.Calendar cal3 = java.util.Calendar.getInstance();
java.util.Calendar cal4 = java.util.Calendar.getInstance();
java.util.Calendar cal5 = java.util.Calendar.getInstance();
java.util.Calendar cal6 = java.util.Calendar.getInstance();
java.util.Calendar cal7 = java.util.Calendar.getInstance();
java.util.Calendar cal8 = java.util.Calendar.getInstance();
java.util.Calendar cal9 = java.util.Calendar.getInstance();
java.util.Calendar cal10 = java.util.Calendar.getInstance();
java.text.DateFormat format = new java.text.SimpleDateFormat("MM월dd일");

/* cal.add(cal.DATE, -7); */ // 7일(일주일)을 뺀다

cal2.add(cal2.DATE, +2);
String dateStr2 = format.format(cal2.getTime());

cal3.add(cal3.DATE, +3);
String dateStr3 = format.format(cal3.getTime());

cal4.add(cal4.DATE, +4);
String dateStr4 = format.format(cal4.getTime());

cal5.add(cal5.DATE, +5);
String dateStr5 = format.format(cal5.getTime());

cal6.add(cal6.DATE, +6);
String dateStr6 = format.format(cal6.getTime());

cal7.add(cal7.DATE, +7);
String dateStr7 = format.format(cal7.getTime());

cal8.add(cal8.DATE, +8);
String dateStr8 = format.format(cal8.getTime());

cal9.add(cal9.DATE, +9);
String dateStr9 = format.format(cal9.getTime());

cal10.add(cal10.DATE, +10);
String dateStr10 = format.format(cal10.getTime());


%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>종합순위정보 조회</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=MxtHPNDC0H0NXo1wh6XK"></script>
<%@include file="/inc/top.jsp"%>



</head>

<body>

	<div id="wrapper">

		<%@include file="/inc/menu.jsp"%>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">종합순위 정보</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">종합순위 정보</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<form name="form1" id="form1" method="post">
									<input type="hidden" name=fst_seq
										value="<%=CmmUtil.nvl(festivalDTO.getFst_seq())%>" />
									<table align="center" style="width: 100%" border="1"
										class="table table-striped table-bordered table-hover">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">

										<tr>
											<td align="center"><b>등록자</b></td>
											<td colspan="4"><%=CmmUtil.nvl(festivalDTO.getReg_user_name())%></td>
											<td align="center"><b>등록일</b></td>
											<td colspan="4">
												<%
													if (reg_dt.length() == 8) {
												%> <%=reg_dt.substring(0, 4)%>년 <%=reg_dt.substring(4, 6)%>월
												<%=reg_dt.substring(6)%>일 <%
 	} else {
 %> <%
 	}
 %>
											</td>
										</tr>
										<tr>
											<td align="center"><b>수정자</b></td>
											<td colspan="4"><%=CmmUtil.nvl(festivalDTO.getChg_user_name())%></td>
											<td align="center"><b>수정일</b></td>
											<td colspan="4">
												<%
													if (chg_dt.length() == 8) {
												%> <%=chg_dt.substring(0, 4)%>년 <%=chg_dt.substring(4, 6)%>월
												<%=chg_dt.substring(6)%>일 <%
 	} else {
 %> <%
 	}
 %>
											</td>
										</tr>
										<tr>
										<td align="center"><b>날짜</b></td>
										<td align="center"> <%=dateStr2 %></td>
										<td align="center"> <%=dateStr3 %></td>
										<td align="center"> <%=dateStr4 %></td>
										<td align="center"> <%=dateStr5 %></td>
										<td align="center"> <%=dateStr6 %></td>
										<td align="center"> <%=dateStr7 %></td>
										<td align="center"> <%=dateStr8 %></td>
										<td align="center"> <%=dateStr9 %></td>
										<td align="center"> <%=dateStr10 %></td>
										</tr>
										<tr>
											<td align="center"><b>날씨</b></td>
											<%
												for (int i = 2; i < 11; i++) {
													String amCodeiday = (String) request.getAttribute("amCode" + i + "day");
													String j = "";
													if(amCodeiday.equals("SKY_W01")){
														j = "01";
													}else if(amCodeiday.equals("SKY_W02")){
														j = "02";
													}else if(amCodeiday.equals("SKY_W03")){
														j = "03";
													}else if(amCodeiday.equals("SKY_W04")){
														j = "18";
													}else if(amCodeiday.equals("SKY_W07")){
														j = "21";
													}else if(amCodeiday.equals("SKY_W09")){
														j = "12";
													}else if(amCodeiday.equals("SKY_W10")){
														j = "21";
													}else if(amCodeiday.equals("SKY_W11")){
														j = "04";
													}else if(amCodeiday.equals("SKY_W12")){
														j = "13";
													}else if(amCodeiday.equals("SKY_W13")){
														j = "32";
													}
													
											%>

											<td align="center"><img src="${pageContext.request.contextPath}/resources/icons/<%=j%>.png" width="30"></td>

											<%
												}
											%>
										</tr>
										<tr>
											<td align="center"><b>구름상태</b></td>
											<%
												for (int i = 2; i < 11; i++) {
													String amNameiday = (String) request.getAttribute("amName" + i + "day");
											%>

											<td align="center"><%=amNameiday%></td>

											<%
												}
											%>
										
										


										<tr>
											<td align="center"><b>최저온도</b></td>
											<%
												for (int i = 2; i < 11; i++) {
													String tminiday = (String) request.getAttribute("tmin" + i + "day");
											%>

											<td align="center"><%=tminiday%>˚C</td>

											<%
												}
											%>
										</tr>
										<tr>
											<td align="center"><b>최고온도</b></td>
											<%
												for (int i = 2; i < 11; i++) {
													String tmaxiday = (String) request.getAttribute("tmax" + i + "day");
											%>

											<td align="center"><%=tmaxiday%>˚C</td>

											<%
												}
											%>
										</tr>
										<tr>
											<td align="center"><b>관광지</b></td>
											<td colspan="9"><%=CmmUtil.nvl(festivalDTO.getAttractions())%></td>
										</tr>
										<tr>
											<td align="center"><b>입장료 유무</b></td>
											<td colspan="4"><%=CmmUtil.nvl(festivalDTO.getPay())%></td>
											<td align="center"><b>이용객</b></td>
											<td colspan="4"><%=CmmUtil.nvl(festivalDTO.getNation())%></td>
										</tr>
										<tr>
											<td align="center"><b>1월</b></td>
											<td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getJan(), "0")) + " 명"%></td>
											<td align="center"><b>2월</b></td>
											<td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getFeb(), "0")) + " 명"%></td>
											<td align="center"><b>3월</b></td>
											<td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getMar(), "0")) + " 명"%></td>
											<td align="center"><b>4월</b></td>
											<td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getApr(), "0")) + " 명"%></td>
											<td align="center"><b>5월</b></td>
											<td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getMay(), "0")) + " 명"%></td>

										</tr>
										<tr>
											<td align="center"><b>6월</b></td>
											<td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getJun(), "0")) + " 명"%></td>
											<td align="center"><b>7월</b></td>
											<td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getJul(), "0")) + " 명"%></td>
											<td align="center"><b>8월</b></td>
											<td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getAug(), "0")) + " 명"%></td>
											<td align="center"><b>9월</b></td>
											<td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getSep(), "0")) + " 명"%></td>
											<td align="center"><b>10월</b></td>
											<td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getOct(), "0")) + " 명"%></td>
										</tr>
										<tr>
										<td align="center"><b>11월</b></td>
											<td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getNov(), "0")) + " 명"%></td>
											<td align="center"><b>12월</b></td>
											<td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getDec(), "0")) + " 명"%></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<%-- <tr>

											<td align="center"><b>9월</b></td>
											<td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getSep(), "0")) + " 명"%></td>
											<td align="center"><b>10월</b></td>
											<td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getOct(), "0")) + " 명"%></td>
											<td align="center"><b>11월</b></td>
											<td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getNov(), "0")) + " 명"%></td>
											<td align="center"><b>12월</b></td>
											<td><%=CmmUtil.viewComma(CmmUtil.nvl(festivalDTO.getDec(), "0")) + " 명"%></td>
										</tr> --%>
										<tr>
											<td align="center" valign="middle" height="100px"><b>축제
													사진</b></td>
											<td align="center" colspan="9" height="100px"><img
												src="<%=CmmUtil.nvl(festivalDTO.getFile_name())%>" /></td>
										</tr>
										<tr>
											<td align="center" valign="middle" height="100px"><b>축제설명</b></td>
											<td align="center" colspan="9" height="100px"><%=CmmUtil.nvl(festivalDTO.getFst_exp())%></td>
										</tr>
										<tr>
											<td align="center" colspan="10">
											<div id="map" style="width:100%;height:600px;"></div>
                            	<script type="text/javascript">
	        var HOME_PATH = window.HOME_PATH || '.';
	        var cityhall = new naver.maps.LatLng(<%=CmmUtil.nvl(pDto.getLat()) %>, <%=CmmUtil.nvl(pDto.getLng()) %>),
	            map = new naver.maps.Map('map', {
	                center: cityhall,
	                zoom: 10
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
											</td>
										</tr>
										<tr>
											<td align="center"><b>관광지<br />담당부서
											</b></td>
											<td colspan="4"><%=CmmUtil.nvl(festivalDTO.getFst_host())%></td>
											<td align="center"><b>담당자<br />연락처
											</b></td>
											<td colspan="4"><%=CmmUtil.nvl(festivalDTO.getHostph_1())%>
												-<%=CmmUtil.nvl(festivalDTO.getHostph_2())%> -<%=CmmUtil.nvl(festivalDTO.getHostph_3())%>
											</td>
										</tr>
										</tbody>
									</table>

									<p align="right">
										<a href="javascript:history.go(-1)"
											class="btn btn-outline btn-default"> 목록</a>
									</p>
									<%--    <input type="hidden" name="fst_seq" value="<%=CmmUtil.nvl(festivalDTO.getFst_seq()) %>"> --%>
								</form>






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