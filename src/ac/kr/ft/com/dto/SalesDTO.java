package ac.kr.ft.com.dto;

import java.util.List;

public class SalesDTO {

	private String st_cd_cs100005;
	private String st_cd_cs100006;
	private String st_cd_cs100009;
	private String rnum;
	private String seq;
	private String yyyymm;
	private String sales_cd;
	private String sales_nm;
	private String sales_tp_cd;
	private String sales_tp_nm;
	private String st_nm1;
	private String st_nm2;
	private String st_nm3;
	private String st_nm4;
	private String st_cd1;
	private String st_cd2;
	private String st_cd3;
	private String st_cd4;
	private String start_page;
	private String end_page;
	private String cnt;
	private List<SalesDTO> rList; // 조회 결과 가져오기

	private String city_cd;
	private String city_nm;
	private String dan_cd;
	private String dan_nm;
	private String rate1;
	private String rate2;
	private String rate3;
	private String rate4;
	private String rate5;

	private String fst_seq; // 축제 정보 고유키

	public String getFst_seq() {
		return fst_seq;
	}

	public void setFst_seq(String fst_seq) {
		this.fst_seq = fst_seq;
	}

	public String getCity_cd() {
		return city_cd;
	}

	public void setCity_cd(String city_cd) {
		this.city_cd = city_cd;
	}

	public String getCity_nm() {
		return city_nm;
	}

	public void setCity_nm(String city_nm) {
		this.city_nm = city_nm;
	}

	public String getDan_cd() {
		return dan_cd;
	}

	public void setDan_cd(String dan_cd) {
		this.dan_cd = dan_cd;
	}

	public String getDan_nm() {
		return dan_nm;
	}

	public void setDan_nm(String dan_nm) {
		this.dan_nm = dan_nm;
	}

	public String getRate1() {
		return rate1;
	}

	public void setRate1(String rate1) {
		this.rate1 = rate1;
	}

	public String getRate2() {
		return rate2;
	}

	public void setRate2(String rate2) {
		this.rate2 = rate2;
	}

	public String getRate3() {
		return rate3;
	}

	public void setRate3(String rate3) {
		this.rate3 = rate3;
	}

	public String getRate4() {
		return rate4;
	}

	public void setRate4(String rate4) {
		this.rate4 = rate4;
	}

	public String getRate5() {
		return rate5;
	}

	public void setRate5(String rate5) {
		this.rate5 = rate5;
	}

	public String getSt_cd_cs100005() {
		return st_cd_cs100005;
	}

	public void setSt_cd_cs100005(String st_cd_cs100005) {
		this.st_cd_cs100005 = st_cd_cs100005;
	}

	public String getSt_cd_cs100006() {
		return st_cd_cs100006;
	}

	public void setSt_cd_cs100006(String st_cd_cs100006) {
		this.st_cd_cs100006 = st_cd_cs100006;
	}

	public String getSt_cd_cs100009() {
		return st_cd_cs100009;
	}

	public void setSt_cd_cs100009(String st_cd_cs100009) {
		this.st_cd_cs100009 = st_cd_cs100009;
	}

	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getYyyymm() {
		return yyyymm;
	}

	public void setYyyymm(String yyyymm) {
		this.yyyymm = yyyymm;
	}

	public String getSales_cd() {
		return sales_cd;
	}

	public void setSales_cd(String sales_cd) {
		this.sales_cd = sales_cd;
	}

	public String getSales_nm() {
		return sales_nm;
	}

	public void setSales_nm(String sales_nm) {
		this.sales_nm = sales_nm;
	}

	public String getSales_tp_cd() {
		return sales_tp_cd;
	}

	public void setSales_tp_cd(String sales_tp_cd) {
		this.sales_tp_cd = sales_tp_cd;
	}

	public String getSales_tp_nm() {
		return sales_tp_nm;
	}

	public void setSales_tp_nm(String sales_tp_nm) {
		this.sales_tp_nm = sales_tp_nm;
	}

	public String getSt_nm1() {
		return st_nm1;
	}

	public void setSt_nm1(String st_nm1) {
		this.st_nm1 = st_nm1;
	}

	public String getSt_nm2() {
		return st_nm2;
	}

	public void setSt_nm2(String st_nm2) {
		this.st_nm2 = st_nm2;
	}

	public String getSt_nm3() {
		return st_nm3;
	}

	public void setSt_nm3(String st_nm3) {
		this.st_nm3 = st_nm3;
	}

	public String getSt_nm4() {
		return st_nm4;
	}

	public void setSt_nm4(String st_nm4) {
		this.st_nm4 = st_nm4;
	}

	public String getSt_cd1() {
		return st_cd1;
	}

	public void setSt_cd1(String st_cd1) {
		this.st_cd1 = st_cd1;
	}

	public String getSt_cd2() {
		return st_cd2;
	}

	public void setSt_cd2(String st_cd2) {
		this.st_cd2 = st_cd2;
	}

	public String getSt_cd3() {
		return st_cd3;
	}

	public void setSt_cd3(String st_cd3) {
		this.st_cd3 = st_cd3;
	}

	public String getSt_cd4() {
		return st_cd4;
	}

	public void setSt_cd4(String st_cd4) {
		this.st_cd4 = st_cd4;
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

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public List<SalesDTO> getrList() {
		return rList;
	}

	public void setrList(List<SalesDTO> rList) {
		this.rList = rList;
	}

}
