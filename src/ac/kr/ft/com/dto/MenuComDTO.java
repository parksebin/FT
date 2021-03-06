package ac.kr.ft.com.dto;

import java.util.List;

public class MenuComDTO {

	private String menu_seq;
	private String com_seq;
	private String contents;
	private String reg_user_no;
	private String reg_dt;
	private String chg_user_no;
	private String chg_dt;
	private String user_name;
	private String user_no;
	private String cnt; // 댓글수
	
	private String start_page_size; // 댓글 보여줄 시작 레코드
	private String end_page_size; // 댓글 보여줄 마지막 레코드
	
	public String getStart_page_size() {
		return start_page_size;
	}

	public void setStart_page_size(String start_page_size) {
		this.start_page_size = start_page_size;
	}

	public String getEnd_page_size() {
		return end_page_size;
	}

	public void setEnd_page_size(String end_page_size) {
		this.end_page_size = end_page_size;
	}

	private List<MenuComDTO> rList;

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public List<MenuComDTO> getrList() {
		return rList;
	}

	public void setrList(List<MenuComDTO> rList) {
		this.rList = rList;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	public String getMenu_seq() {
		return menu_seq;
	}
	public void setMenu_seq(String menu_seq) {
		this.menu_seq = menu_seq;
	}
	public String getCom_seq() {
		return com_seq;
	}
	public void setCom_seq(String com_seq) {
		this.com_seq = com_seq;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
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

	
	
	
	
	
	