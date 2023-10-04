package com.jpPlanner.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class P_scheduleVO {
	private BigDecimal Schedule_num;
	private String title;
	private String cont;
	private Timestamp b_date;
	
	
	public P_scheduleVO(BigDecimal Schedule_num, String title, String cont, Timestamp b_date){
		
		this.Schedule_num = Schedule_num;
		this.title =title;
		this.cont = cont;
		this.b_date = b_date;
		
	}
	
	public BigDecimal getSchedule_num() {
		return Schedule_num;
	}


	public String getTitle() {
		return title;
	}


	public String getCont() {
		return cont;
	}


	public Timestamp getB_date() {
		return b_date;
	}




}
