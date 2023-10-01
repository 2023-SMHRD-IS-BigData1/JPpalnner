package com.jpPlanner.controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jpPlanner.model.JDataVO;
import com.jpPlanner.model.J_sceduleDAO;
import com.jpPlanner.model.P_scheduleDAO;
import com.jpPlanner.model.P_scheduleVO;


public class PdatainsertService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("pinsertService로 넘어왔냐");
		
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String nick = request.getParameter("nick");
		System.out.println("pinsert 계정:"+id+nick);
		// id 를 이용해서 shcedule_num을 가져오는 메소드  - 필요시
	    //      >>
		// 

		String title  = request.getParameter("title");
		String cont = request.getParameter("cont");
		System.out.println(title+cont);
		 JDataVO schedule = new JDataVO(id, title);
	      new J_sceduleDAO().insertcon(schedule);
		BigDecimal schedule_num = new J_sceduleDAO().schedule().getSchedule_num();
		System.out.println(schedule_num);
		
	 
		P_scheduleVO data = new P_scheduleVO(schedule_num, title, cont, null);
		int cnt = new P_scheduleDAO().writeBoard(data);
		System.out.println("업로드 반환값 :"+cnt);
		
		if (cnt > 0) {
			System.out.println("업로드 성공");
			response.sendRedirect("Mypage.jsp?id="+id+"&nick="+nick);
		}else {
	 
		System.out.println("업로드 실패");
		
		}
		
		
		
		
	}
}


