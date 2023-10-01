package com.jpPlanner.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jpPlanner.model.MemberDAO;
import com.jpPlanner.model.MemberVO;

public class LoginService extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	 System.out.println("LoginService에 전달받음"); 
    	 response.setCharacterEncoding("UTF-8");
    	 
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	 
    	System.out.println(id +" / "+ pw);
    	
        MemberDAO dao = new MemberDAO();
        MemberVO vo = new MemberVO(id, pw, null);
        MemberVO loginVO = dao.login(vo);

     		
        if (loginVO != null) {
        	System.out.println("회원 등록됨");
        	String nick = loginVO.getNick(); 
        	nick = URLEncoder.encode(nick, "UTF-8");
        	 
        	System.out.println(nick);
            // 이미 회원이 등록되어 있는 경우
        	response.sendRedirect("Main.jsp?id="+id+"&nick="+nick);
        } else {
        	System.out.println("회원 등록안됨");
            // 회원이 등록되어 있지 않은 경우
        	response.sendRedirect("Join.jsp");
        }
        
        
        
    }
}