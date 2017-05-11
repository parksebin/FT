package ac.kr.ft.com.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.JsonObject;

import ac.kr.ft.com.dto.ComDTO;
import ac.kr.ft.com.dto.EmpDTO;
import ac.kr.ft.com.dto.EventDTO;
import ac.kr.ft.com.dto.NoticeDTO;
import ac.kr.ft.com.dto.VisitorDTO;

public interface ICommService {
	void setVisitor() throws Exception;

	VisitorDTO getVisitorDto() throws Exception;

	ComDTO getComDto() throws Exception;

	List<ComDTO> getCommentList() throws Exception;

	JSONObject getJsonObject() throws Exception;

	//공지사항 리스트 불러오기
	List<ComDTO> getNewList() throws Exception;
	

	
}
