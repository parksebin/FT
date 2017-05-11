package ac.kr.ft.com.dto;

import java.util.List;

public class MenuInfoDTO {
	private String menu_seq;
	private String menu_name;
	private String menu_int;
	private String price;
	private String file_name;
	private String file_grp;
	private String country_info;
	private String reg_user_no;
	private String reg_dt;
	private String chg_user_no;
	private String chg_dt;
	private String user_no;
	private List<MenuComDTO> rList;
	
	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}
	
	
	
	public List<MenuComDTO> getrList() {
		return rList;
	}

	public void setrList(List<MenuComDTO> rList) {
		this.rList = rList;
	}

	private String[] allCheckSeq; // 전체 삭제 항목 배열로 받기

	public String[] getAllCheckSeq() {
		return allCheckSeq;
	}

	public void setAllCheckSeq(String[] allCheckSeq) {
		this.allCheckSeq = allCheckSeq;
	}

	// 파일 경로 정보 가져올 항목
	private String file_path;

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getMenu_seq() {
		return menu_seq;
	}

	public void setMenu_seq(String menu_seq) {
		this.menu_seq = menu_seq;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public String getMenu_int() {
		return menu_int;
	}

	public void setMenu_int(String menu_int) {
		this.menu_int = menu_int;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
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

	public String getCountry_info() {
		return country_info;
	}

	public void setCountry_info(String country_info) {
		this.country_info = country_info;
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

}
