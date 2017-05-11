<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.NoticeDTO"%>
<%@page import="ac.kr.ft.com.dto.NoticeComDTO" %>
<%@page import="java.util.List"%>
<%
	NoticeDTO resultDTO = (NoticeDTO)request.getAttribute("rDTO");

	if (resultDTO==null){
		resultDTO = new NoticeDTO();
		
	}
	
	
	int ListCnt = Integer.parseInt(CmmUtil.nvl(resultDTO.getCnt(),"0")); //댓글 리스트 수
	
	List<NoticeDTO> rList = (List<NoticeDTO>)resultDTO.geteList(); //댓글 리스트

	if (rList == null) {
		rList = new ArrayList<NoticeDTO>();
	}
%>
<%
out.println("{\"listCnt\": \""+ ListCnt +"\",\"list\":[");
int idx=0; //인덱스

Iterator<NoticeDTO> it = rList.iterator();
while(it.hasNext()){
	NoticeDTO rDTO = (NoticeDTO)it.next();
	
	if (rDTO==null){
		rDTO = new NoticeDTO();
	}
	
	idx++; //인덱스 증가
	
	out.println("{");
	out.println("\"NOTICE_SEQ\":\""+ CmmUtil.nvl(rDTO.getNotice_seq()) +"\",");
	out.println("\"TITLE\":\""+ CmmUtil.nvl(rDTO.getTitle()) +"\",");
	out.println("\"READ_CNT\":\""+ CmmUtil.nvl(rDTO.getRead_cnt()) +"\",");
	out.println("\"USER_NAME\":\""+ CmmUtil.nvl(rDTO.getUser_name()) +"\",");
	out.println("\"REG_DT\":\""+ CmmUtil.nvl(rDTO.getReg_dt()) +"\",");
	out.println("\"CNT\":\""+ CmmUtil.nvl(rDTO.getCnt()) +"\"");
	out.println("}");
	
	//리스트크기와 인덱스가 같다면 "," 출력안함
	if (idx!=ListCnt){
		out.println(",");
		
	}
}
out.println("]}");
%>
