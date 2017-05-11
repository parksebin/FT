<%@page import="ac.kr.ft.com.dto.PositionDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%@ page import="ac.kr.ft.com.dto.FestivalDTO"%>
<%@ page import="ac.kr.ft.com.dto.FileDTO"%>
<%@ page import="ac.kr.ft.com.dto.SalesDTO"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%

	/*
	######################################################################
							차트 관련 소스 시작
	######################################################################
	*/
	/* String cal = CmmUtil.nvl((String)request.getAttribute("cal")); */

	SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd", Locale.KOREA );
	Date currentTime = new Date ( );
	String dTime = formatter.format ( currentTime );

	String cal = CmmUtil.nvl((String)request.getParameter("cal"), dTime);
	String cal_no = "";
	for(int i=0;i<cal.length();i++){
		if(cal.charAt(i) != '.'){
			cal_no += cal.charAt(i);
		}
	}
	System.out.println("cal : "+ cal_no);
	
	boolean viewChart = true; //차트 보여줄지 여부
	
	//메인 차트용
	JSONObject json = (JSONObject)request.getAttribute("json");
	if(json == null){
		json = new JSONObject();
		
		viewChart = false;
		
	}

   	//도넛 차트용
	SalesDTO rDTO = (SalesDTO) request.getAttribute("rDTO");

	if (rDTO == null) {
		rDTO = new SalesDTO();
		
		viewChart = false;
		
	}	
	
	//바 차트용
	List<SalesDTO> rList = (List<SalesDTO>) request.getAttribute("rList");

	if (rList == null) {
		rList = new ArrayList<SalesDTO>();
		
		viewChart = false;
		
	}
	
	/*
	######################################################################
							차트 관련 소스 끝
	######################################################################
	*/
	
	FestivalDTO festivalDTO = (FestivalDTO) request.getAttribute("festivalDTO");

	if (festivalDTO == null) {
		festivalDTO = new FestivalDTO();
	}
	String reg_dt = CmmUtil.nvl(festivalDTO.getReg_dt());

	System.out.println("CmmUtil.nvl(festivalDTO.getFst_seq()) : " + CmmUtil.nvl(festivalDTO.getFst_seq()));
	
	PositionDTO pDto = (PositionDTO)request.getAttribute("pDto");
	if(pDto == null){
		pDto = new PositionDTO();
	}
	
	String amName2day = (String) request.getAttribute("amName2day");
	String amCode2day = (String) request.getAttribute("amCode2day");
	String tmin2day = (String) request.getAttribute("tmin2day");
	String tmax2day = (String) request.getAttribute("tmax2day");

	String amName3day = (String) request.getAttribute("amName3day");
	String amCode3day = (String) request.getAttribute("amCode3day");
	String tmin3day = (String) request.getAttribute("tmin3day");
	String tmax3day = (String) request.getAttribute("tmax3day");

	String amName4day = (String) request.getAttribute("amName4day");
	String amCode4day = (String) request.getAttribute("amCode4day");
	String tmin4day = (String) request.getAttribute("tmin4day");
	String tmax4day = (String) request.getAttribute("tmax4day");

	String amName5day = (String) request.getAttribute("amName5day");
	String amCode5day = (String) request.getAttribute("amCode5day");
	String tmin5day = (String) request.getAttribute("tmin5day");
	String tmax5day = (String) request.getAttribute("tmax5day");

	String amName6day = (String) request.getAttribute("amName6day");
	String amCode6day = (String) request.getAttribute("amCode6day");
	String tmin6day = (String) request.getAttribute("tmin6day");
	String tmax6day = (String) request.getAttribute("tmax6day");

	String amName7day = (String) request.getAttribute("amName7day");
	String amCode7day = (String) request.getAttribute("amCode7day");
	String tmin7day = (String) request.getAttribute("tmin7day");
	String tmax7day = (String) request.getAttribute("tmax7day");

	String amName8day = (String) request.getAttribute("amName8day");
	String amCode8day = (String) request.getAttribute("amCode8day");
	String tmin8day = (String) request.getAttribute("tmin8day");
	String tmax8day = (String) request.getAttribute("tmax8day");

	String amName9day = (String) request.getAttribute("amName9day");
	String amCode9day = (String) request.getAttribute("amCode9day");
	String tmin9day = (String) request.getAttribute("tmin9day");
	String tmax9day = (String) request.getAttribute("tmax9day");

	String amName10day = (String) request.getAttribute("amName10day");
	String amCode10day = (String) request.getAttribute("amCode10day");
	String tmin10day = (String) request.getAttribute("tmin10day");
	String tmax10day = (String) request.getAttribute("tmax10day");
	
	System.out.println("(String) request.getAttribute(amCode10day)"+amCode10day);
	System.out.println("(String) request.getAttribute(amCode9day)"+amCode9day);
	System.out.println("(String) request.getAttribute(amCode8day)"+amCode8day);
	System.out.println("(String) request.getAttribute(amCode7day)"+amCode7day);
	System.out.println("(String) request.getAttribute(amCode6day)"+amCode6day);
	System.out.println("(String) request.getAttribute(amCode5day)"+amCode5day);
	System.out.println("(String) request.getAttribute(amCode4day)"+amCode4day);
	System.out.println("(String) request.getAttribute(amCode3day)"+amCode3day);
	System.out.println("(String) request.getAttribute(amCode2day)"+amCode2day);
	/* System.out.println("(String) request.getAttribute(amCode1day)"+amCode10day); */
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>라오푸드트럭</title>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="/css/style.css?ver=2">
<script src="/bower_components/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=M97xjXg0UjO0ou_6B8Q9"></script>
<script type="text/javascript">
	function div2Resize() {
        var divmap = document.getElementById('map');
        divmap.style.height = window.innerHeight * 0.7 + 'px';
    }
	
    window.onload = function() {
        div2Resize();

        // 브라우저 크기가 변할 시 동적으로 사이즈를 조절해야 하는경우
        window.addEventListener('resize', div2Resize);
    
        drawChart(); //차트 실행
    }
    
    //차트 관련 함수들 시작~~~!!!
	var datas = JSON.parse('<%=json.get("data") %>');
	
	function drawChart() {

	<%
	//차트가 없는 경우, 실행하지 않음
	if (viewChart){
	%>		
		var jsonData = $.getJSON(datas, function(json) {
			console.log(json); // show the info in console
			}
		);
		
	  	Morris.Area({
	        element: 'morris-area-chart',
	        data: <%=json.get("data") %>,
	        xkey: 'days',
	        ykeys: ['분식집', '패스트푸드점', '커피음료'],
	        labels: ['분식집 상권', '패스트푸드점 상권', '커피음료 상권'],
	        pointSize: 2,
	        hideHover: 'auto',
	        resize: true,
	        lineColors: ['#428bca', '#5cb85c', '#f0ad4e']
	    });
	 
	    Morris.Donut({
	        element: 'morris-donut-chart',
	        data: [{
	            label: "상권 과밀 (<%=CmmUtil.nvl(rDTO.getSt_nm1())%>)",
	            value: <%=CmmUtil.nvl(rDTO.getSt_cd1())%>
	        }, {
	            label: "상권 활성도 (<%=CmmUtil.nvl(rDTO.getSt_nm2())%>)",
	            value: <%=CmmUtil.nvl(rDTO.getSt_cd2())%>
	        }, {
	            label: "상권 성장성 (<%=CmmUtil.nvl(rDTO.getSt_nm3())%>)",
	            value: <%=CmmUtil.nvl(rDTO.getSt_cd3())%>
	        }, {
	            label: "상권 안정성 (<%=CmmUtil.nvl(rDTO.getSt_nm4())%>)",
	            value: <%=CmmUtil.nvl(rDTO.getSt_cd4())%>
	        }],
	        resize: true
	    });	
	    
	    Morris.Bar({
	        element: 'morris-bar-chart',
	        data: [
			<%
			for (int i=0;i<rList.size();i++){
				SalesDTO bDTO = rList.get(i); 
				
				if (i>0){
					out.print(",");
				}
			%>
				{
	            y: '<%=CmmUtil.nvl(bDTO.getYyyymm())%>',
	            a: <%=CmmUtil.nvl(bDTO.getRate4())%>,
	            b: <%=CmmUtil.nvl(bDTO.getRate5())%>
				}
			<%	    	
	    	}
			%>
			],
	        xkey: 'y',
	        ykeys: ['a', 'b'],
	        labels: ['신규 창업 위험지수', '점포 증감률'],
	        hideHover: 'auto',
	        resize: true
	    } );
	    
	    Morris.Bar({
	        element: 'morris-bar-chart-user',
	        data: [
				{
	            y: '1월',
	            a: <%=(CmmUtil.nvl(festivalDTO.getJan(), "0"))%>
				},
				{
	            y: '2월',
	            a: <%=(CmmUtil.nvl(festivalDTO.getFeb(), "0"))%>
				},
				{
	            y: '3월',
	            a: <%=(CmmUtil.nvl(festivalDTO.getMar(), "0"))%>
				},
				{
	            y: '4월',
	            a: <%=(CmmUtil.nvl(festivalDTO.getApr(), "0"))%>
				},
				{
	            y: '5월',
	            a: <%=(CmmUtil.nvl(festivalDTO.getMay(), "0"))%>
				},
				{
	            y: '6월',
	            a: <%=(CmmUtil.nvl(festivalDTO.getJun(), "0"))%>
				},
				{
	            y: '7월',
	            a: <%=(CmmUtil.nvl(festivalDTO.getJul(), "0"))%>
				},
				{
	            y: '8월',
	            a: <%=(CmmUtil.nvl(festivalDTO.getAug(), "0"))%>
				},
				{
	            y: '9월',
	            a: <%=(CmmUtil.nvl(festivalDTO.getSep(), "0"))%>
				},
				{
	            y: '10월',
	            a: <%=(CmmUtil.nvl(festivalDTO.getOct(), "0"))%>
				},
				{
	            y: '11월',
	            a: <%=(CmmUtil.nvl(festivalDTO.getNov(), "0"))%>
				},
				{
	            y: '12월',
	            a: <%=(CmmUtil.nvl(festivalDTO.getDec(), "0"))%>
				}
			],
	        xkey: 'y',
	        ykeys: ['a'],
	        labels: ['참여인원수'],
	        hideHover: 'auto',
	        resize: true
	    } );
	<%
	}
	%> 	    
	}
	
