<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/Board.css">
</head>
<body>

<%
	
	String id = request.getParameter("id");
	String nick = request.getParameter("nick");
	System.out.println(id + nick);
	String url = "?id="+ id+ "&nick=" + nick;
	
%>
    <!-- header -->
    <header>
        <div class="header">
            <div class="title">
            <div class="header-1">
                <a href="Main.jsp<%=url%>"><img  class="logo" src="./img/J와P로고.png" alt="Logo"></a>
            </div>
            <div class="header-2">
                <h2><strong>커뮤니티</strong></h2>
            </div>  
            </div>
                
           <div class="menu">
					<%
					if (id == null) {
					%>
					<li id="loginBtn"><a href="Login.jsp">로그인</a></li>
					<%
					} else {
					%>
					<li><a href="Mypage.jsp<%=url%>">마이페이지</a></li>
					<li></li> <a href="Main.jsp">로그아웃</a>
					<% } %>
				</div>
        </div>
    </header>
</div> 
<div class="header-border"></div>
<!-- title -->
<div id="title">
    <p>게시글</p>
    <hr>
</div>
<!-- community -->
<div id="communityBox">
    <p>직접 다녀온 추천 일정과 여행 꿀팁 확인하기👀</p>
    <!-- 게시글 박스 -->
    <table>
        <!-- for문으로 반복해서 만들기 -->
        <tr>
            <td>
                <a href="#">
                    <div class="post">
                        <div class="img"><img src="https://res.klook.com/image/upload/q_85/c_fill,w_750/v1617101647/blog/edlhmuf96dpqcnodl9qf.jpg" alt="게시글 대표 사진"></div>
                        <div class="post_title">게시글 제목</div>
                        <span class="post_writer">작성자</span>
                        <div class="hr"></div>
                    </div>
                </a>
            </td>
            <td>
                <a href="#">
                    <div class="post">
                        <div class="img"><img src="https://res.klook.com/image/upload/q_85/c_fill,w_750/v1617101647/blog/edlhmuf96dpqcnodl9qf.jpg" alt="게시글 대표 사진"></div>
                        <div class="post_title">게시글 제목</div>
                        <span class="post_writer">작성자</span>
                        <div class="hr"></div>
                    </div>
                </a>
            </td>
            <td>
                <a href="#">
                    <div class="post">
                        <div class="img"><img src="https://res.klook.com/image/upload/q_85/c_fill,w_750/v1617101647/blog/edlhmuf96dpqcnodl9qf.jpg" alt="게시글 대표 사진"></div>
                        <div class="post_title">게시글 제목</div>
                        <span class="post_writer">작성자</span>
                        <div class="hr"></div>
                    </div>
                </a>
            </td>
            <td>
                <a href="#">
                    <div class="post">
                        <div class="img"><img src="https://res.klook.com/image/upload/q_85/c_fill,w_750/v1617101647/blog/edlhmuf96dpqcnodl9qf.jpg" alt="게시글 대표 사진"></div>
                        <div class="post_title">게시글 제목</div>
                        <span class="post_writer">작성자</span>
                        <div class="hr"></div>
                    </div>
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <a href="#">
                    <div class="post">
                        <div class="img"><img src="https://res.klook.com/image/upload/q_85/c_fill,w_750/v1617101647/blog/edlhmuf96dpqcnodl9qf.jpg" alt="게시글 대표 사진"></div>
                        <div class="post_title">게시글 제목</div>
                        <span class="post_writer">작성자</span>
                        <div class="hr"></div>
                    </div>
                </a>
            </td>
            <td>
                <a href="#">
                    <div class="post">
                        <div class="img"><img src="https://res.klook.com/image/upload/q_85/c_fill,w_750/v1617101647/blog/edlhmuf96dpqcnodl9qf.jpg" alt="게시글 대표 사진"></div>
                        <div class="post_title">게시글 제목</div>
                        <span class="post_writer">작성자</span>
                        <div class="hr"></div>
                    </div>
                </a>
            </td>
            <td>
                <a href="#">
                    <div class="post">
                        <div class="img"><img src="https://res.klook.com/image/upload/q_85/c_fill,w_750/v1617101647/blog/edlhmuf96dpqcnodl9qf.jpg" alt="게시글 대표 사진"></div>
                        <div class="post_title">게시글 제목</div>
                        <span class="post_writer">작성자</span>
                        <div class="hr"></div>
                    </div>
                </a>
            </td>
            <td>
                <a href="#">
                    <div class="post">
                        <div class="img"><img src="https://res.klook.com/image/upload/q_85/c_fill,w_750/v1617101647/blog/edlhmuf96dpqcnodl9qf.jpg" alt="게시글 대표 사진"></div>
                        <div class="post_title">게시글 제목</div>
                        <span class="post_writer">작성자</span>
                        <div class="hr"></div>
                    </div>
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <a href="#">
                    <div class="post">
                        <div class="img"><img src="https://res.klook.com/image/upload/q_85/c_fill,w_750/v1617101647/blog/edlhmuf96dpqcnodl9qf.jpg" alt="게시글 대표 사진"></div>
                        <div class="post_title">게시글 제목</div>
                        <span class="post_writer">작성자</span>
                    </div>
                </a>
            </td>
            <td>
                <a href="#">
                    <div class="post">
                        <div class="img"><img src="https://res.klook.com/image/upload/q_85/c_fill,w_750/v1617101647/blog/edlhmuf96dpqcnodl9qf.jpg" alt="게시글 대표 사진"></div>
                        <div class="post_title">게시글 제목</div>
                        <span class="post_writer">작성자</span>
                    </div>
                </a>
            </td>
            <td>
                <a href="#">
                    <div class="post">
                        <div class="img"><img src="https://res.klook.com/image/upload/q_85/c_fill,w_750/v1617101647/blog/edlhmuf96dpqcnodl9qf.jpg" alt="게시글 대표 사진"></div>
                        <div class="post_title">게시글 제목</div>
                        <span class="post_writer">작성자</span>
                    </div>
                </a>
            </td>
            <td>
                <a href="#">
                    <div class="post">
                        <div class="img"><img src="https://res.klook.com/image/upload/q_85/c_fill,w_750/v1617101647/blog/edlhmuf96dpqcnodl9qf.jpg" alt="게시글 대표 사진"></div>
                        <div class="post_title">게시글 제목</div>
                        <span class="post_writer">작성자</span>
                    </div>
                </a>
            </td>
        </tr>
    </table>
</div>
<!-- footer -->
<footer class="footer">
    <!-- 홈페이지 간략하게 소개 -->
    <nav></nav>
    <!-- 로고 클릭시 메인화면으로 이동-->
    <div id="footer_inner">
        <a href="Main.jsp<%=url%>">
            <img src="img/J와P로고.png" alt="">
            <span>J와P</span>
        </a>
    </div>
</footer>





<script src="./js/Board.js"></script>
</body>
</html>