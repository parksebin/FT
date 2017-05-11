<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.SalesDTO"%>
<%@page import="java.util.List"%>
<%

SalesDTO resultDTO = (SalesDTO)request.getAttribute("rDTO");

if (resultDTO == null) {
	resultDTO = new SalesDTO();
}
int ListCnt = Integer.parseInt(CmmUtil.nvl(resultDTO.getCnt(),"0")); 

List<SalesDTO> rList = (List<SalesDTO>)resultDTO.getrList();

if (rList == null) {
	rList = new ArrayList<SalesDTO>();
}


%>
<%
out.println("{\"listCnt\": \""+ ListCnt +"\",\"list\":[");
int idx=0; //인덱스

Iterator<SalesDTO> it = rList.iterator();
while(it.hasNext()){
	SalesDTO rDTO = (SalesDTO)it.next();
	
	if (rDTO==null){
		rDTO = new SalesDTO();
	}
	
	idx++; //인덱스 증가
	
	out.println("{");
	out.println("\"SALES_NM\":\""+ CmmUtil.nvl(rDTO.getSales_nm()) +"\",");
	out.println("\"SALES_CD\":\""+ CmmUtil.nvl(rDTO.getSales_cd()) +"\",");
	out.println("\"ST_CD1\":\""+ CmmUtil.nvl(rDTO.getSt_cd1()) +"\",");
	out.println("\"ST_CD2\":\""+ CmmUtil.nvl(rDTO.getSt_cd2()) +"\",");
	out.println("\"ST_CD3\":\""+ CmmUtil.nvl(rDTO.getSt_cd3()) +"\",");
	out.println("\"ST_CD4\":\""+ CmmUtil.nvl(rDTO.getSt_cd4()) +"\"");
	out.println("}");
	
	//리스트크기와 인덱스가 같다면 "," 출력안함
	if (idx!=ListCnt){
		out.println(",");
		
	}
}
out.println("]}");
%>

