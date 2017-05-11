<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%@ page import="ac.kr.ft.com.dto.UserDTO"%>
<body>
	<!-- S: WRAPPER -->
	<div class="wrapper">
		<!-- S: FLOAT -->
		<!-- 로그인 시 -->
		<%
			if (CmmUtil.nvl((String)session.getAttribute("AUTH")).equals("P")) {
		%>
		<!-- 사업자 -->

		<div class="float" id='float' style='display: none;'>
			<div>
				<div class="content">
					<header>
						<span> <strong><a style="color: #FFFFFF";
							href="/user/busiUserDetail.do?user_no=<%=CmmUtil.nvl((String)session.getAttribute("USER_NO"))%>"><%=CmmUtil.nvl((String)session.getAttribute("USER_NAME"))%></a>님
								안녕하세요!</strong><br />즐거운 하루 되세요!
						</span>
					</header>
					<ul>
						<li><a href="/user/busiUserList.do">
								<button type="button">회원관리</button>
						</a></li>
						<li><button>커뮤니티</button></li>
						<li><a href="/notice/businoticeList.do"><button
									class='msub'>- 공지사항</button></a></li>
						<li><a href="/community/busicommunityList.do"><button
									class='msub'>- 고객 커뮤니티</button></a></li>
						<li><a href="/event/busieventList.do"><button
									class='msub'>- 이벤트</button></a></li>
						<li><button>메뉴정보</button></li>
						<li><a href="/menu/busiMenuList.do"><button class='msub'>-
									메뉴</button></a></li>
						<li><a href="/hyg/busiHygList.do"><button class='msub'>-
									위생인증서</button></a></li>
						<li><button>축제정보</button></li>
						<li><a href="/fest/busiFestlist.do"><button class='msub'>-
									축제정보 리스트</button></a></li>
						<li><button>종합순위 정보</button></li>
						<li><a href="/busi/rankcondition.do"><button class='msub'>-
									종합순위 조회</button></a></li>
						<li><button>케이터링</button></li>
						<li><a href="/ctr/BusictrList.do"><button class='msub'>-
									상담문의</button></a></li>
						<li><a href="/ctr/BusictrRegform.do"><button class='msub'>-
									주문하기</button></a></li>
						<li><button>일정 및 위치 조회</button></li>
						<li><a href="/busi/schedule/calendar.do"><button
									class='msub'>- 일정</button></a></li>
						<li><a href="/busi/position/position.do"><button
									class='msub'>- 위치 조회</button></a></li>
					</ul>
					<div>
						<a href="/user/appLogout.do"><input type="button" title="로그아웃"
							value="로그아웃" class="btn_global"></a>
					</div>
				</div>
			</div>
			<div class="dim" onclick='closeFloatMenu();'>
				<a href="#" class="close"></a>
			</div>
		</div>
		<%
			} else {
		%>
		<script>
			alert('권한이 없거나 잘못된 접근입니다');
			history.go(-1);
		</script>
		<%
			}
		%>


	</div>
	<!-- E: WRAPPER -->
</body>

