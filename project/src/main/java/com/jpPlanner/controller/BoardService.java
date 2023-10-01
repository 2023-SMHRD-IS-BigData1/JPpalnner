package com.jpPlanner.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jpPlanner.model.ScheduleDAO;
import com.jpPlanner.model.ScheduleVO;

public class BoardService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardService로 넘어옴");
			
			request.setCharacterEncoding("UTF-8");
		
            // 데이터 가져오기
            String[] title = request.getParameterValues("title"); 
            String[] settime = request.getParameterValues("settime"); 
            String[] cont = request.getParameterValues("cont"); 
            String[] price = request.getParameterValues("price"); 
            String[] note = request.getParameterValues("note"); 
            
            
            // ScheduleVO 객체 생성
            ScheduleVO board = new ScheduleVO(title[0], settime[0], cont[0], price[0], note[0]);

            // ScheduleDAO를 사용하여 데이터베이스에 저장
            int cnt = new ScheduleDAO().writeBoard(board);

            if (cnt > 0) {
                System.out.println("업로드 성공");
                response.sendRedirect("Mypage.jsp");
            } else {
                System.out.println("업로드 실패");
            }
	}

}
