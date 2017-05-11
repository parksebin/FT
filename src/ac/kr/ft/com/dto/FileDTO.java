package ac.kr.ft.com.dto;

/**
 * 파일 정보 전송을 목적으로 하는 DTO
 * */
public class FileDTO {

	private String file_grp;
	private String file_seq;
	private String file_org_name;
	private String file_save_name;
	private String file_path;
	private String reg_dt;
	private String reg_id;
	private String chg_dt;
	private String chg_id;

	public String getFile_grp() {
		return file_grp;
	}

	public void setFile_grp(String file_grp) {
		this.file_grp = file_grp;
	}

	public String getFile_seq() {
		return file_seq;
	}

	public void setFile_seq(String file_seq) {
		this.file_seq = file_seq;
	}

	public String getFile_org_name() {
		return file_org_name;
	}

	public void setFile_org_name(String file_org_name) {
		this.file_org_name = file_org_name;
	}

	public String getFile_save_name() {
		return file_save_name;
	}

	public void setFile_save_name(String file_save_name) {
		this.file_save_name = file_save_name;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getChg_dt() {
		return chg_dt;
	}

	public void setChg_dt(String chg_dt) {
		this.chg_dt = chg_dt;
	}

	public String getChg_id() {
		return chg_id;
	}

	public void setChg_id(String chg_id) {
		this.chg_id = chg_id;
	}

}
