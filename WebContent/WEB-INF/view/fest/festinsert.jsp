<%@page import="ac.kr.ft.com.dto.FestivalDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>    
<%
FestivalDTO festivalDTO = (FestivalDTO)request.getAttribute("festivalDTO"); 

if (festivalDTO==null){
   festivalDTO = new FestivalDTO();
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

    <title>축제정보등록</title>

   <%@include file="/inc/top.jsp" %>

<!-- 추가된 내용임 -->
   <script type="text/javascript">
   
   var SetComma = function(str) {

       var regMustNumberComma = /^[\t|0-9|,]+$/;
       str = str.replace(/,/g,'');

       var retValue = "";
           for( i = 1; i <= str.length; i++ ) {
               if( i > 1 && (i%3) == 1 )
                   retValue = str.charAt(str.length - i) + "," + retValue;
               else
                   retValue = str.charAt(str.length - i) + retValue;
           }
        
           if( regMustNumberComma.test(retValue) == false ) {
               alert("숫자만 입력하실 수 있습니다.");
               return "";
           }
           return retValue;

   }
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
   
   
   
   function doAction() {
      var f = document.getElementById("f");

      if (f.menu_name.value == "") {
         alert("메뉴이름을 입력하시기 바랍니다.");
         f.menu_name.focus();
         return;
      }
      if (f.price.value == "") {
         alert("가격을 입력하시기 바랍니다.");
         f.price.focus();
         return;
      }
      if (f.menu_int.value == "") {
         alert("내용을 입력하시기 바랍니다.");
         f.menu_int.focus();
         return;
      }
      if (f.country_info.value == "") {
         alert("원산지를 입력하시기 바랍니다.");
         f.country_info.focus();
         return;
      }
      if (f.fileGRP.value == "") {
         alert("메뉴 사진을 업로드하시기 바랍니다.");
         return;
      }

      f.target = "ifrProc";
      f.submit();
   
   
   
   }

   //파일 업로드
   function doFileUpload() {

      var cw = screen.availWidth; //화면 넓이
      var ch = screen.availHeight; //화면 높이

      var sw = 500; //띄울 창의 넓이
      var sh = 400; //띄울 창의 높이

      var ml = (cw - sw) / 2; //가운데 띄우기위한 창의 x위치
      var mt = (ch - sh) / 2; //가운데 띄우기위한 창의 y위치

      window.open("/file/FileUploadSingPOP.do?jObj=fileGRP", "UPLOAD_POP",
            "width=" + sw + ",height=" + sh + ",top=" + mt + ",left=" + ml
                  + ",resizable=no,scrollbars=yes");
   }
   //이미지 첨부가 완료되면 실행될 함수
   function doUploadOK() {

      var btnImg = document.getElementById("btnImg");

      btnImg.value = "업로드 완료";
      btnImg.disabled;

   }
   
   
   
   
   </script>
   
</head>

<body>

    <div id="wrapper">

   <%@include file="/inc/menu.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">축제정보등록 관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">축제정보등록
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
 
                        <form name="f" id="f" method="post" action="/fest/festInsert.do" onsubmit="return doAction(this)">
                           <table align="center" style="width: 100%" border="1"
                              class="table table-striped table-bordered table-hover">
                              <tr>
                                 <td align="center"><b>시,도</b></td>
                                 <td colspan="3"><input type="text" name="city" maxlength="10" class="form-control"/></td>
                                 <td align="center"><b>시,군,구</b></td>
                                 <td colspan="3"><input type="text" name="local" maxlength="10" class="form-control"/></td>
                              </tr>
                              <tr>
                                 <td align="center"><b>관광지</b></td>
                                 <td colspan="7"><input type="text" name="attractions"  maxlength="25" class="form-control"/></td>
                              </tr>
                              <tr>
                                 <td align="center"><b>입장료 유무</b></td>
                                 <td colspan="3"><input type="text" name="pay" maxlength="2" class="form-control"/></td>
                                 <td align="center"><b>이용객</b></td>
                                 <td colspan="3"><input type="text" name="nation" maxlength="3"class="form-control"/></td>
                              </tr>
                              <tr>
                                 <td align="center"><b>1월</b></td>
                                 <td><input type="text" name="jan" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                                 <td align="center"><b>2월</b></td>
                                 <td><input type="text" name="feb" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                                 <td align="center"><b>3월</b></td>
                                 <td><input type="text" name="mar" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                                 <td align="center"><b>4월</b></td>
                                 <td><input type="text" name="apr" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                              </tr>
                              <tr>

                                 <td align="center"><b>5월</b></td>
                                 <td><input type="text" name="may" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                                 <td align="center"><b>6월</b></td>
                                 <td><input type="text" name="jun" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                                 <td align="center"><b>7월</b></td>
                                 <td><input type="text" name="jul" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                                 <td align="center"><b>8월</b></td>
                                 <td><input type="text" name="aug" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                              </tr>
                              <tr>
                                 <td align="center"><b>9월</b></td>
                                 <td><input type="text" name="sep" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                                 <td align="center"><b>10월</b></td>
                                 <td><input type="text" name="oct" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                                 <td align="center"><b>11월</b></td>
                                 <td><input type="text" name="nov" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                                 <td align="center"><b>12월</b></td>
                                 <td><input type="text" name="dec" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)"/> </td>
                              </tr>
                              <tr>
                                 <td align="center" valign="middle" height="100px"><b>축제 사진</b></td>
                                 <td colspan="7" height="100px"><input type="hidden" name="fileGRP" id="fileGRP"/> 
                                 <input type="button" id="btnImg" value="등록" onclick="doFileUpload()" />
</td>
                              </tr>
                              <tr>
                                 <td align="center" valign="middle" height="100px"><b><br/>축제설명</b></td>
                                 <td align="center" colspan="7" height="100px" maxlength="2000"><textarea name="fst_exp" rows="20" cols="100" style="overflow:auto" class="form-control"></textarea> </td>
                              </tr>
                              <tr>
                                 <td align="center"><b>관광지 담당부서</b></td>
                                 <td colspan="3"><input type="text" name="fst_host" maxlength="80" class="form-control"/></td>
                                 <td align="center"><b>담당자 연락처</b></td>
                                 <td colspan="3">
                                 <input style="width:100px" type="text" name="hostph_1" maxlength="3" class="form-control" onkeyup="this.value=SetComma1(this.value)"/><b> - </b>
                                 <input style="width:100px" type="text" name="hostph_2" maxlength="4" class="form-control" onkeyup="this.value=SetComma1(this.value)"/><b> - </b>
                                 <input style="width:100px" type="text" name="hostph_3" maxlength="4" class="form-control" onkeyup="this.value=SetComma1(this.value)"/>
                                 </td>
                              </tr>
                              </tbody>
                           </table>
                               <p align="right">
                           <input type="submit" value="등록" class="btn btn-outline btn-success" onclick="doAction()"/>
                           <input type="button" value="목록" class="btn btn-outline btn-default" onclick="location.href='/fest/festlist.do'"/>
                               </p>
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