<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%
	if (CmmUtil.nvl((String)session.getAttribute("USER_NO")) == null || CmmUtil.nvl((String)session.getAttribute("USER_NAME")).equals("")) {
%>
<div class="footer">
	<div class="share">
		<a onclick="facebook()"><img alt='페이스북' src="/img/facebook.png" /></a>
		&nbsp; <a onclick="instagram()"><img alt='인스타그램'
			src="/img/instagram.png" /></a> <br />
	</div>
	<div class='contact'>
		<img alt='라오푸드트럭로고' src="/img/logo.png" style="width:50px; height:40px;"/>
		<font size="2">
			<span>
			대표자 : 이휘원 &nbsp;업종 : 이동형 점포<br/>
			전화 : 010-9120-0514<br/>
			사업자등록번호 : 231-07-00374 <br/>
			본사 주소 : 서울시 동대문구 이문동 86-9번지
			</span>
		</font>
	</div>
</div>

<%
	} else {
%>

<div class="footer">
	<div class="share">
		<a onclick="facebook()"><img alt='페이스북' src="/img/facebook.png" /></a>
		&nbsp; <a onclick="instagram()"><img alt='인스타그램'
			src="/img/instagram.png" /></a> <br />
	</div>
	<div class='contact'>
		<img alt='라오푸드트럭로고' src="/img/logo.png" style="width:50px; height:40px;"/>
		<font size="2">
			<span>
			대표자 : 이휘원 &nbsp;업종 : 이동형 점포<br/>
			전화 : 010-9120-0514<br/>
			사업자등록번호 : 231-07-00374 <br/>
			본사 주소 : 서울시 동대문구 이문동 86-9번지
			</span>
		</font>
	</div>
	<button onclick="location.href='/user/appLogout.do'";>
		<span>로그아웃</span>
	</button>
</div>


<%
	}
%>