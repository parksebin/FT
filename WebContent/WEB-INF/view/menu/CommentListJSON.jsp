<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.MenuInfoDTO"%>
<%@page import="java.util.List"%>
<%@page import="ac.kr.ft.com.dto.MenuComDTO"%>
<%
	MenuComDTO resultDTO = (MenuComDTO)request.getAttribute("rDTO");

	if (resultDTO==null){
		resultDTO = new MenuComDTO();
		
	}

	int ListCnt = Integer.parseInt(CmmUtil.nvl(resultDTO.getCnt(),"0")); //댓글 리스트 수
	
	List<MenuComDTO> rList = (List<MenuComDTO>)resultDTO.getrList(); //댓글 리스트수

	if (rList == null) {
		rList = new ArrayList<MenuComDTO>();
	}
%>
<%
out.println("{\"listCnt\": \""+ ListCnt +"\", \"list\":[");

int idx=0; //인덱스

Iterator<MenuComDTO> it = rList.iterator();
while(it.hasNext()){
	MenuComDTO rDTO = (MenuComDTO)it.next();
	
	if (rDTO==null){
		rDTO = new MenuComDTO();
	}
	
	idx++; //인덱스 증가
	
	out.println("{");
	out.println("\"MENU_SEQ\":\""+ CmmUtil.nvl(rDTO.getMenu_seq()) +"\",");
	out.println("\"COM_SEQ\":\""+ CmmUtil.nvl(rDTO.getCom_seq()) +"\",");
	out.println("\"CONTENTS\":\""+ CmmUtil.nvl(rDTO.getContents()) +"\",");
	out.println("\"USER_NAME\":\""+ CmmUtil.nvl(rDTO.getUser_name()) +"\",");
	out.println("\"REG_DT\":\""+ CmmUtil.nvl(rDTO.getReg_dt()) +"\"");
	out.println("}");
	
	//리스트크기와 인덱스가 같다면 "," 출력안함
	if (idx!=ListCnt){
		out.println(",");
		
	}
}
out.println("]}");
%>

