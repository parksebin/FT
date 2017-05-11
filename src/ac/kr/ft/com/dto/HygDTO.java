package ac.kr.ft.com.dto;

public class HygDTO {
	private String hgn_seq;
	private String title;
	private String contents;
	private String file_name;
    private String file_grp;
	private String reg_user_no;
	private String reg_dt;
	private String chg_user_no;
	private String chg_dt;
	private String file_path;
	private String[] allCheckSeq;
	
	public String[] getAllCheckSeq() {
		return allCheckSeq;
	}

	public void setAllCheckSeq(String[] allCheckSeq) {
		this.allCheckSeq = allCheckSeq;
	}
	
	
	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	
	
	public String getHgn_seq() {
		return hgn_seq;
	}
	public void setHgn_seq(String hgn_seq) {
		this.hgn_seq = hgn_seq;
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
