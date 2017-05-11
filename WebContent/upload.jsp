<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">

	//파일 업로드
	function doFileUpload() {
		window.open("/file/FileUploadSingPOP.do?jObj=viewFileGRP&vObj=viewFile","POP","scrollbars=yes,toolbar=yes,resizable=yes,width=500,height=500,left=0,top=0");
		
	}
	
</script>
	
	
</head>
<body>
<a href="javascript:doFileUpload()">업로드</a>

<input type="text" name="viewFileGRP" id="viewFileGRP" />
<br/>
</body>
</html>