<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.MenuInfoDTO"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="view
    port"
   content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>메뉴등록</title>

<%@include file="/inc/top.jsp"%>

<!-- 추가된 내용임 -->
<script type="text/javascript">
   var SetComma = function(str) {
      
      var regMustNumberComma = /^[\t|0-9|,]+$/;
      str = str.replace(/,/g,'');
      
      var retValue = "";
      
      for( i = 1; i <= str.length; i++ ) {
         if(i>1 && (i%3)== 1){
            retValue = str.charAt(str.length - i) + "," + retValue;
            
         }else{
            retValue = str.charAt(str.length - i) + retValue;
            
         }
      }
      
      if( regMustNumberComma.test(retValue) == false ) {alert("숫자만  입력하실 수 있습니다.");return "";}
      
      return retValue;
   }
   
   function doAction() {
      var f = document.getElementById("f");

      if (f.menu_name.value == "") {alert("메뉴이름을 입력하시길 바랍니다.");f.menu_name.focus();return;}
      if (f.price.value == "") {alert("가격을 입력하시길 바랍니다.");f.price.focus();return;}
      if (f.menu_int.value == "") {alert("내용을 입력하시길 바랍니다.");f.menu_int.focus();return;}
      if (f.country_info.value == "") {alert("원산지를 입력하시길 바랍니다.");f.country_info.focus();return;}
      if (f.fileGRP.value == "") {alert("메뉴 사진을 업로드하시길 바랍니다.");return}
      
      if (calBytes(f.menu_name.value) > 30) {
         alert("메뉴이름은 최대 30Bytes까지 입력 가능합니다.");
         f.title.focus();
         return;
      }
      
      if (calBytes(f.price.value) > 7) {
         alert("가격은 100만원 미만까지 입력 가능합니다.");
         f.title.focus(); 
         return;
      }   
      
      if (calBytes(f.menu_int.value) > 4000) {
         alert("내용은 최대 4000Bytes까지 입력 가능합니다.");
         f.title.focus();
         return;
      }
       
      if (calBytes(f.menu_name.value) > 1000) {
          alert("원산지는 최대 1000Bytes까지 입력 가능합니다.");
          f.title.focus();
          return;
       }
      f.submit();
   }

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

    //f.target = "ifrProc";
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
   
   function doKeyOnlyNumber(event) {
      event = event || window.event;
      var keyID = (event.which) ? event.which : event.KeyCode;
      if((keyID >= 48 && keyID <= 57) || (keyID>=96 && keyID <=105) || keyID==8 || keyID==9 ){
         return true;
      }else{
         return false;
      }
   }
   
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
   //이미지 첨부가 완료되면 실행될 함수
   function doUploadOK() {

      alert("doUploadOK");
      var btnImg = document.getElementById("btnImg");

      btnImg.value = "사진이 등록되었습니다.";
      btnImg.disabled;

   }
</script>

</head>

<body>

   <div id="wrapper">

      <%@include file="/inc/menu.jsp"%>

      <div id="page-wrapper">
         <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">메뉴</h1>
            </div>
            <!-- /.col-lg-12 -->
         </div>
         <!-- /.row -->
         <div class="row">
            <div class="col-lg-12">
               <div class="panel panel-default">
                  <div class="panel-heading">메뉴등록</div>
                  <!-- /.panel-heading -->
                  <div class="panel-body">
                     <div class="dataTable_wrapper">

                        <form name="f" id="f" method="post" action="/menu/menuInsert.do">

                           <table class="table table-striped table-bordered table-hover">
                              <tr>
                                 <td align="center"  style="width :200px"><b>메뉴이름</b></td>
                                 <td><input type="text" name="menu_name" maxlength="15" class="form-control" style="width :400px" /></td>
                                 <td align="center"><b>메뉴사진</b></td>
                                 <td><input type="hidden" name="fileGRP" id="fileGRP" /> 
                                 <input type="button" id="btnImg" value="등록" onclick="doFileUpload()" /></td>
                              </tr>
                              <tr>
                                 <td align="center" ><b>가격</b></td>

                                 <td colspan="3"><input type="text" name="price" maxlength="7" class="form-control" style="width :130px" onkeyup="this.value=SetComma(this.value)"/></td>

                              </tr>
                              <tr>
                                 <td align="center"><b>내용</b></td>
                                 <td colspan="3"><textarea name="menu_int" maxlength="1000" rows="10" cols="68" class="form-control"></textarea></td>
                              </tr>
                              <tr>
                                 <td align="center"><b>원산지</b></td>
                                 <td colspan="3"><textarea name="country_info" maxlength="500" rows="10" cols="68" class="form-control"></textarea></td>
                              </tr>
                           
                           </table>
                        <p align="right">
                           <input type="button" value="등록" onclick="doAction()" class="btn btn-outline btn-success" /> 
                              <input type="button" class="btn btn-outline btn-default" value="목록" onclick="location.href='/menu/menuList.do'" />
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