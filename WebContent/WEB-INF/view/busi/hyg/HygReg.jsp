<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>라오푸드트럭</title>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">

   <script type="text/javascript">
   
   

   function doAction10() {
      var f = document.getElementById("f");
      if (f.title.value==""){
         alert("위생인증 제목을 업로드하시길 바랍니다.");
         f.title.focus();
         return;
      }
      if (f.contents.value==""){
         alert("내용을 업로드하시길 바랍니다.");
         f.contents.focus();
         return
      }
      
      if (f.fileGRP.value==""){
         alert("위생인증 사진을 업로드하시길 바랍니다.");
         
         return
      } if (calBytes(f.title.value) > 100) {
           alert("제목은 최대 100Bytes까지 입력 가능합니다.");
           f.title.focus();
           return;
        }

         if (calBytes(f.contents.value) > 4000) {
           alert("내용은 최대 4000Bytes까지 입력 가능합니다.");
           f.contents.focus();
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

      alert("doUploadOK");
      var btnImg = document.getElementById("btnImg");

      btnImg.value = "업로드 완료";
      btnImg.disabled;

   }
</script>
       
<%@include file="/busiinc/apptop.jsp" %>


</head>
<body>
<!-- S: WRAPPER -->
<div class="wrapper">
    <!-- S: HEADER -->
   <%@include file="/busiinc/appheader.jsp"%>
    <!-- E: HEADER -->

    <!-- S: CONTENT -->
    <%@include file="/busiinc/appmenu.jsp"%>
    <!-- join -->
    
    
     <form name="f" id="f" method="post" action="/hyg/busihygInsert.do">
    <div class="content" style="display:block;">
        <div class="content_wrapper">
           <header><span>인증서 등록</span></header>
         <div class="section">
                <!-- group -->
               <div class="input_row">
               <span class="input_box">
                  <label class="lbl" >제목</label>
                  <input type="text" maxlength="50" placeholder="제목" class="input_area" name="title" >
               </span>
            </div>
   
            <div class="group">
               <div class="input_row id_check">
                  <span class="input_box">
                     <label class="lbl">이미지</label>
                  </span>   
               </div>
               <input type="hidden" name="fileGRP" id="fileGRP" /> 
               <input type="button"  id="btnImg" value="등록" onclick="doFileUpload()" class="btn_small check white"/>
            </div>
                <!-- group -->
            <div class="input_content input_box" style="height:600px";>
                        <textarea name="contents" maxlength="2000"  placeholder="내용" style="height:600px"   ></textarea>
            </div>
            </div>
        </div>
    </div>
    <div class="content wrapper50">
       <input type="button"  value="등록" class="btn_half left" onclick="doAction10()">
       <input type="button"  value="목록" class="btn_half left" onclick="location.href='/hyg/busiHygList.do'">
    </div>
    </form>
    <!-- E: CONTENT -->

    <!-- S: FOOTER -->
<%@include file="/busiinc/appfooter.jsp"%>
    <!-- E: FOOTER -->
</div>
<!-- E: WRAPPER -->
</body>
</html>
    