<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.FestivalDTO"%>
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

    <title>축제정보수정</title>

   <%@include file="/inc/top.jsp" %>

<script type="text/javascript">


var SetComma = function(str) {

    var regMustNumberComma = /^[0-9|,|\t]+$/;
    str = str.replace(/,/g,'');

    var retValue = "";
        for( i = 1; i <= str.length; i++ ) {
            if( i > 1 && (i%3) == 1 )
                retValue = str.charAt(str.length - i) + "," + retValue;
            else
                retValue = str.charAt(str.length - i) + retValue;
        }
        if( regMustNoStartZero.test(retValue) == true && window.event.keyCode != 9 ) {
            alert("입력숫자는 '0'으로 시작할 수 없습니다.");
            return "";
        }
        if( regMustNumberComma.test(retValue) == false ) {
            alert("숫자만 입력하실 수 있습니다.");
            return "";
        }
        return retValue;

}
	
      function doAction(gubun) {
         var f = document.getElementById("form1");
         if(gubun=="U"){
            f.action = "festupdate.do";
            f.submit();
         }else if(gubun=="D"){
            if(confirm("삭제하시겠습니까?")){
               f.action = "delete.do";
               f.submit();
            }
         }
      }
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

         btnImg.value = "업로드가 완료되었습니다.";
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
                    <h1 class="page-header">축제정보 관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">축제정보 수정
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                            
             
             <form name="form1" method="post" action="/fest/festupdateForm.do">            
                <p align="right">
<hr>
<input type="hidden" name="fst_seq" class="form-control"  value="<%=CmmUtil.nvl(festivalDTO.getFst_seq()) %>"/><br/></p>

<table  border="1" class="table table-striped table-bordered table-hover">
                            
                              <tr>
                                 <td align="center"><b>시,도</b></td>
                                 <td colspan="3"><input type="text" name="city" class="form-control" maxlength="10" value="<%=CmmUtil.nvl(festivalDTO.getCity()) %>"/></td>
                                 <td align="center"><b>시,군,구</b></td>
                                 <td colspan="3"> <input type="text" name="local" class="form-control" maxlength="10" value="<%=CmmUtil.nvl(festivalDTO.getLocal()) %>"/></td>
                              </tr>
                              <tr>
                                 <td align="center"><b>관광지</b></td>
                                 <td colspan="7"> <input type="text" name="attractions" class="form-control"  maxlength="25" value="<%=CmmUtil.nvl(festivalDTO.getAttractions()) %>"/></td>
                              </tr>
                              <tr>
                                 <td align="center"><b>입장료 유무</b></td>
                                 <td colspan="3"><input type="text" name="pay" class="form-control" maxlength="2" value="<%=CmmUtil.nvl(festivalDTO.getPay()) %>"/></td>
                                 <td align="center"><b>이용객</b></td>
                                 <td colspan="3"><input type="text" name="nation" class="form-control" maxlength="3"  value="<%=CmmUtil.nvl(festivalDTO.getNation()) %>"/></td>
                              </tr>
                              <tr>
                                 <td align="center"><b>1월</b></td>
                                 <td><input type="text" name="jan" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)" value="<%=CmmUtil.nvl(festivalDTO.getJan()) %>"/></td>
                                 <td align="center"><b>2월</b></td>
                                 <td><input type="text" name="feb" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)" value="<%=CmmUtil.nvl(festivalDTO.getFeb()) %>"/></td>
                                 <td align="center"><b>3월</b></td>
                                 <td><input type="text" name="mar" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)" value="<%=CmmUtil.nvl(festivalDTO.getMar()) %>"/></td>
                                 <td align="center"><b>4월</b></td>
                                 <td><input type="text" name="apr" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)" value="<%=CmmUtil.nvl(festivalDTO.getApr()) %>"/></td>
                              </tr>
                              <tr>

                                 <td align="center"><b>5월</b></td>
                                 <td> <input type="text" name="may" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)" value="<%=CmmUtil.nvl(festivalDTO.getMay()) %>"/></td>
                                 <td align="center"><b>6월</b></td>
                                 <td> <input type="text" name="jun" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)" value="<%=CmmUtil.nvl(festivalDTO.getJun()) %>"/></td>
                                 <td align="center"><b>7월</b></td>
                                 <td> <input type="text" name="jul" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)" value="<%=CmmUtil.nvl(festivalDTO.getJul()) %>"/></td>
                                 <td align="center"><b>8월</b></td>
                                 <td> <input type="text" name="aug" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)" value="<%=CmmUtil.nvl(festivalDTO.getAug()) %>"/></td>
                              </tr>
                              <tr>

                                 <td align="center"><b>9월</b></td>
                                 <td><input type="text" name="sep" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)" value="<%=CmmUtil.nvl(festivalDTO.getSep()) %>"/></td>
                                 <td align="center"><b>10월</b></td>
                                 <td> <input type="text" name="oct" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)" value="<%=CmmUtil.nvl(festivalDTO.getOct()) %>"/></td>
                                 <td align="center"><b>11월</b></td>
                                 <td> <input type="text" name="nov" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)" value="<%=CmmUtil.nvl(festivalDTO.getNov()) %>"/></td>
                                 <td align="center"><b>12월</b></td>
                                 <td> <input type="text" name="dec" class="form-control" maxlength="9" onkeyup="this.value=SetComma(this.value)" value="<%=CmmUtil.nvl(festivalDTO.getDec()) %>"/></td>
                              </tr>
                              <tr>
                                 <td align="center" valign="middle" height="100px"><b>축제 사진</b></td>
                                 <td colspan="7" height="100px"> 
                                 <input type="button" id="btnImg" value="등록" onclick="doFileUpload()" />
								<td colspan="7" height="100px"><input type="hidden" name="fileGRP" id="fileGRP"/> 

                              </tr>
                              <tr>
                                 <td align="center" valign="middle" height="100px"><b><br/>축제설명</b></td>
                                 <td align="center" colspan="7" height="100px"><textarea name="fst_exp" class="form-control" maxlength="2000" rows="20" cols="100" ><%=CmmUtil.nvl(festivalDTO.getFst_exp())%></textarea></td>
                              </tr>
                              <tr>
                                 <td align="center"><b>관광지 담당부서</b></td>
                                 <td colspan="3"><input type="text" name="fst_host" class="form-control" maxlength="80" value="<%=CmmUtil.nvl(festivalDTO.getFst_host()) %>"/></td>
                                 <td align="center"><b>담당자 연락처</b></td>
                                 <td colspan="3">   
                                 <input type="text" name="hostph_1" class="form-control"  maxlength="3" onkeyup="this.value=SetComma(this.value)"" style="width:20%" value="<%=CmmUtil.nvl(festivalDTO.getHostph_1()) %>"/><b> - </b>
                                 <input type="text" name="hostph_2" class="form-control"  maxlength="4" onkeyup="this.value=SetComma(this.value)"" style="width:20%" value="<%=CmmUtil.nvl(festivalDTO.getHostph_2()) %>"/><b> - </b>
                                 <input type="text" name="hostph_3" class="form-control"  maxlength="4" onkeyup="this.value=SetComma(this.value)"" style="width:20%" value="<%=CmmUtil.nvl(festivalDTO.getHostph_3()) %>"/>
                                 </td>
                              </tr>
                              </tbody>
                           </table>
                       
                           
                           
                         <p align="right">
                         <input type="submit" value="확인" class="btn btn-outline btn-info">
										<input type=button value="취소" class="btn btn-outline btn-success"
											onclick="location.href='/fest/festlist.do'"/>
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