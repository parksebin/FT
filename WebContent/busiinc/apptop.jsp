<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<head>
<script type="text/javascript">
	function openFloatMenu() {
		document.getElementById('float').style.display = 'block';
	}
	function closeFloatMenu() {
		document.getElementById('float').style.display = 'none';
	}
	function textSearch() {
		var barObj = document.getElementById('search_area');
		if (barObj.style.display == 'none') {
			barObj.style.display = 'block';
		}
	}
	function facebook() {
		location.href = "https://ko-kr.facebook.com/LAOFOODTRUCK/";
	}
	function instagram() {
		location.href = "https://www.instagram.com/laofoodtruck/";
	}
</script>
</head>