</script>

<%@include file="/inc/apptop.jsp"%>


</head>
<%
	int year = Integer.parseInt(cal_no.substring(0,4));	
	int month = Integer.parseInt(cal_no.substring(4,6))-1;	
	int day = Integer.parseInt(cal_no.substring(6,8));	
	
	java.util.Calendar nowcal = java.util.Calendar.getInstance();
	nowcal.set(year, month, day);
	System.out.println("써져있는 날짜 "+nowcal.getTime());

	java.util.Calendar cal1 = nowcal;
	java.util.Calendar cal2 = nowcal;
	java.util.Calendar cal3 = nowcal;
	java.util.Calendar cal11 = nowcal;
	java.util.Calendar cal22= nowcal;
	java.util.Calendar cal33 = nowcal;
	java.util.Calendar calll = nowcal; 
	java.text.DateFormat format = new java.text.SimpleDateFormat("MM.dd");
	System.out.println("써져있는 날짜 "+cal2.getTime());
	/* cal.add(cal.DATE, -7); */ // 7일(일주일)을 뺀다

	cal3.add(cal3.DATE, -3);
	String dateStr3 = format.format(cal3.getTime());

	cal2.add(cal2.DATE, +1);
	String dateStr2 = format.format(cal2.getTime());
	
	cal1.add(cal1.DATE, +1);
	String dateStr1 = format.format(cal1.getTime());

	cal11.add(cal11.DATE, +1);
	String dateStr = format.format(nowcal.getTime());
	
	cal11.add(cal11.DATE, +1);
	String dateStr11 = format.format(cal11.getTime());

	cal22.add(cal22.DATE, +1);
	String dateStr22 = format.format(cal22.getTime());

	cal33.add(cal33.DATE, +1);
	String dateStr33 = format.format(cal33.getTime());

	%>
