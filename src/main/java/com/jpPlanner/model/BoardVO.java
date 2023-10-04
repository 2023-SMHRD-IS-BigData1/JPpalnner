package com.jpPlanner.model;

import java.math.BigDecimal;

public class BoardVO {
	
	private BigDecimal schedule_num;
	private String title;
	
	public BoardVO(BigDecimal schedule_num, String title) {
		super();
		this.schedule_num = schedule_num;
		this.title = title;
	}

	public BigDecimal getSchedule_num() {
		return schedule_num;
	}

	public String getTitle() {
		return title;
	}
	
}
