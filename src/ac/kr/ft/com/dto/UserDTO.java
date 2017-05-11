package ac.kr.ft.com.dto;

import java.util.Date;
import java.util.List;

public class UserDTO{

	private String user_no;
	private String user_id;
	private String user_name;
	private String password;
	private String checkpassword;
	private String email1;
	private String email2;
	private String tel_1;
	private String tel_2;
	private String tel_3;
	private String auth;
	private String birthday;
	private String reg_dt;
	private String reg_user_no;
	private String chg_dt;
	private String chg_user_no;
	private String user_exists;
	private String cnt; // 게시글 수
	private String start_page; // 게시글 보여줄 시작 레코드
	private String end_page; // 게시글 보여줄 마지막 레코드
	private List<UserDTO> rList;
	private String searchBox; // 검색 조건
	private String searchText; // 검색어
	private String mileage;
	
	private String[] allCheckSeq; // 삭제될 항목 배열로 받기

	public String[] getAllCheckSeq() {
		return allCheckSeq;
	}

	public void setAllCheckSeq(String[] allCheckSeq) {
		this.allCheckSeq = allCheckSeq;
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

	public String getUser_exists() {
		return user_exists;
	}

	public void setUser_exists(String user_exists) {
		this.user_exists = user_exists;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getReg_user_no() {
		return reg_user_no;
	}

	public void setReg_user_no(String reg_user_no) {
		this.reg_user_no = reg_user_no;
	}

	public String getChg_dt() {
		return chg_dt;
	}

	public void setChg_dt(String chg_dt) {
		this.chg_dt = chg_dt;
	}

	public String getChg_user_no() {
		return chg_user_no;
	}

	public void setChg_user_no(String chg_user_no) {
		this.chg_user_no = chg_user_no;
	}

	public String getCheckpassword() {
		return checkpassword;
	}

	public void setCheckpassword(String checkpassword) {
		this.checkpassword = checkpassword;
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

	public List<UserDTO> getrList() {
		return rList;
	}

	public void setrList(List<UserDTO> rList) {
		this.rList = rList;
	}

	public String getMileage() {
		return mileage;
	}

	public void setMileage(String mileage) {
		this.mileage = mileage;
	}

}
