 <%@page import="java.text.DecimalFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ac.kr.ft.com.dto.ComDTO"%>
<%@page import="ac.kr.ft.com.dto.VisitorDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	VisitorDTO visitorDto = (VisitorDTO)request.getAttribute("visitorDto");
	if(visitorDto == null){
		visitorDto = new VisitorDTO();
	}
	
	ComDTO comDto = (ComDTO)request.getAttribute("comDto");
	if(comDto == null){
		comDto = new ComDTO();
	}
	
	List<ComDTO> list = (List<ComDTO>)request.getAttribute("list");
	if(list == null){
		list = new ArrayList<ComDTO>();
	}
	
	JSONObject json = (JSONObject)request.getAttribute("json");
	if(json == null){
		json = new JSONObject();
	}
	
	DecimalFormat df = new DecimalFormat("#,##0");
	long visitor_cnt = Long.parseLong(CmmUtil.nvl(visitorDto.getVisitor_cnt(),"0"));
	long community_cnt = Long.parseLong(CmmUtil.nvl(comDto.getCommunity_cnt(),"0"));
	long ctrR_cnt = Long.parseLong(CmmUtil.nvl(comDto.getCtrR_cnt(),"0"));
	
	visitorDto.setVisitor_cnt(df.format(visitor_cnt));
	comDto.setCommunity_cnt(df.format(community_cnt));
	comDto.setCtrR_cnt(df.format(ctrR_cnt));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Food Truck Admin">
<meta name="author" content="Super Developer">

<title>Food Truck Administrator</title>
<script>
var datas = JSON.parse('<%=json.get("data") %>');

      function drawChart() {
      var jsonData = $.getJSON(datas, function(json) {
    console.log(json); // show the info in console
});
        Morris.Area({
              element: 'morris-area-chart',
              data: <%=json.get("data") %>,
              xkey: 'days',
              ykeys: ['방문자 수', '새로운 문의', '새로운 주문'],
              labels: ['방문자 수', '새로운 문의', '새로운 주문'],
              pointSize: 2,
              hideHover: 'auto',
              resize: true,
              lineColors: ['#428bca', '#5cb85c', '#f0ad4e']
            });
      }
</script>
<%@include file="/inc/top.jsp"%>

</head>
<body onload="drawChart()">

	<div id="wrapper">

		<%@include file="/inc/menu.jsp"%>


		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">주요 정보</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-comments fa-5x"></i>
								</div>
								<!-- 모바일 매인 화면에 들어온 사람의 수 -->
								<div class="col-xs-9 text-right">
									<div class="huge"><%=CmmUtil.nvl(visitorDto.getVisitor_cnt(),"0") %></div>
									<div>방문자 수</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<div class="panel panel-green">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-tasks fa-5x"></i>
								</div>
								<!-- 고객커뮤니티 최근 3일 -->
								<div class="col-xs-9 text-right">
									<div class="huge"><%=CmmUtil.nvl(comDto.getCommunity_cnt(),"0") %></div>
									<div>새로운 문의!</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<div class="panel panel-yellow">
					
					
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-shopping-cart fa-5x"></i>
								</div>
								<!-- 케이터링에서 신청인 갯수 -->
								<div class="col-xs-9 text-right">
									<div class="huge"><%=CmmUtil.nvl(comDto.getCtrR_cnt(),"0") %></div>
									<div>새로운 주문!</div>
								</div>
							</div>
						</div>
						
						
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
						
						
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<div class="panel panel-red">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-support fa-5x"></i>
								</div>
								<!-- 그냥 일단은 0 -->
								<div class="col-xs-9 text-right">
									<div class="huge">0</div>
									<div>Error Log!</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-8">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> Area Chart Example
							<div class="pull-right">
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
										Action <span class="caret"></span>
									</button>
									<ul class="dropdown-menu pull-right" role="menu">
										<li><a href="#">Action</a></li>
										<!-- <li class="divider"></li>
										<li><a href="#">Separated link</a></li> -->
									</ul>
								</div>
							</div>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<!-- area 차트 -->
							<div id="morris-area-chart"></div>
						</div>
						<!-- /.panel-body -->
					</div>

					<!-- /.panel -->

				</div>

				<!-- /.col-lg-8 -->
				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bell fa-fw"></i> Notifications Panel
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="list-group">
								<!-- Notifications Panel -->
								<%
								Iterator<ComDTO> it = list.iterator();
								while(it.hasNext()){
									ComDTO comDtos = (ComDTO)it.next();
									
									if (comDtos==null){
										comDtos = new ComDTO();
									}
									
									byte[] contentByte = comDtos.getContents().getBytes();
									
									if(contentByte.length >22){
										comDtos.setContents(comDtos.getContents().substring(0,10)+" ...");
									}
								%>
								<% if(comDtos.getTable_name().equals("CC")) {%>
								<a href="/community/communityDetail.do?cmt_seq=<%=comDtos.getSeq() %>" class="list-group-item"> 
									<i class="fa fa-comment fa-fw"></i> <%=comDtos.getContents() %>
									<span class="pull-right text-muted small" height=""><em><%=comDtos.getReg_dt() %></em> </span>
								</a>
								<%}else if(comDtos.getTable_name().equals("CE")){ %>
								<a href="/event/eventDetail.do?ent_seq=<%=comDtos.getSeq() %>" class="list-group-item"> 
									<i class="fa fa-gamepad fa-fw"></i> <%=comDtos.getContents() %>
									<span class="pull-right text-muted small"><em><%=comDtos.getReg_dt() %></em> </span>
								</a>
								<%}else if(comDtos.getTable_name().equals("CN")){ %>
								<a href="/notice/noticeDetail.do?notice_seq=<%=comDtos.getSeq() %>" class="list-group-item"> 
									<i class="fa fa-bullhorn fa-fw"></i> <%=comDtos.getContents() %>
									<span class="pull-right text-muted small"><em><%=comDtos.getReg_dt() %></em> </span>
								</a>
								<%}else if(comDtos.getTable_name().equals("CM")){ %>
								<a href="/menu/menuDetail.do?menu_seq=<%=comDtos.getSeq() %>" class="list-group-item"> 
									<i class="fa fa-cutlery fa-fw"></i> <%=comDtos.getContents() %>
									<span class="pull-right text-muted small"><em><%=comDtos.getReg_dt() %></em> </span>
								</a>
								<%} %>
							<%} %>
							</div>
							<!-- /.list-group -->
							<!-- 거의 더보기 버튼 -->
							<!-- <a href="#" class="btn btn-default btn-block">View All Alerts</a> -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-4 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->


	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="/bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="/bower_components/raphael/raphael-min.js"></script>
	<script src="/bower_components/morrisjs/morris.min.js"></script>
	<!--  <script src="../js/morris-data.js"></script>-->

	<!-- Custom Theme JavaScript -->
	<script src="/dist/js/sb-admin-2.js"></script>



</body>

</html>
