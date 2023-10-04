<%@page import="com.jpPlanner.model.P_scheduleDAO"%>
<%@page import="com.jpPlanner.model.P_scheduleVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script>
	
<%String id = request.getParameter("id");
String nick = request.getParameter("nick");
String url = "?id=" + id + "&nick=" + nick;

List<P_scheduleVO> board_list = new P_scheduleDAO().showBoard();

System.out.print(board_list.size());%>
	
</script>
<script>
	/* <tr class="repeatPart">
	 <td><input type="checkbox"></td>
	 <td></td> <!-- 번호 -->
	 <td><a href="P_scheduledetail.jsp?Schedule_num="></a></td> <!-- 제목 -->
	 <td></td> <!-- 일단은 등록날짜 -->
	 </tr> */

	function callBoard() {
		var id =`<%=id%>`;
		console.log(id);
		$.ajax({
			url : "MyPageService",
			data : {
				id : id
			},
			dataType : "json",
			success : function(response) {
				// 성공 시 수행할 코드를 작성합니다.
				console.log(response)
				for (var i=0; i<response.length; i++) {
					var url = `J_Planner.jsp?Schedule_num=${response[i].schedule_num}`
					console.log(url)
					var html = `
					<tr class="repeatPart">
					 <td><input type="checkbox"></td>
					 <td class="sc_num">${response[i].schedule_num}</td> <!-- 번호 -->
					 <td class="schedule-link"><a href=${url}>${response[i].title}</a></td> <!-- 제목 -->
					 <td></td> <!-- 일단은 등록날짜 -->
					 </tr>`
					
					$(".myschedule-list").append(html)
				}
				
			},
			error : function(xhr, status, error) {
				// 오류 시 수행할 코드를 작성합니다.
			}
		});
	}
</script>
</head>
<link rel="stylesheet" href="./css/MyPage.css">
<body onload="callBoard()">

	<div class="page">

		<header>
			<div class="header">
				<div class="title">
					<div class="header-1">
						<a href="Main.jsp<%=url%>"><img class="logo"
							src="./img/J와P 로고.png" alt="Logo"></a>
					</div>
					<div class="header-2">
						<h2>마이 페이지</h2>
					</div>
				</div>

				<div class="menu">
					<li><a href="Community.jsp<%=url%>">커뮤니티</a></li>
					<%
					if (id == null) {
					%>
					<li id="loginBtn"><a href="Login.jsp">로그인</a></li>
					<%
					} else {
					%>
					<li><a href="Mypage.jsp<%=url%>">마이페이지</a></li>
					<li></li> <a href="Main.jsp">로그아웃</a>
					<%
					}
					%>
				</div>
			</div>
		</header>

	</div>

	<div class="header-border"></div>

	<!-- 프로필 -->

	<div class="profile">

		<div class="profile-nickname-email">
			<div class="profile-nickname">
				<h3><%=nick%>님 환영합니다.
				</h3>
			</div>
			<div class="profile-email">
				<span>ID : <%=id%></span>
			</div>
		</div>

		<div class="mypage-img">
			<img src="./img/마이 페이지 페이지 1.png" alt="mypageimg">
		</div>
	</div>

	<!-- 마이스케줄 -->

	<div class="myschedule">
		<div class="myschedule-title-button">
			<div class="myschedule-title">
				<span>마이 스케줄</span>
			</div>
			<div class="myschedule-button">
				<div>
					<a href="BoardWrite.jsp<%=url%>"><button>게시글 작성</button></a>
				</div>
				<div>
					<button>삭제</button>
				</div>
			</div>
		</div>
		<div class="myschedule-box">
			<table class="myschedule-list">
				<tr>
					<th></th>
					<th>번호</th>
					<th>제목</th>
					<th>등록날짜</th>
				</tr>
			</table>
		</div>
	</div>



	<div class="schedulepage">
		<ul class="schedulepage-num">
			<li><a href="#">&lt;</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">&gt;</a></li>
		</ul>
	</div>

	<!-- 게시판 작성 스케줄 -->

	<div class="boardschedule-title">
		<span>게시판 작성 스케줄</span>
	</div>
	<div class="boardschedule-list">

		<div class="board-img-title-name">
			<div class="boardschedule-img">
				<a href="" class="board-img"><img src="./img/제주.jpg" alt="여행지"></a>
			</div>
			<div class="board-title-name">
				<div class="board-title">
					<h4>게시글 제목</h4>
				</div>
				<div class="board-name">
					<span>작성자</span>
				</div>
			</div>
		</div>
		<div class="board-img-title-name">
			<div class="boardschedule-img">
				<a href="" class="board-img"><img src="./img/제주.jpg" alt="여행지"></a>
			</div>
			<div class="board-title-name">
				<div class="board-title">
					<h4>게시글 제목</h4>
				</div>
				<div class="board-name">
					<span>작성자</span>
				</div>
			</div>
		</div>

		<div class="board-img-title-name">
			<div class="boardschedule-img">
				<a href="" class="board-img"><img src="./img/제주.jpg" alt="여행지"></a>
			</div>
			<div class="board-title-name">
				<div class="board-title">
					<h4>게시글 제목</h4>
				</div>
				<div class="board-name">
					<span>작성자</span>
				</div>
			</div>
		</div>

		<div class="board-img-title-name">
			<div class="boardschedule-img">
				<a href="" class="board-img"><img src="./img/제주.jpg" alt="여행지"></a>
			</div>
			<div class="board-title-name">
				<div class="board-title">
					<h4>게시글 제목</h4>
				</div>
				<div class="board-name">
					<span>작성자</span>
				</div>
			</div>
		</div>

		<div class="board-img-title-name">
			<div class="boardschedule-img">
				<a href="" class="board-img"><img src="./img/제주.jpg" alt="여행지"></a>
			</div>
			<div class="board-title-name">
				<div class="board-title">
					<h4>게시글 제목</h4>
				</div>
				<div class="board-name">
					<span>작성자</span>
				</div>
			</div>
		</div>

		<div class="board-img-title-name">
			<div class="boardschedule-img">
				<a href="" class="board-img"><img src="./img/제주.jpg" alt="여행지"></a>
			</div>
			<div class="board-title-name">
				<div class="board-title">
					<h4>게시글 제목</h4>
				</div>
				<div class="board-name">
					<span>작성자</span>
				</div>
			</div>
		</div>

		<div class="board-img-title-name">
			<div class="boardschedule-img">
				<a href="" class="board-img"><img src="./img/제주.jpg" alt="여행지"></a>
			</div>
			<div class="board-title-name">
				<div class="board-title">
					<h4>게시글 제목</h4>
				</div>
				<div class="board-name">
					<span>작성자</span>
				</div>
			</div>
		</div>


	</div>

	<div class="boardpage">
		<ul class="boardpage-num">
			<li><a href="#">&lt;</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">&gt;</a></li>
		</ul>
	</div>
	<!-- footer -->
	<footer class="footer">
		<div id="footer_inner">
			<a href="Main.jsp<%=url%>"> <img src="./img/footer_logo2.png"
				alt="">
			</a>
		</div>
	</footer>

	<script src="./js/MyPage.js"></script>



</body>
</html>