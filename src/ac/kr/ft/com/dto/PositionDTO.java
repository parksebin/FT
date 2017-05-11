package ac.kr.ft.com.dto;

public class PositionDTO {
	private String po_seq;
	private String lat;
	private String lng;
	private String title;
	private String reg_dt;
	private String reg_user_no;
	private String chg_dt;
	private String chg_user_no;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPo_seq() {
		return po_seq;
	}
	public void setPo_seq(String po_seq) {
		this.po_seq = po_seq;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
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
	public String getchg_user_no() {
		return chg_user_no;
	}
	public void setchg_user_no(String chg_user_no) {
		this.chg_user_no = chg_user_no;
	}
}
