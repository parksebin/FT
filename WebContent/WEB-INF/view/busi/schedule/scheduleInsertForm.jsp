<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>라오푸드트럭</title>
    <meta charset="EUC-KR">
    <meta http-equiv='X-UA-Compatible' content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">
    <link rel="stylesheet" href="/css/datepicker.css">
    
    
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
	<script>
		$(function() {
			$(".datepicker").datepicker({
				dateFormat : "yymmdd",
				monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',],
				dayNamesMin : ['일','월','화','수','목','금','토'],
				changeMonth : true,
				changeYear : true,
				showMonthAfterYear : true,
			});
		});
	</script>
	
	<script type="text/javascript">
		function check(f) {
			if(f.title.value==""){
				alert("제목을 입력해주세요");
				f.title.focus();
				return false;
			}
			
			if(f.pl_dt1.value==""){
				alert("날짜를 입력해주세요");
				f.pl_dt1.focus();
				return false;
			}
			
			if(f.pl_dt2.value!=""){
				if(f.pl_dt1.value > f.pl_dt2.value){
					alert("날짜를 다시 입력해주세요");
					f.pl_dt2.focus();
					return false;
				}
			}
			
			if(f.contents.value==""){
				alert("내용을 입력해주세요");
				f.contents.focus();
				return false;
			}
			
			return true;
		}
	
	</script>
<%@include file="/busiinc/apptop.jsp"%>
</head>
<body>
<div class="wrapper">
    <!-- S: HEADER -->
		<%@include file="/busiinc/appheader.jsp"%>
	<!-- S: WRAPPER -->
	<!-- E: HEADER -->
		<%@include file="/busiinc/appmenu.jsp"%>
	<!-- S: WRAPPER -->

    <!-- S: CONTENT -->
     <!-- join -->
     <form action="/busi/schedule/scheduleInsertProc.do" name="f" onsubmit="return check(this)" method="post">
    <div class="content" style="display:block;">
        <div class="content_wrapper">
        	<header><span>위치 및 일정</span></header>
			<div class="section">
                <!-- group -->
               <div class="input_row">
					<span class="input_box">
						<label class="lbl" >제목</label>
						<input type="text" placeholder="제목" class="input_area" value="" name="title">
					</span>
				</div>
	
				<div class="group">
					<a class="input_row date">
						<span class="input_box">
							<label class="lbl">시작일</label>
							<input type="text" placeholder="시작일" class="input_area datepicker" value="" name="pl_dt1">
						</span>	
					</a>
					
					<a class="input_row date">
						<span class="input_box">
							<label class="lbl">종료일</label>
							<input type="text" placeholder="종료일" class="input_area datepicker" value="" name="pl_dt2">
						</span>	
					</a>
				</div>
                <!-- group -->
				<div class="input_content">
					<span class="input_box">
                        <textarea name="contents"></textarea>
					</span>
				</div>
            </div>
        </div>
    </div>
    <div class="content wrapper50">
	    <input type="submit" title="확인" value="확인" class="btn_half left">
	    <input type="button" title="취소" value="취소" class="btn_half left" onclick="location.href='/busi/schedule/calendar.do'">
    </div>
    </form>
    <!-- E: CONTENT -->
    
    <!-- S: FOOTER -->
    	<%@include file="/busiinc/appfooter.jsp" %>
    <!-- E: FOOTER -->
</div>
</body>
</html>