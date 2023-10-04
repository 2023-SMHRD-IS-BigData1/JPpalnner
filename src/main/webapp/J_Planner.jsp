<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="./css/J_PlanerDetail.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body onload="printSchedule()">
	<%
	String id = request.getParameter("id");
	String nick = request.getParameter("nick");
	System.out.println(id + nick);
	String url = "?id=" + id + "&nick=" + nick;
	%>
	<!-- header -->
	<header>
		<div class="header">
			<div class="title">
				<div class="header-1">
					<a href="./Main.jsp<%=url%>"><img class="logo"
						src="./img/J와P로고.png" alt="Logo"></a>
				</div>
				<div class="header-2">
					<h2>
						<strong>J 플래너</strong>
					</h2>
				</div>
			</div>

			<div class="menu">
				<li><a href="Community.jsp<%=url%>">커뮤니티</a></li>
				<%
				if (id == null) {
				%>
				<li id="loginBtn"><a href="Nick.jsp">로그인</a></li>
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

	<!-- intro -->
	<div id="intro">
		<div id="intro_text">
			<p>혼자 계획 짜지 말고,</p>
			<p>친구와 함께 여행계획 세워보세요.</p>
		</div>
		<div id="intro_img">
			<img src="../img/J_plannerDetail1.png" alt="">
		</div>
	</div>
	<!-- J_PlanerDetail -->
	<div id="j_planner">
		<div id="j_schedule">
			<div id="schedule">
				<div id="scheduleHead">
					<span><strong>스케줄 제목 : </strong></span>
					<!-- 스케줄 제목 가져오기 -->
					<span><strong>스케줄 제목 DB에서 가져오기</strong></span>
					<hr>
					<div id="scheduleBtn">
						<!-- J_PlannerWrite로 이동해서 수정 -->
						<a href=""><img src="img/file.png" alt="수정"></a>
						<!-- 공유창으로 이동 -->
						<a href="#"><img src="img/share.png" alt="공유"></a>
						<!-- 해당 스케줄 DB에서 삭제하고 마이 페이지로 이동 -->
						<a href="#"><img src="img/delete.png" alt="삭제"></a>
					</div>
				</div>
				<!-- 스케줄표 -->
				<div id="scheduleDiv">
					<!-- for문 돌려서  DAY추출하기 -->
					<table id="tg" class="tg">
						<thead>
							<tr>
								<th></th>
								<th class="tg-rbsu">시간</th>
								<th class="tg-rbsu">내용</th>
								<th class="tg-rbsu">비용</th>
								<th class="tg-rbsu">비고</th>
							</tr>
						</thead>
						<tbody id="tg_tbody">
							<tr id="user_text" class="user_text">
								<!-- DB에서 일차 가져오기 -->
								<td id="tg-rbsu" class="tg-rbsu tg-rbsuDay" rowspan="20"
									width="90px">ex 1일차</td>
								<!-- for문 돌려서 행 추출하기 -->
								<!-- DB에서 시간, 내용, 비용, 비고 가져오기 -->
								<td class="tg-mlo0 " width="150px"></td>
								<td class="tg-mlo0" width="390px"></td>
								<td class="tg-mlo0" width="110px"></td>
								<td class="tg-mlo0" width="220px"></td>
								<!-- <td class="addAndDelete"><button type="button" class="delete">–</button></td> -->
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 체크리스트 -->
		<div id="checkListBox">
			<img alt="check list 테이프" src="./img/Jplaner.png">
			<div>
				<div id="checkListNote">
					<P>
						<strong>CHECK LIST</strong>
					</P>
					<!-- check List 작성구간 만들기 -->
					<!-- input 안에 checked 넣으면 체크된 상태로 출력
                        disabled 넣으면 체크 값 변경 안돼게 해줌 -->
					<table>
						<tr>
							<td class="check"><input type="checkbox" name="check1"
								id="check1" disabled><label for="check1"
								aria-placeholder="체크할 사항들을 적어 보세요."></label></td>
							<td width="270px"></td>
						</tr>
						<tr>
							<td class="check"><input type="checkbox" name="check2"
								id="check2"><label for="check2"></label></td>
							<td></td>
						</tr>
						<tr>
							<td class="check"><input type="checkbox" name="check3"
								id="check3"><label for="check3"></label></td>
							<td></td>
						</tr>
						<tr>
							<td class="check"><input type="checkbox" name="check4"
								id="check4"><label for="check4"></label></td>
							<td></td>
						</tr>
						<tr>
							<td class="check"><input type="checkbox" name="check5"
								id="check5"><label for="check5"></label></td>
							<td></td>
						</tr>
						<tr>
							<td class="check"><input type="checkbox" name="check6"
								id="check6"><label for="check6"></label></td>
							<td></td>
						</tr>
						<tr>
							<td class="check"><input type="checkbox" name="check7"
								id="check7"><label for="check7"></label></td>
							<td></td>
						</tr>
						<tr>
							<td class="check"><input type="checkbox" name="check8"
								id="check8"><label for="check8"></label></td>
							<td></td>
						</tr>
						<tr>
							<td class="check"><input type="checkbox" name="check9"
								id="check9"><label for="check9"></label></td>
							<td></td>
						</tr>
						<tr>
							<td class="check"><input type="checkbox" name="check10"
								id="check10"><label for="check10"></label></td>
							<td></textarea></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script>
	function printSchedule() {
	    var schedule_num = <%= request.getParameter("Schedule_num") %>;
	    console.log(schedule_num);
	    $.ajax({
	        url: "SchedulePrint",
	        data: {
	            schedule_num: schedule_num
	        },
	        dataType: "json",
	        success: function (response) {
	                    var scheduleHTML = '';

	                    // 일 수 만큼 반복
	                    for (var i=0; i<response.days.length; i++) {
	                        scheduleHTML += `
	                        
	                            <table id="tg" class="tg">
	                                <thead>
	                                    <tr>
	                                        <th></th>
	                                        <th class="tg-rbsu">시간</th>
	                                        <th class="tg-rbsu">내용</th>
	                                        <th class="tg-rbsu">비용</th>
	                                        <th class="tg-rbsu">비고</th>
	                                    </tr>
	                                </thead>
	                                <tbody id="tg_tbody">
	                        `;
							scheduleHTML += `
	                                <tr id="user_text" class="user_text">
	                                    <td id="tg-rbsu" class="tg-rbsu tg-rbsuDay" rowspan="${response.days[i].rows.length}" width="90px">${i+1}일차</td>
	                                    <td class="tg-mlo0" width="150px">${response.days[i].rows[0].content.time}</td>
	                                    <td class="tg-mlo0" width="390px">${response.days[i].rows[0].content.cont}</td>
	                                    <td class="tg-mlo0" width="110px">${response.days[i].rows[0].content.price}</td>
	                                    <td class="tg-mlo0" width="220px">${response.days[i].rows[0].content.note}</td>
	                                </tr>
	                            `;
	                        // 행 수 만큼 반복
	                       
		                        for (var j=1; j<response.days[i].rows.length; j++) {
		                            scheduleHTML += `
		                                <tr id="user_text" class="user_text">
		                                    <td class="tg-mlo0" width="150px">${response.days[i].rows[j].content.time}</td>
		                                    <td class="tg-mlo0" width="390px">${response.days[i].rows[j].content.cont}</td>
		                                    <td class="tg-mlo0" width="110px">${response.days[i].rows[j].content.price}</td>
		                                    <td class="tg-mlo0" width="220px">${response.days[i].rows[j].content.note}</td>
		                                </tr>
		                            `;
		                        }
	                        
	                        scheduleHTML += `
	                            </tbody>
	                            </table>
	                        `;
	                    }

	                    $('#scheduleDiv').html(scheduleHTML);
	                }
	            
	        }).fail(function (xhr, status, error) {
	        console.log("Ajax request failed:", error);
	    });
	}

</script>
</body>
</html>