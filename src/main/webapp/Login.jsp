<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<link rel="stylesheet" href="./css/Login.css">
<body>
    <% 

	String id = request.getParameter("id");
	String nick = request.getParameter("nick");
	System.out.println(id + nick);
	String url = "?id="+ id+ "&nick=" + nick;
	
%>
    <div class="page">

        <header>
            <div class="header">
                <div class="title">
                <div class="header-1">
                    <a href="Main.jsp"><img  class="logo" src="./img/J와P 로고.png" alt="Logo"></a>
                </div>
                <div class="header-2">
                    <h2>로그인</h2>
                </div>  
                </div>
                    
            </div>
        </header>
        
    </div> 

    <div class="header-border"></div>
	<form action="LoginService" method="POST" id="loginForm">
    <div class="box">
        <input type="text" name="id" placeholder="아이디를 입력하세요." />
        <input type="password" name="pw" placeholder="비밀번호를 입력하세요." />
        <button type="submit">로그인</button>
        <a href="Join.jsp">회원가입</a> 
    </div>
    </form>

    <!-- footer -->
    <footer class="footer">
        <div id="footer_inner">
            <a href="#">
                <img src="./img/footer_logo2.png" alt="">
            </a>
        </div>
    </footer>

<script src="./js/Login.js"></script>
</body>
</html>