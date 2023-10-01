package com.jpPlanner.model;

import java.math.BigDecimal;

public class JDataVO {
	// Fields
	private String id;
	private String title;
	private BigDecimal schedule_num;
	private BigDecimal nday;
	private BigDecimal row_num;
	private String settime;
	private String cont;
	private String sc_share;
	private String check_list;
	private String price;
	private String note;

	public JDataVO(String id, String title) {
		super();
		this.id = id;
		this.title = title;
	}

	
	public JDataVO( BigDecimal schedule_num, String id, String title, String sc_share, String check_list) {
		super();
		this.schedule_num = schedule_num;
		this.id = id;
		this.title = title;
		this.sc_share = sc_share;
		this.check_list = check_list;
	}

	public JDataVO(BigDecimal schedule_num, BigDecimal nday, String settime, String cont, String price,
			String note, BigDecimal row_num) {
		super();
		this.schedule_num = schedule_num;
		this.nday = nday;
		this.settime = settime;
		this.cont = cont;
		this.price = price;
		this.note = note;
		this.row_num = row_num;
	}

	// Getter
	public String getId() {
		return id;
	}

	public String getSc_share() {
		return sc_share;
	}


	public void setSc_share(String sc_share) {
		this.sc_share = sc_share;
	}


	public String getCheck_list() {
		return check_list;
	}


	public void setCheck_list(String check_list) {
		this.check_list = check_list;
	}


	public BigDecimal getSchedule_num() {
		return schedule_num;
	}

	public BigDecimal getNday() {
		return nday;
	}

	public BigDecimal getRow_Num() {
		return row_num;
	}

	public String getTime() {
		return settime;
	}

	public String getCont() {
		return cont;
	}

	public String getPrice() {
		return price;
	}

	public String getNote() {
		return note;
	}
	public String getTitle() {
		return title;
	}
}