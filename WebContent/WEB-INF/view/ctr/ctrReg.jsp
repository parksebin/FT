<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.CtrDTO"%>
<%@page import="java.util.List"%>    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>케이터링</title>
	<%@include file="/inc/top.jsp" %>
<!-- 추가된 내용임 -->
	<script type="text/javascript">
	
		function doAction1() {
//*f는 form 태그 안의 id임*//
			
			var f = document.getElementById("f");
			
			if (f.user_name.value==""){alert("이름을 입력하시길 바랍니다.");f.user_name.focus();return;}
			
			if (f.email1.value==""){alert("이메일을 입력하시길 바랍니다.");f.email1.focus();return;}
			if (f.email2.value==""){alert("이메일을 입력하시길 바랍니다.");f.email2.focus();return;}
			
			if (f.tel_1.value==""){alert("핸드폰 번호를 입력하시길 바랍니다.");f.tel_1.focus();return;}
			if (f.tel_2.value==""){alert("핸드폰 번호를 입력하시길 바랍니다.");f.tel_2.focus();return;}
			if (f.tel_3.value==""){alert("핸드폰 번호를 입력하시길 바랍니다.");f.tel_3.focus();return;}
			
			if (f.title.value==""){alert("제목을 입력하시길 바랍니다.");f.title.focus();return;}
			
			//내용 입력으로 바로 들어옴.			
			if (f.contents.value==""){alert("내용을 입력하시길 바랍니다.");f.contents.focus();return;}
		
			if (calBytes(f.title.value) > 100) {
				alert("제목은 최대 100Bytes까지 입력 가능합니다.");
				f.title.focus();
				return;
			}
 
		 	if (calBytes(f.contents.value) > 4000) {
				alert("내용은 최대 4,000Bytes까지 입력 가능합니다.");
				f.contents.focus();
				return;
			}   
		
		 f.target = "ifrProc";
		 f.submit();
		}
		
		//이메일 변경시 값 가져오기(폼객체, 선택한 이메일 값)
		function doChangeEmail(f, val){
			
			//직접 입력을 선택하였다면, 기존 입력된 값을 지운다.
			if (val=="etc"){
				f.email2.value = "";
				f.email2.focus();
				
			//그렇지 않으면, 선택된 값을 입력 받도록 한다.
			}else{
				f.email2.value = val;
			}
		}
		
/* 		//공지사항 체크 여부 확인
		function chkRadioCtrYn(){
			alert("들어오냐 chkRadioCtrYn 에 ")
			
			var ctrYn = document.f.getElementsByName('ctr_yn') ; //라디오 객체 가져오기
			var res = false; //반환할 결과값(선택되었으면 true, 선택안되면 false)
			
			//라디오 버튼 객체수만큼 반복문 돌리기
			for (var i=0;i<ctrYn.length;i++){
				
				//라디오 버튼이 체크되었다면..
				if (ctrYn[i].checked){
					res = true;
				}
			}
			return res;
		}
		 */
		
/* 		function chkRadio() {
			alert("체크라디오 들어오냐?")
			var ctr_yn = document.getElementById('ctr_yn');
			var res = false;

			for(var i=0;i<ctr_yn.length;i++){
				if(ctr_yn.checked){
					res=true;
				}
			}
			return res;
		} */
		
		 var SetComma1 = function(str) {

		       var regMustNumberComma = /^[\t|0-9]+$/;
		       str = str.replace(/,/g,'');

		       var retValue = "";
		           for( i = 1; i <= str.length; i++ ) {
		               if( i > 1 && (i%3) == 1 )
		                   retValue = str.charAt(str.length - i) + retValue;
		               else
		                   retValue = str.charAt(str.length - i) + retValue;
		           }
		        
		           if( regMustNumberComma.test(retValue) == false ) {
		               alert("숫자만 입력하실 수 있습니다.");
		               return "";
		           }
		           return retValue;
		   }
		
		function doKeyOnlyNumber(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.KeyCode;
			if((keyID >= 48 && keyID <= 57) || (keyID>=96 && keyID <=105) || keyID==8 || keyID==9 ){
				return true;
			}else{
				return false;
			}
		}
		
		//글자 길이 바이트 단위로 체크하기(바이트값 전달)
 		function calBytes(str) {

			var tcount = 0;
			var tmpStr = new String(str);
			var strCnt = tmpStr.length;
			var onechar;
			
			for (i = 0; i < strCnt; i++) {
				onechar = tmpStr.charAt(i);
				if (escape(onechar).length > 4) {
					tcount += 2;
				} else {
					tcount += 1;
				}
			}
			return tcount;
		}
		
	</script>
