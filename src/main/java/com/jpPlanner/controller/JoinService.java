package com.jpPlanner.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jpPlanner.model.MemberDAO;
import com.jpPlanner.model.MemberVO;

public class JoinService extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	System.out.println("JoinService 왔냐 ");
    	
        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String nick = request.getParameter("nick"); 

        System.out.println("아이디 : " + id);
        System.out.println("프로필 : " + pw);
        System.out.println("닉네임 : " + nick);

        MemberVO vo = new MemberVO(id, pw, nick, null);
        MemberDAO dao = new MemberDAO();

        // 회원 가입 정보를 데이터베이스에 저장
        int cnt = dao.join(vo);

        if (cnt > 0) {
            // 회원 가입 성공
            System.out.println("회원 가입 성공");
            String encodeid = URLEncoder.encode(id, "UTF-8");
            String encodenick = URLEncoder.encode(nick, "UTF-8");
            response.sendRedirect("Main.jsp?id="
					+ encodeid
					+ "&nick="
					+ encodenick);
        } else {
            // 회원 가입 실패
            System.out.println("회원 가입 실패");
        }
    }
}