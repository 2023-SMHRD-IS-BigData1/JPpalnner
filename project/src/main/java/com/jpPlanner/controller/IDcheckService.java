package com.jpPlanner.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jpPlanner.model.MemberDAO;
import com.jpPlanner.model.MemberVO;

 
public class IDcheckService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        	
    	System.out.println("idcheckservice 넘어왔냐");
    	
    	request.setCharacterEncoding("UTF-8");
    	String id = request.getParameter("id");
		 System.out.println("id" + " = "+ id);
		 
		 
		 	MemberVO vo = new MemberVO(id, null, null, null);
	        MemberDAO dao = new MemberDAO();
	        boolean check = dao.idCheck(id);
	        
	        System.out.println(check);
		
		// check true -> 중복X
		// check false -> 중복O
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(check);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         
         
    }
}