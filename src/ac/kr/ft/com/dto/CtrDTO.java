package ac.kr.ft.com.dto;

import java.util.List;

public class CtrDTO {

	private String ctr_seq;
	private String title;
	private String contents;
	private String progress;
	private String user_name;
	private String email1;
	private String email2;
	private String tel_1;
	private String tel_2;
	private String tel_3;
	private String reg_user_no;
	private String reg_dt;
	private String chg_user_no;
	private String chg_dt;
	private String people;//앱에서 예상인원
	private String place;// 장소
	private String searchBox; // 검색 조건
	private String searchText; // 검색어
	
	private String[] allCheckSeq; // 삭제될 항목 배열로 받기

	private String cnt; // 게시글 수

	private String user_no;

	private String start_page; // 게시글 보여줄 시작 레코드
	private String end_page; // 게시글 보여줄 마지막 레코드

	private List<CtrDTO> eList; // 조회 결과 가져오기

	public String getCtr_seq() {
		return ctr_seq;
	}

	public void setCtr_seq(String ctr_seq) {
		this.ctr_seq = ctr_seq;
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

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getTel_1() {
		return tel_1;
	}

	public void setTel_1(String tel_1) {
		this.tel_1 = tel_1;
	}

	public String getTel_2() {
		return tel_2;
	}

	public void setTel_2(String tel_2) {
		this.tel_2 = tel_2;
	}

	public String getTel_3() {
		return tel_3;
	}

	public void setTel_3(String tel_3) {
		this.tel_3 = tel_3;
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

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String[] getAllCheckSeq() {
		return allCheckSeq;
	}

	public void setAllCheckSeq(String[] allCheckSeq) {
		this.allCheckSeq = allCheckSeq;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
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

	public List<CtrDTO> geteList() {
		return eList;
	}

	public void seteList(List<CtrDTO> eList) {
		this.eList = eList;
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
