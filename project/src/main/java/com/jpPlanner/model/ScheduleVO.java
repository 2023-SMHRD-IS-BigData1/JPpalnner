package com.jpPlanner.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class ScheduleVO {
	
	private int schedule_num;   // 스케줄번호
	@NonNull
	private String id;    	// email
	private String title;		// 제목
	private String cont;		// 내용
	private String time;        // 시간
	private String nick;		// 닉네임
	private String sc_share;	// 공유여부
	private String price;		// 비용
	private String Nday; 		// 일차
	private String settime;		// 시간
	private String b_date;		// 작성일자
	private String note;		// 비고
	private int c_index;		// Conten 인덱스
	private String check_list;	// 체크리스트
	
	
	
	public ScheduleVO(String title, String settime, String cont, String price, String note) {
		super();
		this.title = title;
		this.settime = settime;
		this.cont = cont;
		this.price = price;
		this.note = note;
	}
	
	
	
}
