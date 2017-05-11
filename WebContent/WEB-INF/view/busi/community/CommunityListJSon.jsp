<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.CommunityDTO"%>
<%@page import="java.util.List"%>
<%@page import="ac.kr.ft.com.dto.CommunityComDTO"%>
<%
	CommunityDTO resultDTO = (CommunityDTO)request.getAttribute("rDTO");

	if (resultDTO==null){
		resultDTO = new CommunityDTO();
		
	}
	
	
	int ListCnt = Integer.parseInt(CmmUtil.nvl(resultDTO.getCnt(),"0")); //댓글 리스트 수
	
	List<CommunityDTO> rList = (List<CommunityDTO>)resultDTO.geteList(); //댓글 리스트

	if (rList == null) {
		rList = new ArrayList<CommunityDTO>();
	}
	
%>
<%
out.println("{\"listCnt\": \""+ ListCnt +"\", \"list\":[");

int idx=0; //인덱스

Iterator<CommunityDTO> it = rList.iterator();
while(it.hasNext()){
	CommunityDTO rDTO = (CommunityDTO)it.next();
	
	if (rDTO==null){
		rDTO = new CommunityDTO();
	}
	
	idx++; //인덱스 증가

	
	out.println("{");
	out.println("\"CMT_SEQ\":\""+ CmmUtil.nvl(rDTO.getCmt_seq()) +"\",");
	out.println("\"TITLE\":\""+ CmmUtil.nvl(rDTO.getTitle()) +"\",");
	out.println("\"USER_NAME\":\""+ CmmUtil.nvl(rDTO.getUser_name()) +"\",");
	out.println("\"READ_CNT\":\""+ CmmUtil.nvl(rDTO.getRead_cnt()) +"\",");
	out.println("\"CNT\":\""+ CmmUtil.nvl(rDTO.getCnt()) +"\",");
	out.println("\"REG_DT\":\""+ CmmUtil.nvl(rDTO.getReg_dt()) +"\"");
	out.println("}");
	
	//리스트크기와 인덱스가 같다면 "," 출력안함
	if (idx!=ListCnt){
		out.println(",");
		
	}
}
out.println("]}");
%>


