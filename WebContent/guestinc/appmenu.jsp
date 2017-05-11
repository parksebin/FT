<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="ac.kr.ft.com.dto.UserDTO"%>
<body>
	<!-- S: WRAPPER -->
	<div class="wrapper">
		<!-- S: FLOAT -->
		<!-- 로그인 시 -->
		<%
			if (CmmUtil.nvl((String)session.getAttribute("AUTH")).equals("U")) {
		%>

		<!-- 사용자  -->

		<div class="float" id='float' style='display: none;'>
			<div>
				<div class="content">
					<header>
						<span><strong><a style="color: #FFFFFF"
								;
								href="/user/guestUserDetail.do?user_no=<%=session.getAttribute("USER_NO")%>"><%=session.getAttribute("USER_NAME")%></a>님
								안녕하세요!</strong><br />즐거운 하루 되세요!<br/><br/>
								보유 마일리지 : <strong><%=session.getAttribute("MILEAGE")%></strong></span>
					</header>
					<ul>
						<li><button>커뮤니티</button></li>
						<li><a href="/notice/guestnoticeList.do"><button
									class='msub'>- 공지사항</button></a></li>
						<li><a href="/community/guestcommunityList.do"><button
									class='msub'>- 고객 커뮤니티</button></a></li>
						<li><a href="/event/guestEventList.do"><button
									class='msub'>- 이벤트</button></a></li>
						<li><button>메뉴정보</button></li>
						<li><a href="/menu/userMenuList.do"><button class='msub'>-
									메뉴</button></a></li>
						<li><a href="/hyg/userHygList.do"><button class='msub'>-
									위생인증서</button></a></li>
						<li><button>케이터링</button></li>
						<li><a href="/ctr/GuestctrList.do"><button class='msub'>-
									상담문의</button></a></li>
						<li><a href="/ctr/GuestctrRegform.do"><button class='msub'>-
									주문하기</button></a></li>
						<li><button>일정 및 위치 조회</button></li>
						<li><a href="/guest/schedule/calendar.do"><button
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
			<div class="dim"  onclick='closeFloatMenu();'>
				<a href="#" class="close"></a>
			</div>
		</div>

		<%
			} else if (CmmUtil.nvl((String)session.getAttribute("AUTH")).equals("") || CmmUtil.nvl((String)session.getAttribute("AUTH")) == null) {
		%>

		<!-- 비로그인  -->

		<div class="float" id='float' style='display: none;'>
			<div>
				<div class="content">
					<div>
						<a href="/user/appLoginForm.do"><input type="button"
							title="로그인" value="로그인" class="btn_global"></a>
					</div>
					<ul>
						<li><button>커뮤니티</button></li>
						<li><a href="/notice/guestnoticeList.do"><button
									class='msub'>- 공지사항</button></a></li>
						<li><a href="/community/guestcommunityList.do"><button
									class='msub'>- 고객 커뮤니티</button></a></li>
						<li><a href="/event/guestEventList.do"><button
									class='msub'>- 이벤트</button></a></li>
						<li><button>메뉴정보</button></li>
						<li><a href="/menu/userMenuList.do"><button class='msub'>-
									메뉴</button></a></li>
						<li><a href="/hyg/userHygList.do"><button class='msub'>-
									위생인증서</button></a></li>
						<li><button>케이터링</button></li>
						<li><a href="/ctr/GuestctrList.do"><button class='msub'>-
									상담문의</button></a></li>
						<li><a href="/ctr/GuestctrRegform.do"><button class='msub'>-
									주문하기</button></a></li>
						<li><button>일정 및 위치 조회</button></li>
						<li><a href="/guest/schedule/calendar.do"><button
									class='msub'>- 일정</button></a></li>
						<li><a href="/busi/position/position.do"><button
									class='msub'>- 위치 조회</button></a></li>
					</ul>
					<div>
						<a href="/user/guestUserInsertForm.do"><input type="button"
							title="회원가입" value="회원가입" class="btn_tri"></a> <a
							href="/user/appIdFindForm.do"><input type="button"
							title="아이디 찾기" value="아이디 찾기" class="btn_tri"></a> <a
							href="/user/appPwFindForm.do"><input type="button"
							title="비밀번호 찾기" value="비밀번호 찾기" class="btn_tri"></a>
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

