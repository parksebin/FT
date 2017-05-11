<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="ac.kr.ft.com.dto.MenuInfoDTO"%>
<%@ page import="java.util.List"%>  
<%@ page import="ac.kr.ft.com.dto.MenuComDTO"%>
<%
	
	MenuInfoDTO menuinfoDto = (MenuInfoDTO) request.getAttribute("menuinfoDto");

	if (menuinfoDto == null) {
		menuinfoDto = new MenuInfoDTO();
	}
	List<MenuComDTO> cList = menuinfoDto.getrList();

	if (cList == null) {
		cList = new ArrayList<MenuComDTO>();
	}



%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>라오푸드트럭</title>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">
	
	
	<script type="text/javascript">
	function doAction(gubun) {
		var f = document.getElementById("form1");
		if (gubun == "U") {
			f.action = "busiupdateForm.do";
			f.submit();
		} else if (gubun == "D") {
			if (confirm("삭제하시겠습니까?")) {
				f.action = "busidelete.do";
				f.submit();
			}
		}
	}
</script>


</head>
<body>
<!-- S: WRAPPER -->
<div class="wrapper">
    <!-- S: HEADER -->
    <div class="header">
        <span> 라오푸드트럭</span>
        <a href='#' ><div class="sandwich"><div class="sandwich-icon"></div></div></a>
        <a href='#' ><div class="search"><div class="search-icon"></div></div></a>
    </div>
    <!-- E: HEADER -->

    <!-- S: CONTENT -->
    <!-- join -->
    <div class="content" style="display:block;">
        <div class="content_wrapper">
        	<header><span>코끼리 닭꼬치</span></header>
			<div class="section">
                <div class='food_main'><img src='/img/food/kkokko.jpg' /></div>
                <div class='tb_food'>
                     <div class='tb_section'>
                        <span class="sc_head">가격</span>
                          <span class="sc_desc"><div><%=CmmUtil.viewComma(CmmUtil.nvl(menuinfoDto.getPrice(), "0")) + "원"%></div></span>
                     </div>
                    <div class='tb_section'>
                        <span class="sc_head">매뉴소개</span>
                        <span class="sc_desc">
                            <div>
                            <%=CmmUtil.nvl(menuinfoDto.getMenu_int())%>
                            </div>
                        </span>
                    </div>
                    <div class='tb_section bl'>
                         <span class="sc_head">원산지</span>
                          <span class="sc_desc">
                            <div>
                           <%=CmmUtil.nvl(menuinfoDto.getCountry_info())%>
                            </div>
                          </span>
                    </div>
                </div>
                
                <form name="form1" id="form1" method="post">
				<input type="hidden" name="menu_seq" value="<%=CmmUtil.nvl(menuinfoDto.getMenu_seq())%>">
				</form>
                
                <div class='wrapper50'>
                    <input type="submit" title="수정" value="수정" class="btn_tri">
                    <input type="submit" title="삭제" value="삭제" class="btn_tri">
                    <input type="submit" title="목록" value="목록" class="btn_tri">
                </div>
                <ul class="reply">
                     <li>
                		<div class="reply_detail">
							<div class="head">
								<span class='name'>돼지자연</span>
								<span class='date'> | 2016.09.02 20:34:33 </span>
							</div>
                            <span class="input_box">
                                <textarea placeholder="내용을 입력해주세요."></textarea>
                            </span>
						<div class="view_modify btn_wrap">
							<a href="#" class="btn_confirm">등록</a>
						</div>
 
						</div>
                    </li>
 

                    <li>
                		<div class="reply_detail">
							<div class="head">
								<span class='name'>돼지자연</span>
								<span class='date'> | 2016.09.02 20:34:33 </span>
							</div>
                            <span class="input_box">
                                <textarea placeholder="내용을 입력해주세요.">맛이쪙맛이쪙</textarea>
                            </span>
						<div class="view_modify btn_wrap">
							<a href="#" class="btn_confirm">확인</a>
							<a href="#" class="btn_cancle">취소</a>
						</div>
 
						</div>
                    </li>
 
                    <li>
                		<div class="reply_detail">
							<div class="head">
								<span class='name'>돼지자연</span>
								<span class='date'> | 2016.09.02 20:34:33 </span>
							</div>
                   		맛이쪙
						<div class="view_modify btn_wrap">
							<a href="#" class="btn_delete">삭제</a>
							<a href="#" class="btn_modify">수정</a>
						</div>
 
						</div>
                    </li>
 
                    <li>
                		<div class="reply_detail">
							<div class="head">
								<span class='name'>돼지자연</span>
								<span class='date'> | 2016.09.02 20:34:33 </span>
							</div>
                   		맛이쪙
						</div>
                    </li>
 
                    <li>
                		<div class="reply_detail">
							<div class="head">
								<span class='name'>돼지자연</span>
								<span class='date'> | 2016.09.02 20:34:33 </span>
							</div>
                   		맛이쪙
						</div>
                    </li>
		            <input type="submit" title="더보기" value="더보기" class="btn_white">
                </ul>
            </div>
        </div>
    </div>
    <!-- join -->
    <!-- E: CONTENT -->

    <!-- S: FOOTER -->
    <div class="footer">
        <div class="share">
            <a href='#'><img alt='페이스북' src="/img/facebook.png" /></a>
            &nbsp;
            <a href='#'><img alt='인스타그램' src="/img/instagram.png" /></a>
            <br/>
        </div>
        <div class='contact'>
            <a href='#'><img alt='라오푸드트럭로고' src="/img/facebook.png" /></a>
            <span>
                TEL : 010-9120-0514<br/>
                Email: zion137@naver.com
            </span>
        </div>
        <button><span>로그아웃</span></button>
    </div>
    <!-- E: FOOTER -->
</div>
<!-- E: WRAPPER -->
</body>
</html>
