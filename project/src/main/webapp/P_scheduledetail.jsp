<%@page import="com.jpPlanner.model.P_scheduleDAO"%>
<%@page import="com.jpPlanner.model.P_scheduleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<link rel="stylesheet" href="./css/P_PlanerDetail.css">
<body>

 <%
    String id = request.getParameter("id");
	String nick = request.getParameter("nick");
    String url = "?id=" + id + "&nick=" + nick;
    
    int Schedule_num = Integer.parseInt(request.getParameter("Schedule_num"));
    System.out.println(Schedule_num);
    P_scheduleVO board = new P_scheduleDAO().selectBoard(Schedule_num);
    %>
    <!-- header -->
    <header>
        <div class="header">
            <div class="title">
            <div class="header-1">
                <a href="./Main.html"><img  class="logo" src="./img/J와P 로고.png" alt="Logo"></a>
            </div>
            <div class="header-2">
                <h2><strong>P 플래너</strong></h2>
            </div>  
            </div>
                
            <div class="menu">
   					 <li><a href="Community.jsp<%= url %>">커뮤니티</a></li>
     			 	  <% if (id == null) { %>
   					 <li id="loginBtn">
     			 	  <a href="Login.jsp" >로그인</a>
   					 </li>
     			 	  <% } else { %>
   					 <li><a href="Main.jsp<%= url %>">홈으로</a></li>
   					 <li></li>
     			  	 <a href="Main.jsp">로그아웃</a>
       				 <% } %>
				</div>
        </div>
    </header>

    <div class="header-border"></div>
 
<!-- intro -->
    <div class="intro">
        <div class="intro_text">
            <p>혼자 계획 짜지 말고,</p>
            <p>친구와 함께 여행계획 세워보세요.</p>
        </div>
        <div class="intro_img"><img src="./img/J_plannerDetail1.png" alt=""></div>
    </div>    

<!-- P_PlanerDetail -->
    <div id="P_planner">
        <div id="P_schedule">
            <div id="schedule">
                <div id="scheduleHead">
                    <span><strong>스케줄 제목 :  </strong></span>
                    <!-- 스케줄 제목 가져오기 -->
                    <span><strong><%=board.getTitle()%></strong></span>
                    <hr>
                    <div id="scheduleBtn">
                        <!-- J_PlannerWrite로 이동해서 수정 -->
                        <a href="#"><img src="img/file.png" alt="수정"></a>
                        <!-- 공유창으로 이동 -->
                        <a href="#"><img src="img/share.png" alt="공유"></a>
                        <!-- 해당 스케줄 DB에서 삭제하고 마이 페이지로 이동 -->
                        <a href="#"><img src="img/delete.png" alt="삭제"></a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="Pschedule-text">
            <P class="P-img"><img src="./img/P 스케줄 이미지.jpg" alt=""></P>
            <div class="P-text"><p><%=board.getCont() %></p>
              

            </div>
        </div>
       
    </div>

<!-- footer -->
<footer class="footer">
    <div id="footer_inner">
        <a href="./Main.html">
            <img src="./img/footer_logo2.png" alt="">
        </a>
    </div>
</footer>

<script src="./BoardWrite.js"></script>

</body>
</html>


<script src="./js/P_PlanerDetail.js"></script>
</body>
</html>