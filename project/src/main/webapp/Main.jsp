<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<link rel="stylesheet" href="./css/Main.css">

</head>

<body>
<script>
<%
	
	String id = request.getParameter("id");
	String nick = request.getParameter("nick");
	System.out.println(id + nick);
	String url = "?id="+ id+ "&nick=" + nick;
	
%>

</script>
	<div class="page">

		<header>
			<div class="header">
				<div class="title">
					<div class="header-1">
					<%if (id == null) {%>
						<a href='Main.jsp'><img class="logo" src="./img/J와P 로고.png"alt="Logo"></a>
						<%}else { %>
						<a href='Main.jsp<%=url%>'><img class="logo" src="./img/J와P 로고.png"alt="Logo"></a>
						<%} %>
					</div>
					<div class="header-2">
						<span class="text1">J와P를 위한</span> <br> <span class="text2">여행
							플래너</span>
					</div>
				</div>

				<div class="menu">
					<%
					if (id == null) {
					%>
					<li><a href="Community.jsp">커뮤니티</a></li>
					<li id="loginBtn"><a href="Login.jsp">로그인</a></li>
					<%
					} else {
					%>
					<li><a href="Community.jsp<%=url%>">커뮤니티</a></li>
					<li><a href="Mypage.jsp<%=url%>">마이페이지</a></li>
					<li></li> <a href="Main.jsp">로그아웃</a>
					<% } %>
				</div>
			</div>
			
		</header>
		<div class="header-border"></div>
	</div>


	<div class="img">
		<figure class="mainimg">
			<img src="./img/메인 페이지1.png" alt="mainimg1" />
			<figcaption>
				<p>체계적이고 계획적인 당신을 위한!!!</p>
				<div class="heading">
					<h2>
						J<span> 스케줄</span>
					</h2>
				</div>
			</figcaption>
	<% if (id == null) {%>
	<a href="Login.jsp"></a>
	<%}else {%>
		<a href="J_Schedule.jsp<%=url%>"></a>
	<%} %>
		</figure>

		<figure class="mainimg">
			<img style="padding-top: 60px;" class="img1" src="./img/메인 페이지2.png"
				alt="mainimg2" />
			<figcaption>
				<p>자유로운 영혼을 가진 당신을 위한!!!</p>
				<div class="heading">
					<h2>
						P <span> 스케줄</span>
					</h2>
				</div>
			</figcaption>
			<%
			if (id == null){%>
				<a href="Login.jsp"></a>
			<%}else {%>
			<a href="P_Schedule.jsp<%=url%>"></a>
			<%}%>
		</figure>


	</div>
</body>
</html>