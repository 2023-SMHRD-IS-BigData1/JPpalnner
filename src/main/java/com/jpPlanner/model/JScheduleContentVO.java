package com.jpPlanner.model;

import java.math.BigDecimal;

public class JScheduleContentVO {

	private String title;
	private BigDecimal nday;
	private String settime;
	private String cont;
	private String price;
	private String note;
	private BigDecimal row_num;
	
	public JScheduleContentVO(String title, BigDecimal nday, String settime, String cont, String price, String note,
			BigDecimal row_num) {
		super();
		this.title = title;
		this.nday = nday;
		this.settime = settime;
		this.cont = cont;
		this.price = price;
		this.note = note;
		this.row_num = row_num;
	}

	public String getTitle() {
		return title;
	}

	public BigDecimal getNday() {
		return nday;
	}

	public String getSettime() {
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

	public BigDecimal getRow_num() {
		return row_num;
	}
}
