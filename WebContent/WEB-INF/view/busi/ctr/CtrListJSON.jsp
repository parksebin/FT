<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.CtrDTO"%>
<%@page import="java.util.List"%>
<%
	CtrDTO resultDTO = (CtrDTO)request.getAttribute("rDTO");

	if (resultDTO==null){
		resultDTO = new CtrDTO();
	}
	int ListCnt = Integer.parseInt(CmmUtil.nvl(resultDTO.getCnt(),"0")); //리스트 수
	
	List<CtrDTO> rList = (List<CtrDTO>)resultDTO.geteList(); //리스트

	if (rList == null) {
		rList = new ArrayList<CtrDTO>();
	}
%>
<%
out.println("{\"listCnt\": \""+ ListCnt +"\",\"list\":[");
int idx=0; //인덱스
System.out.println("리스트사이즈"+rList.size());

Iterator<CtrDTO> it = rList.iterator();
while(it.hasNext()){
	CtrDTO rDTO = (CtrDTO)it.next();
	
	if (rDTO==null){
		rDTO = new CtrDTO();
	}
	
	if(rDTO.getUser_name().length()>=7){
		rDTO.setUser_name(rDTO.getUser_name().substring(0,5)+"...");
	}

	idx++; //인덱스 증가
	
	out.println("{");
	out.println("\"CTR_SEQ\":\""+ CmmUtil.nvl(rDTO.getCtr_seq()) +"\",");
	out.println("\"TITLE\":\""+ CmmUtil.nvl(rDTO.getTitle()) +"\",");
	out.println("\"USER_NAME\":\""+ CmmUtil.nvl(rDTO.getUser_name()) +"\",");
	out.println("\"REG_DT\":\""+ CmmUtil.nvl(rDTO.getReg_dt()) +"\",");
	out.println("\"PROGRESS\":\""+ CmmUtil.nvl(rDTO.getProgress()) +"\"");
	out.println("}");
	
	//리스트크기와 인덱스가 같다면 "," 출력안함
System.out.println(ListCnt);
	if (idx!=ListCnt){
		out.println(",");
		
	}
}
out.println("]}");
%>
