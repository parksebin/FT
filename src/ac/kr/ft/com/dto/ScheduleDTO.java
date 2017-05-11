package ac.kr.ft.com.dto;

public class ScheduleDTO {
	private String sch_seq;
	private String title;
	private String contents;
	private String pl_dt1;
	private String pl_dt2;
	private String user_id;
	private String reg_user_no;
	private String reg_dt;
	private String chg_user_no;
	private String chg_dt;
	private String useDate;
	private int startDate;
	private int endDate;
	
	public String getSch_seq() {
		return sch_seq;
	}
	public void setSch_seq(String sch_seq) {
		this.sch_seq = sch_seq;
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
	public String getPl_dt1() {
		return pl_dt1;
	}
	public void setPl_dt1(String pl_dt1) {
		this.pl_dt1 = pl_dt1;
	}
	public String getPl_dt2() {
		return pl_dt2;
	}
	public void setPl_dt2(String pl_dt2) {
		this.pl_dt2 = pl_dt2;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public int getStartDate() {
		return startDate;
	}
	public void setStartDate(int startDate) {
		this.startDate = startDate;
	}
	public int getEndDate() {
		return endDate;
	}
	public void setEndDate(int endDate) {
		this.endDate = endDate;
	}
	public String getUseDate() {
		return useDate;
	}
	public void setUseDate(String useDate) {
		this.useDate = useDate;
	}
	
}
