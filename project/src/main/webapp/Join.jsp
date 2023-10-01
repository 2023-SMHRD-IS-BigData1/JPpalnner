<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<link rel="stylesheet" href="./css/Join.css">
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
                    <h2>회원가입</h2>
                </div>  
                </div>
                    
            </div>
        </header>
        
    </div> 

    <div class="header-border"></div>
    <div class="joinbox">
    <form action="JoinService" method="POST" id="joinForm">
        <div class="join">
            <div class="idname">
                <input class="id" type="text" name="id" placeholder="아이디를 입력하세요."/>
                <input class="idCheck" type="button" id="btn" onclick="" value="중복확인">
                <div id="idcheck"></div>
            </div>
            <input class="nickname" type="text" name="nick" placeholder="닉네임을 입력하세요."/>
            <input class="pw" type="password" name="pw" placeholder="비밀번호를 입력하세요."/>
            <button type="submit">회원가입</button>
        </div>
        </form>
    </div>    
	<div id="nickcheck"></div>
	
<!-- footer -->
<footer class="footer">
    <div id="footer_inner">
        <a href="Main.jsp">
            <img src="./img/footer_logo2.png" alt="">
        </a>
    </div>
</footer>

<script src="./js/Join.js"></script>
</body>
</html>