<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.EventDTO"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>이벤트 삽입</title>

<%@include file="/inc/top.jsp"%>


<script type="text/javascript">
	
	
	function doAction1(){
		var f = document.getElementById("f");
		
		
		if (f.title.value == "") {
			alert("제목을 입력하시길 바랍니다.");
			f.title.focus();
			return false;
		}

		if (f.contents.value == "") {
			alert("내용을 입력하시길 바랍니다.");
			f.contents.focus();

			return false;
		}
		f.target = "ifrProc";
        f.submit()
		return true;
	}

	
	
	

	//파일 업로드
	function doFileUpload() {
			
			var cw=screen.availWidth;     //화면 넓이
			var ch=screen.availHeight;    //화면 높이
			
			var sw=500;    //띄울 창의 넓이
			var sh=400;    //띄울 창의 높이
			
			var ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
			var mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치
			
			window.open("/file/FileUploadSingPOP.do?jObj=fileGRP&vObj=doUploadOK", "UPLOAD_POP", "width="+ sw +",height="+ sh +",top="+ mt +",left="+ ml +",resizable=no,scrollbars=yes");
		}

	//이미지 첨부가 완료되면 실행될 함수
	function doUploadOK() {

		alert("doUploadOK");
		var btnImg = document.getElementById("btnImg");

		btnImg.value = "업로드 완료";
		btnImg.disabled;

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

<body>

	<div id="wrapper">

		<%@include file="/inc/menu.jsp"%>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">이벤트관리</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">이벤트등록</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">




								<form name="f" id="f" method="post" action="insert.do">
									<!-- action목적지는 컨트롤단에 있는 insert단  -->


									<input type="hidden" name="fileGRP" id="fileGRP"  />
									
									<%
										//저장된 파일의 파일그룹 아이디
									%>
									<table width="100%"
										class="table table-striped table-bordered table-hover"
										id="dataTables-example">

										<tbody>
											<tr>
												<td align="center" ><b>제목</b></td>
												<td>
												<input class="form-control" name="title" style= "width :430px" onkeyup="fc_chk_byte(this,100);"/>
                              
												</td>
												
									
											</tr>	
											<tr>
												<td align="center"><b>파일첨부</b></td>
												<td>
													<input type="button" id="btnImg" value="파일등록"  onclick="doFileUpload()"/>
												</td>


											</tr>
											<tr>
												<td align="center"><b>글 쓰기</b></td>
												<td colspan="1"><textarea name="contents" rows="15"
														cols="70" maxlength="2000" onkeyup="fc_chk_byte(this,4000);" ></textarea>
												</td>

											</tr>
											
												


		
											<tr>
												<td colspan="2" align="right">
												<input type="button" value="등록" onclick="doAction1()" class="btn btn-outline btn-success"/>
													
													
													 <input
													type="button" value="목록"
													onclick="location.href='eventList.do'"
													class="btn btn-outline btn-default" />
												




												</td>
											</tr>

										</tbody>
									</table>
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

	<!-- 로직 처리용 -->

	<iframe name="ifrProc" style="display: none"></iframe>

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