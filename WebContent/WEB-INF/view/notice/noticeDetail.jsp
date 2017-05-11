<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.NoticeDTO"%>
<%@page import="ac.kr.ft.com.dto.FileDTO"%>
<%@page import="java.util.List"%>
<%@page import="ac.kr.ft.com.dto.NoticeComDTO"%>

<%
	NoticeDTO noticeDto = (NoticeDTO) request.getAttribute("noticeDto");

	if (noticeDto == null) {
		noticeDto = new NoticeDTO();
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

<title>공지사항상세</title>
<%@include file="/inc/top.jsp"%>
<script src="/bower_components/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
	
	var commentSaveType = "A"; //댓글 저정 방법(A:댓글 쓰기, B:댓글 수정)
	

	//보여줄 댓글 내용(계속 이어서 덮어씀)
	var tag = "";
	
	/*
	#######################################################
	#	댓글 더보기 변수 끝
	#######################################################
	*/
	
	
	//로딩시 자동실행
	function doOnload(){
	
		doCommList();
		
	}
	
	//페이지 변수 초기화(댓글 수정, 삭제시 초기화 수행=>무조건 처음으로 조회)
	function doCommentPageInit(){
		var viewSize = 5; //한번에 보여줄 댓글 갯수
		var curViewSize = 0; //현재 댓글 갯수
		var varCommentListCnt = 0; //댓글 총 갯수		
		
	}

	
	
	
	//게시판 내용 업데이트,삭제 중 하나.
	function doAction(gubun) {
		var f = document.getElementById("form1");
		if (gubun == "U") {
			f.action = "noticeupdateForm.do";
			f.submit();
		} else if (gubun == "D") {
			if (confirm("삭제하시겠습니까?")) {
				f.action = "delete.do";
				f.submit();
			}
		}

	}
	

	//ajax 호출(댓글 호출)
	function xmlHttpPost(actionUrl, submitParameter, resultFunction) {
		var xmlHttpRequest = false;

		//IE인경우
		if (window.ActiveXObject) {
			xmlHttpRequest = new ActiveXObject('Microsoft.XMLHTTP');
		} else {
			xmlHttpRequest = new XMLHttpRequest();
			xmlHttpRequest.overrideMimeType('text/xml');
		}

		xmlHttpRequest.open('POST', actionUrl, true);
		xmlHttpRequest.setRequestHeader('Content-Type',
				'application/x-www-form-urlencoded');
		xmlHttpRequest.onreadystatechange = function() {
			if (xmlHttpRequest.readyState == 4) {
				switch (xmlHttpRequest.status) {
				case 404:
					alert('오류: ' + actionUrl + '이 존재하지 않음');
					break;
				case 500:
					alert('오류: ' + xmlHttpRequest.responseText);
					break;
				default:
					eval(resultFunction + '(xmlHttpRequest.responseText);');
					break;
				}
			}
		}

		xmlHttpRequest.send(submitParameter);
	}

	
	//댓글 리스트 조회하기
	function doCommList(){
		xmlHttpPost("/notice/CommentList.do", "notice_seq=<%=CmmUtil.nvl(noticeDto.getNotice_seq())%>" , "viewResult");
		
	}
	
	
	//댓글 리스트 조회 후처리
	function viewResult(result) {
		
		var jsonObj = eval("("+ result+")");
		
		tag = "";
	
		//배열수만큼 반복하기
		for (var i=0;i<jsonObj.list.length;i++){
			var contents = jsonObj.list[i].CONTENTS.replace(/<br>/gi,"\r\n");
			tag +="<tr>";
			tag +=" <td>";
			tag +=" "+jsonObj.list[i].REG_DT+""; 
			tag += "</td>";
			tag +=" <td>";
			tag +="    <textarea  rows=\"3\" cols=\"40\" readonly style=\"background-color: #e2e2e2; width: 700px; height: 80px;\">"+contents+"</textarea>";
			tag +=" </td>";
			tag +=" <td>";
			tag +=" 	<input type=\"button\" value=\"댓글수정\" class=\"btn btn-outline btn-warning\" style=\"width: 100px; height: 40px;\" onclick=\"doCommentUpdateView('"+ jsonObj.list[i].COMT_SEQ +"', '"+ jsonObj.list[i].CONTENTS +"')\">";
			tag +=" 	<input type=\"button\" value=\"댓글삭제\" class=\"btn btn-outline btn-danger\"  style=\"width: 100px; height: 40px;\" onclick=\"doCommentDelete('"+ jsonObj.list[i].COMT_SEQ +"')\" >";
			tag +=" </td>";
			tag +="</tr>";
		}
		

		$("#replyListArea").html(tag);

		//댓글 수 넣어주기
		$("#commentListCnt").html(jsonObj.listCnt);
		
	
		varCommentListCnt = jsonObj.listCnt;
		curViewSize = jsonObj.list.length; //현재 댓글 갯수 업데이트
		
		displayBtnMoreView();
		
	}
	

	//댓글 저장하기
	function saveComment() {
		
		var f = document.getElementById("form2");
		
		if (f.contents.value == "") {
		   alert("내용을 입력하시기 바랍니다.");
		   f.contents.focus();
		   return false;
		}
		
		var actionUrl = ""; //호출 url 
		var submitParameter = ""; 		
		var resultFunction =""; //실행후 실행할 함수명
		
		//댓글 등록
		if (commentSaveType=="A"){
			var actionUrl = "/notice/insertComment.do"; //호출 url 
			var submitParameter ="notice_seq=<%=CmmUtil.nvl(noticeDto.getNotice_seq())%>&contents=" + f.contents.value; 
			var resultFunction ="viewResultInsert"; //실행후 실행할 함수명
			
			
		//댓글 수정			
		}else if (commentSaveType=="B"){
	
			var f = document.getElementById("form2"); //댓글 입력 폼
			var actionUrl = "/notice/updateComment.do"; //호출 url 
			var submitParameter ="notice_seq=<%=CmmUtil.nvl(noticeDto.getNotice_seq())%>&com_seq="+ f.com_seq.value +"&contents=" + f.contents.value; 
			var resultFunction ="viewResultUpdate"; //실행후 실행할 함수명
			
			
		}else{
			alert("에러가 발생했습니다.\n잠시후 시도하시길 바랍니다.")
			return;
		}
		
		xmlHttpPost(actionUrl, submitParameter, resultFunction);
			
	}
	
	//댓글 등록 후 처리
	function viewResultInsert(result) {
		//댓글등록이 성공이라면...
		if (result=="1"){
			doCommList();
			
			//기존에 입력된 댓글 내용 삭제
			var f = document.getElementById("form2");
			f.contents.value="";
			
			
		}else{
			alert("댓글 등록에 실패하였습니다.");	
		}
	}
	

	//댓글 수정 내용 보여주기
	function doCommentUpdateView(com_seq, contents){
		
		var f = document.getElementById("form2");
	
		f.com_seq.value= com_seq; //댓글 번호 저장	
		f.contents.value= contents.replace(/<br>/g,"\n");  //댓글 내용 보여주기
       	
		//버튼명 변경하기
		document.getElementById("btnSave").value ="댓글 수정";
	
		//수정 타입으로 변경
		commentSaveType = "B"; 
	
		//댓글 수정 취소 버튼 만들기
		var tag  = "<input type=\"button\" id=\"btnSave\" value=\"확인\" onclick=\"saveComment()\" style=\"width: 100px; height: 40px;\"  class=\"btn btn-outline btn-warning\">";
			tag += "<input type=\"button\" id=\"btnCancle\" value=\"취소\" onclick=\"cancleComment()\" style=\"width: 100px; height: 40px;\"  class=\"btn btn-outline btn-danger\">";
		
		$("#btnCommentArea").html(tag);
		
	}
	
	
	//댓글 수정 취소
	function cancleComment(result) {
		
		//댓글 등록 유형으로 변경
		commentSaveType = "A"; 
		
		//댓글 수정위해 입력된 값들 초기화
		var f = document.getElementById("form2");
		f.com_seq.value= ""; //댓글 번호 초기화
		f.contents.value= ""; //댓글 내용 초기화
		
		//댓글 등록 버튼으로 변경
		var tag  = "<input type=\"button\" id=\"btnSave\" value=\"댓글 등록\" onclick=\"saveComment()\" style=\"width: 100px; height: 83px;\" class=\"btn btn-outline btn-success\">";
		
		$("#btnCommentArea").html(tag);
		
	}
	
	
	//댓글 수정 후 처리
	function viewResultUpdate(result) {
		
		
		//댓글수정이 성공이라면...
		if (result=="1"){

			//댓글 관련 변수 초기화
			doCommentPageInit();

			commentSaveType = "A"; 
			
			//댓글 수정위해 입력된 값들 초기화
			var f = document.getElementById("form2");
			f.com_seq.value= ""; //댓글 번호 초기화
			f.contents.value= ""; //댓글 내용 초기화
			
			//댓글 등록 버튼으로 변경
			var tag  = "<input type=\"button\" id=\"btnSave\" value=\"댓글 등록\" style=\"width: 100px; height: 83px;\" onclick=\"saveComment()\" class=\"btn btn-outline btn-success\">";
			
			$("#btnCommentArea").html(tag);			
			
			
			 //댓글 조회
			doCommList();
			
		
			 
		}else{
			alert("댓글 수정에 실패하였습니다.");	
		}
	}
	
	
	//댓글 삭제하기
	function doCommentDelete(com_seq){
		
		if(confirm("삭제하시겠습니까?")){
			var actionUrl = "/notice/deleteComment.do"; //호출 url 
			var submitParameter ="notice_seq=<%=CmmUtil.nvl(noticeDto.getNotice_seq())%>&com_seq=" + com_seq; 
			var resultFunction ="viewResultDelete"; //실행후 실행할 함수명
			
			xmlHttpPost(actionUrl, submitParameter, resultFunction);
			
		}
		
	}
	
	//댓글 삭제 후 처리
	function viewResultDelete(result) {
		
		//댓글삭제가 성공이라면...
		if (result=="1"){
	
			//댓글 관련 변수 초기화
			doCommentPageInit();
		
			commentSaveType = "A"; 
			
			//댓글 수정위해 입력된 값들 초기화
			var f = document.getElementById("form2");
			f.com_seq.value= ""; //댓글 번호 초기화
			f.contents.value= ""; //댓글 내용 초기화
			
			//댓글 등록 버튼으로 변경
			var tag  = "<input type=\"button\" id=\"btnSave\" value=\"댓글 등록\" style=\"width: 100px; height: 83px;\" onclick=\"saveComment()\" class=\"btn btn-outline btn-success\">";
			
			$("#btnCommentArea").html(tag);
			
			
			
			
			//댓글 조회
			doCommList();
			
		}else{
			alert("댓글 삭제에 실패하였습니다.");	
		}
	}
	
	

	</script>

<script language="javascript">
function fc_chk_byte(obj_name,max_length)
{
   var ls_str     = obj_name.value; // 이벤트가 일어난 컨트롤의 value 값
   var li_str_len = ls_str.length;  // 전체길이
   // 변수초기화
   var li_max      = max_length; // 제한할 글자수 크기
   var i           = 0;  // for문에 사용
   var li_byte     = 0;  // 한글일경우는 2 그밗에는 1을 더함
   var li_len      = 0;  // substring하기 위해서 사용
   var ls_one_char = ""; // 한글자씩 검사한다
   var ls_str2     = ""; // 글자수를 초과하면 제한할수 글자전까지만 보여준다.
   
   for(i=0; i< li_str_len; i++)
   {
      // 한글자추출
      ls_one_char = ls_str.charAt(i);
      // 한글이면 2를 더한다.
      if (escape(ls_one_char).length > 4)
      {
         li_byte = li_byte+2;
      }
      // 그외의 경우는 1을 더한다.
      else
      {
         li_byte++;
      }
      // 전체 크기가 li_max를 넘지않으면
      if(li_byte <= li_max)
      {
         li_len = i + 1;
      }
   }   
   
   // 전체길이를 초과하면
   if(li_byte > li_max)
   {
      alert( li_max + " Bytes를 초과 입력할수 없습니다. \n 초과된 내용은 자동으로 삭제 됩니다. ");
      ls_str2 = ls_str.substr(0, li_len);
      obj_name.value = ls_str2; 
      document.frms.chkbytes.value = cal_length(obj_name.value);
   }
   obj_name.focus();   
   document.frms.chkbytes.value = cal_length(ls_str);
}

/**
 * 한글을 2바이트 씩 계산하여 입력받은 문자열이 DB에 저장될 때 총 몇바이트를 차지하는지 계산한다.
 * 엔터(\r\n)는 2바이트를 차지한다.
 * @param val : 입력받은 문자열
 */
function cal_length(val)
{
  // 입력받은 문자열을 escape() 를 이용하여 변환한다.
  // 변환한 문자열 중 유니코드(한글 등)는 공통적으로 %uxxxx로 변환된다.
  var temp_estr = escape(val);
  var s_index   = 0;
  var e_index   = 0;
  var temp_str  = "";
  var cnt       = 0;

  // 문자열 중에서 유니코드를 찾아 제거하면서 갯수를 센다.
  while ((e_index = temp_estr.indexOf("%u", s_index)) >= 0)  // 제거할 문자열이 존재한다면
  {
    temp_str += temp_estr.substring(s_index, e_index);
    s_index = e_index + 6;
    cnt ++;
  }

  temp_str += temp_estr.substring(s_index);

  temp_str = unescape(temp_str);  // 원래 문자열로 바꾼다.

  // 유니코드는 2바이트 씩 계산하고 나머지는 1바이트씩 계산한다.
  return ((cnt * 2) + temp_str.length) + "";
}


 </script>
</head>

<body onload="doOnload()">
	<%@include file="/inc/menu.jsp"%>
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">공지사항 관리</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
					<div class="panel-heading">공지사항 상세</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">

								<form name="form1" id="form1">
									<input type="hidden" name="notice_seq"
										value="<%=CmmUtil.nvl(noticeDto.getNotice_seq())%>" />


									<table width="60%"
										class="table table-striped table-bordered table-hover"
										id="dataTables-example">
											<tr>
												<td align="center" style="width:200px"><b>제목</b></td>
												<td style="width: 450px"><%=CmmUtil.nvl(noticeDto.getTitle())%></td>
												<td style="width: 70px" ><b>등록일</b></td>											
												<td style="width: 200px"><%=CmmUtil.nvl(noticeDto.getReg_dt())%></td>											
												<td  style="width: 70px"><b>조회수</b></td>
												<td style="width: 150px"><%=CmmUtil.nvl(noticeDto.getRead_cnt())%></td>
											</tr>

											<tr>
												<td align="center" style="width: 100px"><b>사진</b></td>
												<td colspan="5"><img
													src="<%=CmmUtil.nvl(noticeDto.getFile_name())%>" /></td>
											</tr>
											<tr>
												<td align="center"><b>내용</b></td>
												<td colspan="6"><%=CmmUtil.nvl(noticeDto.getContents())%></td>
											</tr>
									</table>

								</form>
								
								<p align="right">
									<input type=button value="수정" class="btn btn-outline btn-warning"
										onclick="doAction('U')"> 
										<input type=button value="삭제" class="btn btn-outline btn-danger" onclick="doAction('D')"> 
										<input
										type=button value="목록" class="btn btn-outline btn-default"
										onclick="location.href='noticeList.do'" />
								</p>
								
								
								<form name="form2" id="form2">
										<input type="hidden" name="com_seq">
									<h3>댓글쓰기</h3>		
								
									<table class="table table-striped table-bordered table-hover" id="dataTables-example">
								<thead>
										<tr>
											<td colspan="2">
											
												<P>
													<textarea name="contents"  placeholder="내용을 입력해주세요." style="width: 800px; height: 80px;" onkeyup="fc_chk_byte(this,4000);"></textarea>
												</P>
											</td>
											<td id="btnCommentArea"><input type="button" value="댓글등록" id="btnSave" style="width: 100px; height: 83px;" class="btn btn-outline btn-success" onclick="saveComment()"></td>
										</tr>
							</thead>
							
							 <!--여기서 부터 아작스 댓글 리스트  -->
							<tbody id="replyListArea">
								
							
							
							</tbody>			
									</table> 
									 
					
									
												
							
								</form>
	
	<%-- 	onclick="location.href='deleteComment.do?notice_seq=<%=noticecomDTO.getNotice_seq()%>&com_seq=<%=noticecomDTO.getCom_seq()%> --%>
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