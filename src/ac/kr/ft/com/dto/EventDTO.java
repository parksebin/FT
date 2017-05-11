package ac.kr.ft.com.dto;

import java.util.List;

public class EventDTO {
	private String ent_seq;
	private String title;
	private String contents;
	private String read_cnt;
	private String reg_user_no;
	private String reg_dt;
	private String chg_user_no;
	private String chg_dt;
	private String file_name;
	private String file_grp;
	private String user_name;

	private String cnt; //댓글 수

	private String user_no;

	private String start_page; // 게시글 보여줄 시작 레코드
	private String end_page; // 게시글 보여줄 마지막 레코드

	private List<EventComDTO> rList; // 조회 결과 가져오기

	private List<EventDTO> eList; // 조회 결과 가져오기

	private String searchBox; // 검색 조건
	private String searchText; // 검색어
	
	public List<EventDTO> geteList() {
		return eList;
	}

	public void seteList(List<EventDTO> eList) {
		this.eList = eList;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public String getStart_page() {
		return start_page;
	}

	public void setStart_page(String start_page) {
		this.start_page = start_page;
	}

	public String getEnd_page() {
		return end_page;
	}

	public void setEnd_page(String end_page) {
		this.end_page = end_page;
	}

	public List<EventComDTO> getrList() {
		return rList;
	}

	public void setrList(List<EventComDTO> rList) {
		this.rList = rList;
	}

	private String[] allCheckSeq; // 삭제될 항목 배열로 받기

	public String[] getAllCheckSeq() {
		return allCheckSeq;
	}

	public void setAllCheckSeq(String[] allCheckSeq) {
		this.allCheckSeq = allCheckSeq;
	}

	public String getEnt_seq() {
		return ent_seq;
	}

	public void setEnt_seq(String ent_seq) {
		this.ent_seq = ent_seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getRead_cnt() {
		return read_cnt;
	}

	public void setRead_cnt(String read_cnt) {
		this.read_cnt = read_cnt;
	}

	public String getReg_user_no() {
		return reg_user_no;
	}

	public void setReg_user_no(String reg_user_no) {
		this.reg_user_no = reg_user_no;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getChg_user_no() {
		return chg_user_no;
	}

	public void setChg_user_no(String chg_user_no) {
		this.chg_user_no = chg_user_no;
	}

	public String getChg_dt() {
		return chg_dt;
	}

	public void setChg_dt(String chg_dt) {
		this.chg_dt = chg_dt;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getFile_grp() {
		return file_grp;
	}

	public void setFile_grp(String file_grp) {
		this.file_grp = file_grp;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	public String getSearchBox() {
		return searchBox;
	}

	public void setSearchBox(String searchBox) {
		this.searchBox = searchBox;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

}
