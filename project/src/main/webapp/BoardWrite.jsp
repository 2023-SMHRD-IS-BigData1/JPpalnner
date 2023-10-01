<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<link rel="stylesheet" href="./css/BoardWrite.css">
<body>
     <%
     	String id = request.getParameter("id");
 		String nick = request.getParameter("nick");
    	String url = "?id=" + id + "&nick=" + nick;
	%>
    <div class="page">

        <header>
            <div class="header">
                <div class="title">
                <div class="header-1">
                    <a href="Main.jsp<%= url %>"><img  class="logo" src="./img/J와P 로고.png" alt="Logo"></a>
                </div>
                <div class="header-2">
                    <h2>게시글 작성</h2>
                </div>  
                </div>
                    
                <div class="menu">
   					 <li><a href="Community.jsp<%= url %>">커뮤니티</a></li>
     			 	  <% if (id == null) { %>
   					 <li id="loginBtn">
     			 	  <a href="Login.jsp">로그인</a>
   					 </li>
     			 	  <% } else { %>
   					 <li><a href="Mypage.jsp<%= url %>">마이페이지</a></li>
   					 <li></li>
     			  	 <a href="Main.jsp">로그아웃</a>
       				 <% } %>
				</div>
            </div>
        </header>
    
    </div>    
        
    <div class="header-border"></div>
    
<!-- 게시글 작성 -->
<div class="boardwrite-page">
    
    <div class="boardwrite-title-img">
        <div class="boardwrite-title"><span>여행지 사진 첨부 및 게시글 작성</span>
            <hr class="borderline">
        </div>
        <div class="page-img"><img src="./img/게시글 작성 페이지1.png" alt=""></div>
    </div>

    <div class="boardwrite">
        <form action="" method="post" enctype="multipart/form-data">
            
            <div class="name"><span>작성자 : <input type="text" id="nickname"></span></div>
            <div><span></span></div>
            <div class="boardwrite-name-file-submit">
                <div class="boardwrite-name"><span>작성 내용</span></div>
                <div class="file-submit">
                    <input type="button" id="addbutton" value="내용추가">
                    <input type="submit" value="게시글 등록">
                </div>
            </div> 

            <div class="boardwrite-box">
                <!-- onchange event 걸어주기  -->
                <div class="addtext" id="addtext">
                    <div class="select-imgfile">
                        <img id="select_image" src="#" alt="Preview Image">
                        <br>
                        <input id="select_imgfile" type="file" accept="image/*" onchange="PreviewImage(this);">
                    </div>
                    <div class="boardwrite-textarea">
                        <textarea rows="5" onkeydown="resize(this)" onkeyup="resize(this)" placeholder="내용을 입력해주세요."></textarea>
                    </div>
                </div>
            </div>
        
        </form>
    </div>    

</div>

<!-- footer -->
<footer class="footer">
    <div id="footer_inner">
        <a href="./Main.jsp<%=url%>">
            <img src="./img/footer_logo2.png" alt="">
        </a>
    </div>
</footer>

<script src="./js/BoardWrite.js"></script>

</body>
</html>