<body>
	<!-- S: WRAPPER -->
	<div class="wrapper">
		<!-- S: HEADER -->
		<%@include file="/inc/appheader.jsp"%>

		<!-- E: HEADER -->
		<%@include file="/inc/appmenu.jsp"%>
		<!-- E: HEADER -->

		<!-- S: CONTENT -->
		<!-- join -->
		<input type="hidden" name="fst_seq"
			value="<%=CmmUtil.nvl(festivalDTO.getFst_seq())%>">
		<div class="content" style="display: block;">
			<div class="content_wrapper bl">


				<header>
					<span><%=CmmUtil.nvl(festivalDTO.getAttractions())%></span>
				</header>
				<div class="section">
	
					<%
					//차트가 없는 경우, 보여주지 않음
					if (viewChart){
					%>	
	                <div class='tb_section'>
	                    <span class="sc_desc"><b>※ 푸드트럭 관련 상권 활성화 정보</b></span>
	                </div>
	                <div class='tb_section'>
						<div id="morris-area-chart"></div>
	                </div>
                	
	                <div class='tb_section'>
	                    <span class="sc_desc"><b>※ 푸드트럭 관련 상권 지표</b></span>
	                </div>
	                <div class='tb_section'>
	                    <div id="morris-donut-chart"></div>
	                </div>
                                	
	                <div class='tb_section'>
	                    <span class="sc_desc"><b>※ 주변 신규 창업 위험지수 및 점포 증감률</b></span>
	                </div>
	                <div class='tb_section'>
	                    <div id="morris-bar-chart"></div>
	                </div>
	                
	                <div class='tb_section'>
	                    <span class="sc_desc"><b>※ 참여 인원수</b></span>
	                </div>
	                <div class='tb_section'>
	                    <div id="morris-bar-chart-user"></div>
	                </div>
     				<%
					}
					%> 	
					<div class='tb_section'>
						<span class="sc_head"><b>날짜</b></span> <span class="sc_head"><b>날씨</b></span> <span class="sc_head"><b>최저온도</b></span> <span
							class="sc_head"><b>최고온도</b></span>

						<div class='tb_section'>
							<span class="sc_head"><%=dateStr3%></span> <span class="sc_head">
								<%
									String j = "";
									if (amCode2day.equals("SKY_W01")) {
										j = "01";
									} else if (amCode2day.equals("SKY_W02")) {
										j = "02";
									} else if (amCode2day.equals("SKY_W03")) {
										j = "03";
									} else if (amCode2day.equals("SKY_W04")) {
										j = "18";
									} else if (amCode2day.equals("SKY_W07")) {
										j = "21";
									} else if (amCode2day.equals("SKY_W09")) {
										j = "12";
									} else if (amCode2day.equals("SKY_W10")) {
										j = "21";
									} else if (amCode2day.equals("SKY_W11")) {
										j = "04";
									} else if (amCode2day.equals("SKY_W12")) {
										j = "13";
									} else if (amCode2day.equals("SKY_W13")) {
										j = "32";
									}
								%><img
								src="${pageContext.request.contextPath}/resources/icons/<%=j%>.png"
								width="30">
							</span>  <span
								class="sc_head"><%=tmin2day%>˚C</span> <span class="sc_head"><%=tmax2day%>˚C</span>
						</div>
						<div class='tb_section'>
							<span class="sc_head"><%=dateStr2%></span> <span class="sc_head">
								<%
									String j3 = "";
									if (amCode3day.equals("SKY_W01")) {
										j3 = "01";
									} else if (amCode3day.equals("SKY_W02")) {
										j3 = "02";
									} else if (amCode3day.equals("SKY_W03")) {
										j3 = "03";
									} else if (amCode3day.equals("SKY_W04")) {
										j3 = "18";
									} else if (amCode3day.equals("SKY_W07")) {
										j3 = "21";
									} else if (amCode3day.equals("SKY_W09")) {
										j3 = "12";
									} else if (amCode3day.equals("SKY_W10")) {
										j3 = "21";
									} else if (amCode3day.equals("SKY_W11")) {
										j3 = "04";
									} else if (amCode3day.equals("SKY_W12")) {
										j3 = "13";
									} else if (amCode3day.equals("SKY_W13")) {
										j3 = "32";
									}
								%><img
								src="${pageContext.request.contextPath}/resources/icons/<%=j3%>.png"
								width="30">
							</span> <span
								class="sc_head"><%=tmin3day%>˚C</span> <span class="sc_head"><%=tmax3day%>˚C</span>
						</div>

						<div class='tb_section'>
							<span class="sc_head"><%=dateStr1%></span> <span class="sc_head">
								<%
									String j4 = "";
									if (amCode4day.equals("SKY_W01")) {
										j4 = "01";
									} else if (amCode4day.equals("SKY_W02")) {
										j4 = "02";
									} else if (amCode4day.equals("SKY_W03")) {
										j4 = "03";
									} else if (amCode4day.equals("SKY_W04")) {
										j4 = "18";
									} else if (amCode4day.equals("SKY_W07")) {
										j4 = "21";
									} else if (amCode4day.equals("SKY_W09")) {
										j4 = "12";
									} else if (amCode4day.equals("SKY_W10")) {
										j4 = "21";
									} else if (amCode4day.equals("SKY_W11")) {
										j4 = "04";
									} else if (amCode4day.equals("SKY_W12")) {
										j4 = "13";
									} else if (amCode4day.equals("SKY_W13")) {
										j4 = "32";
									}
								%><img
								src="${pageContext.request.contextPath}/resources/icons/<%=j4%>.png"
								width="30">
							</span>  <span
								class="sc_head"><%=tmin4day%>˚C</span> <span class="sc_head"><%=tmax4day%>˚C</span>
						</div>

						<div class='tb_section'>
							<span class="sc_head"><b><%=dateStr%></b></span> <span class="sc_head">
								<%
									String j5 = "";
									if (amCode5day.equals("SKY_W01")) {
										j5 = "01";
									} else if (amCode5day.equals("SKY_W02")) {
										j5 = "02";
									} else if (amCode5day.equals("SKY_W03")) {
										j5 = "03";
									} else if (amCode5day.equals("SKY_W04")) {
										j5 = "18";
									} else if (amCode5day.equals("SKY_W07")) {
										j5 = "21";
									} else if (amCode5day.equals("SKY_W09")) {
										j5 = "12";
									} else if (amCode5day.equals("SKY_W10")) {
										j5 = "21";
									} else if (amCode5day.equals("SKY_W11")) {
										j5 = "04";
									} else if (amCode5day.equals("SKY_W12")) {
										j5 = "13";
									} else if (amCode5day.equals("SKY_W13")) {
										j5 = "32";
									}
								%><img
								src="${pageContext.request.contextPath}/resources/icons/<%=j5%>.png"
								width="30">
							</span>  <span
								class="sc_head"><b><%=tmin5day%>˚C</b></span> <span class="sc_head"><b><%=tmax5day%>˚C</b></span>
						</div>

						<div class='tb_section'>
							<span class="sc_head"><%=dateStr11%></span> <span class="sc_head">
								<%
									String j6 = "";
									if (amCode6day.equals("SKY_W01")) {
										j6 = "01";
									} else if (amCode6day.equals("SKY_W02")) {
										j6 = "02";
									} else if (amCode6day.equals("SKY_W03")) {
										j6 = "03";
									} else if (amCode6day.equals("SKY_W04")) {
										j6 = "18";
									} else if (amCode6day.equals("SKY_W07")) {
										j6 = "21";
									} else if (amCode6day.equals("SKY_W09")) {
										j6 = "12";
									} else if (amCode6day.equals("SKY_W10")) {
										j6 = "21";
									} else if (amCode6day.equals("SKY_W11")) {
										j6 = "04";
									} else if (amCode6day.equals("SKY_W12")) {
										j6 = "13";
									} else if (amCode6day.equals("SKY_W13")) {
										j6 = "32";
									}
								%><img
								src="${pageContext.request.contextPath}/resources/icons/<%=j6%>.png"
								width="30">
							</span>   <span
								class="sc_head"><%=tmin6day%>˚C</span> <span class="sc_head"><%=tmax6day%>˚C</span>
						</div>

						<div class='tb_section'>
							<span class="sc_head"><%=dateStr22%></span> <span class="sc_head">
								<%
									String j7 = "";
									if (amCode7day.equals("SKY_W01")) {
										j7 = "01";
									} else if (amCode7day.equals("SKY_W02")) {
										j7 = "02";
									} else if (amCode7day.equals("SKY_W03")) {
										j7 = "03";
									} else if (amCode7day.equals("SKY_W04")) {
										j7 = "18";
									} else if (amCode7day.equals("SKY_W07")) {
										j7 = "21";
									} else if (amCode7day.equals("SKY_W09")) {
										j7 = "12";
									} else if (amCode7day.equals("SKY_W10")) {
										j7 = "21";
									} else if (amCode7day.equals("SKY_W11")) {
										j7 = "04";
									} else if (amCode7day.equals("SKY_W12")) {
										j7 = "13";
									} else if (amCode7day.equals("SKY_W13")) {
										j7 = "32";
									}
								%><img
								src="${pageContext.request.contextPath}/resources/icons/<%=j7%>.png"
								width="30">
							</span>   <span
								class="sc_head"><%=tmin7day%>˚C</span> <span class="sc_head"><%=tmax7day%>˚C</span>
						</div>

						<div class='tb_section'>
							<span class="sc_head"><%=dateStr33%></span> <span class="sc_head">
								<%
									String j8 = "";
									if (amCode8day.equals("SKY_W01")) {
										j8 = "01";
									} else if (amCode8day.equals("SKY_W02")) {
										j8 = "02";
									} else if (amCode8day.equals("SKY_W03")) {
										j8 = "03";
									} else if (amCode8day.equals("SKY_W04")) {
										j8 = "18";
									} else if (amCode8day.equals("SKY_W07")) {
										j8 = "21";
									} else if (amCode8day.equals("SKY_W09")) {
										j8 = "12";
									} else if (amCode8day.equals("SKY_W10")) {
										j8 = "21";
									} else if (amCode8day.equals("SKY_W11")) {
										j8 = "04";
									} else if (amCode8day.equals("SKY_W12")) {
										j8 = "13";
									} else if (amCode8day.equals("SKY_W13")) {
										j8 = "32";
									}
								%><img
								src="${pageContext.request.contextPath}/resources/icons/<%=j8%>.png"
								width="30">
							</span>   <span
								class="sc_head"><%=tmin8day%>˚C</span> <span class="sc_head"><%=tmax8day%>˚C</span>
								</div>


						<div class='tb_section'>
							<span class="sc_head"><b>소재지</b></span> <span class="sc_desc"><%=CmmUtil.nvl(festivalDTO.getCity())%>&nbsp;&nbsp;&nbsp;<%=CmmUtil.nvl(festivalDTO.getLocal())%></span>
						</div>
						<div class='tb_section'>
							<span class="sc_head"><b>관광지</b></span> <span class="sc_desc"><%=CmmUtil.nvl(festivalDTO.getAttractions())%></span>
						</div>
						<div class='tb_section'>
							<span class="sc_head"><b>입장료<br />유무</b>
							</span> <span class="sc_desc"><%=CmmUtil.nvl(festivalDTO.getPay())%></span>

							<span class="sc_head"><b>입장객</b></span> <span class="sc_desc"><%=CmmUtil.nvl(festivalDTO.getNation())%></span>
						</div>
						<div class='tb_section'>
							<span class="sc_head"><b>축제 사진</b></span> <span class="sc_desc"><img
								src="<%=CmmUtil.nvl(festivalDTO.getFile_name())%>" /></span>
						</div>
						<div class='tb_section'>
							<span class="sc_head"><b>축제 설명</b></span> <span class="sc_desc"><%=CmmUtil.nvl(festivalDTO.getFst_exp())%></span>
						</div>
						<div class='tb_section'>
							<div id="map" style="width:100%;height:500px"></div>
							<script type="text/javascript">
	        var HOME_PATH = window.HOME_PATH || '.';
	        var latlng = new naver.maps.LatLng(<%=CmmUtil.nvl(pDto.getLat()) %>, <%=CmmUtil.nvl(pDto.getLng()) %>);
	        var map = new naver.maps.Map('map', {
	                center: latlng,
	                zoom: 11
	            });
	        
	        var marker = new naver.maps.Marker({
	                map: map,
	                position: latlng
	            });
	        
	        <%
	        	if(CmmUtil.nvl(festivalDTO.getAttractions()).equals("경복궁")){
	        %>
	        var position = new naver.maps.LatLng(37.5757, 126.975);
	        var redMarker = new naver.maps.Marker({
	            position: position,
	            map: map,
	            icon: {
	                url: '/resources/marker/ico_pin.jpg', //50, 68 크기의 원본 이미지
	                size: new naver.maps.Size(25, 34),
	                scaledSize: new naver.maps.Size(25, 34),
	                origin: new naver.maps.Point(0, 0),
	                anchor: new naver.maps.Point(12, 34)
	            }
	        });
	        <%
	        	}else if(CmmUtil.nvl(festivalDTO.getAttractions()).equals("국립중앙박물관")){
	        %>
	        var position = new naver.maps.LatLng(37.5215, 126.977);
	        var redMarker = new naver.maps.Marker({
	            position: position,
	            map: map,
	            icon: {
	                url: '/resources/marker/ico_pin.jpg', //50, 68 크기의 원본 이미지
	                size: new naver.maps.Size(25, 34),
	                scaledSize: new naver.maps.Size(25, 34),
	                origin: new naver.maps.Point(0, 0),
	                anchor: new naver.maps.Point(12, 34)
	            }
	        });
	        <%}%>
	        <%if(CmmUtil.nvl(festivalDTO.getAttractions()).equals("남산골한옥마을")){ %>
	        var position = new naver.maps.LatLng(37.56, 126.99340);
	        var redMarker = new naver.maps.Marker({
	            position: position,
	            map: map,
	            icon: {
	                url: '/resources/marker/ico_pin.jpg', //50, 68 크기의 원본 이미지
	                size: new naver.maps.Size(25, 34),
	                scaledSize: new naver.maps.Size(25, 34),
	                origin: new naver.maps.Point(0, 0),
	                anchor: new naver.maps.Point(12, 34)
	            }
	        });
	        <%}%>
	        
	        <%if(CmmUtil.nvl(festivalDTO.getAttractions()).equals("서울시립미술관 본관")){ %>
	        var position = new naver.maps.LatLng(37.56287, 126.9731);
	        var redMarker = new naver.maps.Marker({
	            position: position,
	            map: map,
	            icon: {
	                url: '/resources/marker/ico_pin.jpg', //50, 68 크기의 원본 이미지
	                size: new naver.maps.Size(25, 34),
	                scaledSize: new naver.maps.Size(25, 34),
	                origin: new naver.maps.Point(0, 0),
	                anchor: new naver.maps.Point(12, 34)
	            }
	        });
	        <%}%>
	        
	        <%if(CmmUtil.nvl(festivalDTO.getAttractions()).equals("창덕궁")){ %>
	        var position = new naver.maps.LatLng(37.5812, 126.9893);
	        var redMarker = new naver.maps.Marker({
	            position: position,
	            map: map,
	            icon: {
	                url: '/resources/marker/ico_pin.jpg', //50, 68 크기의 원본 이미지
	                size: new naver.maps.Size(25, 34),
	                scaledSize: new naver.maps.Size(25, 34),
	                origin: new naver.maps.Point(0, 0),
	                anchor: new naver.maps.Point(12, 34)
	            }
	        });
	        <%}%>
	        
	        <%if(CmmUtil.nvl(festivalDTO.getAttractions()).equals("서대문자연사박물관")){ %>
	        var position = new naver.maps.LatLng(37.5759, 126.9365);
	        var redMarker = new naver.maps.Marker({
	            position: position,
	            map: map,
	            icon: {
	                url: '/resources/marker/ico_pin.jpg', //50, 68 크기의 원본 이미지
	                size: new naver.maps.Size(25, 34),
	                scaledSize: new naver.maps.Size(25, 34),
	                origin: new naver.maps.Point(0, 0),
	                anchor: new naver.maps.Point(12, 34)
	            }
	        });
	        <%}%>
	        
	        <%if(CmmUtil.nvl(festivalDTO.getAttractions()).equals("서대문형무소역사관")){ %>
	        var position = new naver.maps.LatLng(37.5748522, 126.9585);
	        var redMarker = new naver.maps.Marker({
	            position: position,
	            map: map,
	            icon: {
	                url: '/resources/marker/ico_pin.jpg', //50, 68 크기의 원본 이미지
	                size: new naver.maps.Size(25, 34),
	                scaledSize: new naver.maps.Size(25, 34),
	                origin: new naver.maps.Point(0, 0),
	                anchor: new naver.maps.Point(12, 34)
	            }
	        });
	        <%}%>


	        /* naver.maps.Event.addListener(marker, "click", function(e) {
	            if (infowindow.getMap()) {
	                infowindow.close();
	            } else {
	                infowindow.open(map, marker);
	            }
	        }); */
		    	
	   		</script>
						</div>
						<div class='tb_section'>
							<span class="sc_head"><b>관광지<br />담당부서</b>
							</span> <span class="sc_desc"><%=CmmUtil.nvl(festivalDTO.getFst_host())%></span>
						</div>
						<div class='tb_section'>
							<span class="sc_head"><b>담당자<br />연락처</b>
							</span> <span class="sc_desc"><%=CmmUtil.nvl(festivalDTO.getHostph_1())%><b>-</b>
								<%=CmmUtil.nvl(festivalDTO.getHostph_2())%><b>-</b> <%=CmmUtil.nvl(festivalDTO.getHostph_3())%></span>
						</div>
						<div class="view_modify btn_wrap">
							<a href="javascript:history.go(-1)" class="btn_global"> 목록</a>
						</div>
						<div class='fs_detail'></div>
					</div>
				</div>
			</div>
			<!-- join -->
			<!-- E: CONTENT -->

			<!-- S: FOOTER -->
			<%@include file="/inc/appfooter.jsp"%>


			<!-- E: FOOTER -->
		</div>
		<!-- E: WRAPPER -->
		
<!-- jQuery -->
<script src="/bower_components/jquery/dist/jquery.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="/bower_components/raphael/raphael-min.js"></script>
<script src="/bower_components/morrisjs/morris.min.js"></script>
		
</body>
</html>