</head>

<body>
    <div id="wrapper">
	<%@include file="/inc/menu.jsp" %>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">케이터링 관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">주문하기
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
 
								<form name="f" id="f" method="post" action="/ctr/ctrReg.do" >
								<table border="1" class="table table-striped table-bordered table-hover" id="dataTables-example">
									<col width="150px" />
									<col width="150px" />
									<col width="150px" />
									<col width="150px" />
									<tr>
										<td align="center" style="width :120px"><b>회원이름</b></td>
										<td colspan="3"><input type="text" name="user_name" maxlength="20" class="form-control" style="width :250px"/></td>
									</tr>
									
									<tr>
										<td align="center"><b>이메일</b></td>
										<td colspan="3">
										<input type="text" name="email1" maxlength="20" class="form-control" style="width :120px"/>
										@
										<input type="text" name="email2" maxlength="20" class="form-control" style="width :120px" />
										
										<select name="email3" onchange="doChangeEmail(this.form, this.value)" class="form-control" style="display:;width :120px">
											<option value="etc">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="nate.com">nate.com</option>
											<option value="empal.com">empal.com</option>
											<option value="hanafos.com">hanafos.com</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="paran.com">paran.com</option>
											<option value="korea.com">korea.com</option>
											<option value="freechal.com">freechal.com</option>
										</select>
										 
										
										</td>	
									</tr>
									<tr>
										<td align="center"><b>휴대전화</b></td>
										
										<td colspan="3">
										<select name="tel_1" class="form-control" style="display:;width :80px">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="016">017</option>
											<option value="016">018</option>
											<option value="019">019</option>
										</select>
										-
										<input type="text" name="tel_2" onkeyup="this.value=SetComma1(this.value)" maxlength="4" class="form-control" style="width :80px"/> 
										-
										<input type="text" name="tel_3" onkeyup="this.value=SetComma1(this.value)" maxlength="4" class="form-control" style="width :80px"/>
										</td>		
									</tr>
									
										
									<tr>
										<td align="center" ><b>제목</b></td>
										<td colspan="3">
											<input type="text" name="title" maxlength="100" class="form-control" style= "width:340px"/>
										</td>
									</tr>
						<!-- 			<tr>										
									 	<td align="center"><b>공지여부</b></td>
									    <td colspan="3"> 예 	<input type="radio" name="ctr_yn" id="ctr_yn" value="1">
										    			아니오 <input type="radio" name="ctr_yn" id="ctr_yn" value="2"></td> 
									</tr> 
									 -->
									<tr>
										<td align="center"><b>내용</b></td>
										<td colspan="4">
										<textarea name="contents" rows="10" cols="68" maxlength="4000" class="form-control"></textarea></td>
									</tr>
								
                                    </tbody>
                                </table>
                                </form>
	                            <p align="right">
									<input type="button" value="등록" onclick="doAction1()" class="btn btn-outline btn-success"/>
									<input type="button" value="목록" onclick="location.href='/ctr/ctrList.do'" class="btn btn-outline btn-default"/>
	                            </p>
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
	
	<iframe name="ifrProc" style="display:none"></iframe>

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
    <script src="../bower_components/datatables-responsive/js/dataTables.responsive.js"></script>
    
    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>

</body>

</html>
    