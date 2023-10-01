package com.jpPlanner.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.jpPlanner.model.JScheduleContentVO;
import com.jpPlanner.model.ScheduleDAO;
import com.jpPlanner.model.ScheduleData;

public class SchedulePrint extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BigDecimal schedule_num = new BigDecimal(request.getParameter("schedule_num"));

		System.out.println(schedule_num);

		List<JScheduleContentVO> JSchedule = new ScheduleDAO().printSchedule(schedule_num);

		// Schedule_num이 같은 데이터들을 역직렬화
		BigDecimal dayCehck = JSchedule.get(0).getNday();

		// rows를 담을 days 생성
		List<ScheduleData.Days> days = new ArrayList<>();

		// row를 담을 rows를 생성
		List<ScheduleData.Days.Rows> rows = new ArrayList<>();

		// day 비교해서 contnet 생성
		System.out.println(JSchedule.size());
		for (int j = 0; j < JSchedule.size(); j++) {
			if (dayCehck.equals(JSchedule.get(j).getNday())) {
				System.out.println("현재 일차 " + JSchedule.get(j).getNday());
				System.out.println("구분 " + JSchedule.get(j).getSettime());
				System.out.println(JSchedule.get(j).getCont());
				System.out.println(JSchedule.get(j).getPrice());
				System.out.println(JSchedule.get(j).getNote());

				String time = "";
				String cont = "";
				String price = "";
				String note = "";

				if (JSchedule.get(j).getSettime() != null) {
					time = JSchedule.get(j).getSettime().toString();
				}
				if (JSchedule.get(j).getCont() != null) {
					cont = JSchedule.get(j).getCont().toString();
				}
				if (JSchedule.get(j).getPrice() != null) {
					price = JSchedule.get(j).getPrice().toString();
				}
				if (JSchedule.get(j).getNote() != null) {
					note = JSchedule.get(j).getNote().toString();
				}

				ScheduleData.Days.Rows.Content content = new ScheduleData.Days.Rows.Content(time, cont, price, note);
				// 같은 day의 rows를 생성해서 days에 담을 준비
				rows.add(new ScheduleData.Days.Rows(null, content));
				if (j == JSchedule.size() - 1) {
					System.out.println("row size" + rows.size());
					days.add(new ScheduleData.Days(dayCehck.toString(), new ArrayList<>(rows)));
					BigDecimal num = new BigDecimal(1);
					dayCehck = dayCehck.add(num);
					System.out.println("일차 증가" + dayCehck);
					rows.clear();
				}
			} else if (!dayCehck.equals(JSchedule.get(j).getNday())) {
				System.out.println("row size" + rows.size());
				days.add(new ScheduleData.Days(dayCehck.toString(), new ArrayList<>(rows)));
				BigDecimal num = new BigDecimal(1);
				dayCehck = dayCehck.add(num);
				System.out.println("일차 증가" + dayCehck);
				rows.clear();
				j -= 1;
			}
		}
		// jsonList로 역직렬화
		ScheduleData jsonList = new ScheduleData(days, JSchedule.get(0).getTitle(), null);
		System.out.println(jsonList.getTitle());
		System.out.println(jsonList.getDays().size());
		System.out.println(jsonList.getDays().get(0).getRows().get(0).getContent().getCont());

		// json으로 파싱
		Gson gson = new Gson();

		String json = gson.toJson(jsonList);
		response.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();

		// js 쪽으로 송신
		out.print(json);

	}

}
