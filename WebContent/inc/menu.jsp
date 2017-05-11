<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation"
	style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/index.jsp">Food Truck
			Administrator v1.0</a>
	</div>
	<!-- /.navbar-header -->
	<ul class="nav navbar-top-links navbar-right">
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
		</a> <%
		if (CmmUtil.nvl((String)session.getAttribute("ADMINUSER_NAME")) == null || CmmUtil.nvl((String)session.getAttribute("ADMINUSER_NAME")).equals("")) { %> 
		<script>
		alert('권한이 없거나 잘못된 접근입니다');
		location.href = "/index.jsp";
		</script> <% } else {%> 
		<%=CmmUtil.nvl((String)session.getAttribute("ADMINUSER_NAME"))%>님 안녕하세요
			<ul class="dropdown-menu dropdown-user">
				<li><a href="/user/logout.do"><i class="fa fa-user fa-fw"></i>로그아웃</a>
				</li>
				<!-- <li class="divider"></li> -->
			</ul> <%
 	}
 %> <!-- /.dropdown-user --></li>
		<!-- /.dropdown -->
	</ul>
	<!-- /.navbar-top-links -->
	<%
		if (!(CmmUtil.nvl((String)session.getAttribute("ADMINUSER_NAME")) == null || CmmUtil.nvl((String)session.getAttribute("ADMINUSER_NAME")).equals(""))) {
	%>
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
					<div class="input-group custom-search-form">
<!-- 						<input type="text" class="form-control" placeholder="Search..."> -->
<!-- 						<span class="input-group-btn"> -->
<!-- 							<button class="btn btn-default" type="button"> -->
<!-- 								<i class="fa fa-search"></i> -->
<!-- 							</button> -->
<!-- 						</span> -->
					</div> <!-- /input-group -->
				</li>
				<li><a href="/auth/authList.do"><i class="fa fa-dashboard fa-fw"></i>권한 관리</a>
				</li>
						
				<li>
				<a href="/user/userlist.do"><i class="fa fa-user fa-fw"></i> 회원 관리</a>
				</li>
					
				<li><a href="#"><i class="fa fa-sitemap fa-fw"></i> 커뮤니티 관리 <span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/notice/noticeList.do"><i class="fa fa-bullhorn fa-fw"></i> 공지사항</a></li>
						<li><a href="/community/communityList.do"><i class="fa fa-comment fa-fw"></i> 고객 커뮤니티 관리</a></li>
						<li><a href="/event/eventList.do"><i class="fa fa-gamepad fa-fw"></i> 이벤트</a></li>
					</ul>
				</li>
				
				<li><a href="#"><i class="fa fa-cutlery fa-fw"></i>메뉴정보 관리 <span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/menu/menuList.do"><i class="fa fa-cutlery fa-fw"></i> 메뉴</a></li>
						<li><a href="/hyg/hygList.do"><i class="fa fa-file-text-o fa-fw"></i> 위생인증서</a></li>
					</ul> <!-- /.nav-second-level -->
				</li>
					
					
					
				<li><a href="#"><i class="fa fa-group  fa-fw"></i>축제정보 관리 <span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/fest/festlist.do"><i class="fa fa-group  fa-fw"></i> 축제정보 리스트</a></li>
					</ul> <!-- /.nav-second-level -->
				</li>
					
				<li><a href="#"><i class="fa fa-sliders fa-fw"></i>종합순위정보 관리 <span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/rank/rankcondition.do"><i class="fa fa-sliders fa-fw"></i> 종합순위정보 조회</a></li>
					</ul>
				</li>
				
				<li><a href="#"><i class="fa fa-truck  fa-fw"></i>케이터링 관리<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/ctr/ctrList.do"><i class="fa fa-user  fa-fw"></i> 상담문의</a></li>
						<li><a href="/ctr/ctrRegform.do"><i class="fa fa-edit fa-fw"></i> 주문하기</a></li>
					</ul> <!-- /.nav-second-level -->
				</li>
				
				<li><a href="#"><i class="fa fa-table fa-fw"></i>일정 및 위치조회 관리 <span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/schedule/calendar.do"><i class="fa fa-calendar fa-fw"></i> 일정</a></li>
						<li><a href="/position/position.do"><i class="fa fa-map-marker  fa-fw"></i> 위치</a></li>
					</ul> <!-- /.nav-second-level -->
				</li>
				</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->

	<%
		}
	%>
</nav>
