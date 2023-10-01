package com.jpPlanner.model;

import java.math.BigDecimal;

public class CheckListVO {

	private BigDecimal schedule_num;
	private String check_list_text;
	private BigDecimal is_check;
	
	// Constructor
	public CheckListVO(BigDecimal schedule_num, String check_list_text, BigDecimal is_check) {
		super();
		this.schedule_num = schedule_num;
		this.check_list_text = check_list_text;
		this.is_check = is_check;
	}
	
	// Getter
	public BigDecimal getSchedule_num() {
		return schedule_num;
	}

	public String getCheck_list_text() {
		return check_list_text;
	}

	public BigDecimal getIs_check() {
		return is_check;
	}
}
