<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- bootstrap CSS -->
<link
	href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="./css/J_PlanerWrite.css">
<!-- jQuery  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- bootstrap JS -->
<script
	src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<!-- T-map API -->
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=ZzRVCMWhEL7KOahAwoKic3LiH1DifbjH6A38By0R"></script>

<!-- T-map Script -->

<script>
	<% 

	String id = request.getParameter("id");
	String nick = request.getParameter("nick");
	System.out.println(id + nick);
	String url = "?id="+ id+ "&nick=" + nick;
	
	%>
</script>


</head>
<body onload="initTmap(), recommend('강원도')">
	<div class="page">

		<header>
			<div class="header">
				<div class="title">
					<div class="header-1">
						<a href="Main.jsp<%=url%>"><img class="logo"
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
					<li id="loginBtn"><a href="Login.jsp">로그인</a></li>
					<%
					} else {
					%>
					<li><a href="Mypage.jsp<%=url%>">마이페이지</a></li>
					<li></li> <a href="Main.jsp%>">로그아웃</a>
					<% } %>
				</div>
			</div>
		</header>

	</div>

	<div class="header-border"></div>

	</div>
	<div id="box">

		<!-- 지도 서비스 -->
		<div id="map">
			<div class="mapWrapper">
				<div id="mapPage">
					<div id="result"></div>
					
						<div>
							<div id="map_wrap" class="map_wrap">
							<div id="map_div"></div>
							</div>
						</div>
					
					<span><strong>※경로지정 클릭 후 <span class="span2">'위치 설정 완료'</span>알람이 뜨면 교통추천 목록을 선택후 적용하기 버튼을 눌러주세요.※</strong></span>

				</div>
				<div id="mapWrite">
					<div>
						<p>출발지</p>
						<input type="text" id="s_loc">
					</div>
					<div>
						<p>경유지</p>
						<input type="text" class="p_loc">
						<input type="text" class="p_loc">
						<input type="text" class="p_loc">
					</div>
					<div>
						<p>도착지</p>
						<input type="text" id="e_loc">
						<button id="btn-req">경로 지정</button>
						 <div>
							<select name="mapSelect" id="selectLevel">
								<option value="0" selected="selected">교통최적+추천</option>
								<option value="1">교통최적+무료우선</option>
								<option value="2">교통최적+최소시간</option>
								<option value="3">교통최적+초보</option>
							</select> <button id="btn_select">적용하기</button>
							</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 여행지 추천 서비스 -->
		<div id="propose">
			<div id="proTitle">어디로 가면 좋을까요?</div>
			<div id="filter_selects">
				<div class="filter_inner">
					<div class="filter_select">
						<div class="filter_DropdownFilter">
							<table>
								<tr>
									<td>
										<article class="cont-select">
											<button class="btn-select">지역</button>
											<ul class="list-member">
												<li><a aria-selected="true"> <span
														class="filter_btn">전국</span>
												</a></li>
												<li><a aria-selected="true"> <span
														class="filter_btn">수도권</span>
												</a></li>
												<li><a aria-selected="true"> <span
														class="filter_btn">경상도</span>
												</a></li>
												<li><a aria-selected="true"> <span
														class="filter_btn">전라도</span>
												</a></li>
												<li><a aria-selected="true"> <span
														class="filter_btn">강원도</span>
												</a></li>
												<li><a aria-selected="true"> <span
														class="filter_btn">충청도</span>
												</a></li>
											</ul>
										</article>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<!-- 여행지 사진 구간 -->
			<div id="scrollBox_ScrollBox">
				<div id="scrollBox_scroll">
					<ul class="scrollBox_list">
						<!-- <li class="scrollBox_observer" aria-hidden="true"></li> -->
						<!-- 첫번째 여행지 추천 구간 -->
						<li class="scrollBox_ScrollBoxItem__scrollBox_as_first">
							<div class="poi_PoiItem">
								<a href="#" class="poi_anchor" target="_blank"
									aria-selected="false" aria-current="false"
									rel="noreferrer noopener">
									<figure class="poi_figure">
										<img class="poi_figure_img1"
											src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch"
											alt="가볼만한 곳 이미지" class="poi_img" loading="lazy">
										<img class="poi_figure_img2"
											src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch"
											alt="가볼만한 곳 이미지" class="poi_img" loading="lazy">
									</figure>
									<div class="poi_info">
										<span class="poi_name">화양구곡</span>
										<div class="poi_hashtag">#계곡</div>
									</div>
								</a>
							</div>
						</li>
						<!-- ----------반복구간------------------ -->
						<li class="scrollBox_ScrollBoxItem">
							<div class="poi_PoiItem">
								<a href="#" class="poi_anchor" target="_blank"
									aria-selected="false" aria-current="false"
									rel="noreferrer noopener">
									<figure class="poi_figure">
										<img class="poi_figure_img1"
											src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch"
											alt="가볼만한 곳 이미지" class="poi_img" loading="lazy">
										<img class="poi_figure_img2"
											src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch"
											alt="가볼만한 곳 이미지" class="poi_img" loading="lazy">
									</figure>
									<div class="poi_info">
										<span class="poi_name">화양구곡</span>
										<div class="poi_hashtag">#계곡</div>
									</div>
								</a>
							</div>
						</li>
						<li class="scrollBox_ScrollBoxItem">
							<div class="poi_PoiItem">
								<a href="#" class="poi_anchor" target="_blank"
									aria-selected="false" aria-current="false"
									rel="noreferrer noopener">
									<figure class="poi_figure">
										<img class="poi_figure_img1"
											src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch"
											alt="가볼만한 곳 이미지" class="poi_img" loading="lazy">
										<img class="poi_figure_img2"
											src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch"
											alt="가볼만한 곳 이미지" class="poi_img" loading="lazy">
									</figure>
									<div class="poi_info">
										<span class="poi_name">화양구곡</span>
										<div class="poi_hashtag">#계곡</div>
									</div>
								</a>
							</div>
						</li>
						<li class="scrollBox_ScrollBoxItem">
							<div class="poi_PoiItem">
								<a href="#" class="poi_anchor" target="_blank"
									aria-selected="false" aria-current="false"
									rel="noreferrer noopener">
									<figure class="poi_figure">
										<img class="poi_figure_img1"
											src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch"
											alt="가볼만한 곳 이미지" class="poi_img" loading="lazy">
										<img class="poi_figure_img2"
											src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch"
											alt="가볼만한 곳 이미지" class="poi_img" loading="lazy">
									</figure>
									<div class="poi_info">
										<span class="poi_name">화양구곡</span>
										<div class="poi_hashtag">#계곡</div>
									</div>
								</a>
							</div>
						</li>
						<li class="scrollBox_ScrollBoxItem">
							<div class="poi_PoiItem">
								<a href="#" class="poi_anchor" target="_blank"
									aria-selected="false" aria-current="false"
									rel="noreferrer noopener">
									<figure class="poi_figure">
										<img class="poi_figure_img1"
											src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch"
											alt="가볼만한 곳 이미지" class="poi_img" loading="lazy">
										<img class="poi_figure_img2"
											src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch"
											alt="가볼만한 곳 이미지" class="poi_img" loading="lazy">
									</figure>
									<div class="poi_info">
										<span class="poi_name">화양구곡</span>
										<div class="poi_hashtag">#계곡</div>
									</div>
								</a>
							</div>
						</li>
						<li class="scrollBox_ScrollBoxItem">
							<div class="poi_PoiItem">
								<a href="#" class="poi_anchor" target="_blank"
									aria-selected="false" aria-current="false"
									rel="noreferrer noopener">
									<figure class="poi_figure">
										<img class="poi_figure_img1"
											src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch"
											alt="가볼만한 곳 이미지" class="poi_img" loading="lazy">
										<img class="poi_figure_img2"
											src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch"
											alt="가볼만한 곳 이미지" class="poi_img" loading="lazy">
									</figure>
									<div class="poi_info">
										<span class="poi_name">화양구곡</span>
										<div class="poi_hashtag">#계곡</div>
									</div>
								</a>
							</div>
						</li>
						<!-- ----------반복구간------------------ -->
						<li class="scrollBox_observer" aria-hidden="true"></li>
					</ul>
				</div>
				<!-- 여행지 스크롤 버튼 -->
				<div id="scrollBox_scroller">
					<!-- <button type="button" class="scrollBox_left"></button>
                    <button type="button" class="scrollBox_right"></button> -->
				</div>
			</div>
		</div>


		<!-- J플래너 작성 구간 -->
		
			<div id="j_planner">
				<div id="j_schedule">
					<div id="schedule">
						<span><strong>스케줄 제목 : </strong></span><input type="text"
							name="title" class="scheTitle">
						<hr>
						<div id="scheduleBtn">
							<button id="plusDay" type="button">Day 추가</button>
							<button id="deleteDay" type="button">Day 삭제</button>
							<button id="btn_save">저장</button>
						</div>
						<!-- 스케줄표 -->
						<div id="scheduleDiv">
							<!-- div안에서 day 추가 -->
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
									<!-- tbody안에서 추가 삭제 삽입 -->
									<tr id="user_text" class="user_text">
										<td id="tg-rbsu" class="tg-rbsu tg-rbsuDay" rowspan="2">1일차</td>
										<td class="tg-mlo0"><textarea onkeydown="resize(this)"
												onkeyup="resize(this)" cols="120px" rows="1" name="settime"
												class="time" spellcheck="false"></textarea></td>
										<td class="tg-mlo0"><textarea onkeydown="resize(this)"
												onkeyup="resize(this)" cols="360px" rows="1" name="cont"
												class="content" spellcheck="false"></textarea></td>
										<td class="tg-mlo0"><textarea onkeydown="resize(this)"
												onkeyup="resize(this)" cols="90px" rows="1" name="price"
												class="cost" spellcheck="false"></textarea></td>
										<td class="tg-mlo0"><textarea onkeydown="resize(this)"
												onkeyup="resize(this)" cols="200px" rows="1" name="note"
												class="notes" spellcheck="false"></textarea></td>
										<td class="addAndDelete"><button type="button"
												class="add">+</button></td>
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
							<table>
								<tr>
									<td class="check"><input type="checkbox" name="check1"
										id="check1" class="check_box" value="T"><label for="check1"
										aria-placeholder="체크할 사항들을 적어 보세요."></label></td>
									<td><textarea onkeydown="resize(this)"
											onkeyup="resize(this)" name="check_text" class="check_text"></textarea></td>
								</tr>
								<tr>
									<td class="check"><input type="checkbox" name="check2"
										id="check2" class="check_box" value="T"><label for="check2"></label></td>
									<td><textarea onkeydown="resize(this)"
											onkeyup="resize(this)" name="check_text" class="check_text"></textarea></td>
								</tr>
								<tr>
									<td class="check"><input type="checkbox" name="check3"
										id="check3" class="check_box" value="T"><label for="check3"></label></td>
									<td><textarea onkeydown="resize(this)"
											onkeyup="resize(this)" name="check_text" class="check_text"></textarea></td>
								</tr>
								<tr>
									<td class="check"><input type="checkbox" name="check4"
										id="check4" class="check_box" value="T"><label for="check4"></label></td>
									<td><textarea onkeydown="resize(this)"
											onkeyup="resize(this)" name="check_text" class="check_text"></textarea></td>
								</tr>
								<tr>
									<td class="check"><input type="checkbox" name="check5"
										id="check5" class="check_box" value="T"><label for="check5"></label></td>
									<td><textarea onkeydown="resize(this)"
											onkeyup="resize(this)" name="check_text" class="check_text"></textarea></td>
								</tr>
								<tr>
									<td class="check"><input type="checkbox" name="check6"
										id="check6" class="check_box" value="T"><label for="check6"></label></td>
									<td><textarea onkeydown="resize(this)"
											onkeyup="resize(this)" name="check_text" class="check_text"></textarea></td>
								</tr>
								<tr>
									<td class="check"><input type="checkbox" name="check7"
										id="check7" class="check_box" value="T"><label for="check7"></label></td>
									<td><textarea onkeydown="resize(this)"
											onkeyup="resize(this)" name="check_text" class="check_text"></textarea></td>
								</tr>
								<tr>
									<td class="check"><input type="checkbox" name="check8"
										id="check8" class="check_box" value="T"><label for="check8"></label></td>
									<td><textarea onkeydown="resize(this)"
											onkeyup="resize(this)" name="check_text" class="check_text"></textarea></td>
								</tr>
								<tr>
									<td class="check"><input type="checkbox" name="check9"
										id="check9" class="check_box" value="T"><label for="check9"></label></td>
									<td><textarea onkeydown="resize(this)"
											onkeyup="resize(this)" name="check_text" class="check_text"></textarea></td>
								</tr>
								<tr>
									<td class="check"><input type="checkbox" name="check10"
										id="check10" class="check_box" value="T"><label for="check10"></label></td>
									<td><textarea onkeydown="resize(this)"
											onkeyup="resize(this)" name="check_text" class="check_text"></textarea></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
	</div>

	<!-- footer -->
	<footer class="footer">
		<div id="footer_inner">
			<a href="Main.jsp<%=url%>"> <img src="img/footer_logo.png"
				alt="">
			</a>
		</div>
	</footer>

	<script src="./js/J_PlanerWrite.js"></script>
	
	

<script type="text/javascript">
	
	// j 스케줄 일차 넣는 스크립트
	$('#btn_save').on('click', function() {
		var days = []; // day를 담을 배열
		var title = $('.scheTitle').val();
		// day 측정
		var dayChecks = $('#scheduleDiv').find('.tg');
		for (var dayNum = 0; dayNum < dayChecks.length; dayNum++) {
			var rows = []; // row를 담을 배열
			var day = String(dayNum)
				
			// row 측정
			var rowChecks = $('.tg').eq(dayNum).find('.user_text');
			for (var rowNum = 0; rowNum < rowChecks.length; rowNum++) {
				var currentRow = $('.tg').eq(dayNum).find('.user_text').eq(rowNum);

				// 내용 추출
				var time = String(currentRow.find('.time').val());
				var cont = String(currentRow.find('.content').val());
				var price = String(currentRow.find('.cost').val());
				var note = String(currentRow.find('.notes').val());
				var row = String(rowNum)
				// JSON 형태로 객체 저장 row는 for문의 숫자
				var rowContent = {
					row: row,
					content: {
						"time": time,
						"cont": cont,
						"price": price,
						"note": note
					}
				};

				// rows에 저장
				rows.push(rowContent);
			}

			// 저장된 rows를 각 day에 저장 day는 for문의 숫자
			var dayContent = {
				"day": day,
				"rows": rows
			};

			// days에 저장
			days.push(dayContent);
		}

		
		 // ----- 체크리스트 값 JSON으로 변환하는 코드 -----

        // check -> 체크박스 리스트
        // check_text -> 텍스트 리스트
        // 둘의 인덱싱을 맞춰서 넘기고 받을 것
        
        // 완성된 값 리스트를 JSON 으로 파싱할 리스트
        var jsonCheckList = []
		var num = 0;
        var check;
        // 체크리리스트는 총 10개 존재
        for (var i=0; i<10; i++) {

            // check 값 1, 0 정수 값으로 반환해서 넘길 것
            check = $(`#check${num}`).is(":checked") ? 1 : 0;
            console.log(check)

            // text 값 추출해서 반환
            num += 1;
            checkListText = $('.check_text').eq(i).val()
            console.log(checkListText)
            var value = {
                "check" : check,
                "checkListText" : checkListText
            }
            // 값 리스트에 담기
            jsonCheckList.push(value)
        }
		
		// 모두 추출해 낸 schedule 내용 days에 저장
		var jsonList = {
			"days": days,
			"title": title,
			"checkList" : jsonCheckList
		};
		// JSON으로 파싱
		var url = `ScheduleDataInsert?id=<%=id%>`;
		var url2 = `Mypage.jsp?id=<%=id%>&nick=<%= nick %>`;
		
		var schedule = JSON.stringify(jsonList);
		console.log(schedule);
		
		$.ajax({
			url: url,
			type: 'POST',
			contentType: 'application/json; charset=UTF-8',
			data: schedule
		})
			.done(function() {
				window.location.href = url2;
			})
			.fail(function(error) {
				console.log(error);
				alert('데이터 저장에 실패했습니다.')
			})
	});
	
	// -------------------- 장소 추천 서비스 --------------------------
	$('.list-member li').on('click', function(){
		var choice = $(this).find(".filter_btn").text();
		console.log(choice)
		recommend(choice)
    })
function recommend(choice){
        $.ajax({
            url : "RecommendService",
            data : {choice : choice},
            dataType : "json",
            beforeSubmit: function (formData, jqForm, options) {
                return true;
            },
            success: function (response, statusText, xhr, $form) {
                if ('success' == statusText) {
                    if ((response) && (typeof response !== "object")) {
                        response = $.parseJSON(response);
                        console.log(response)
                    }
                }
            },
            traditional : true
        }).done(function(result){
           	console.log(result)
            $('.scrollBox_list').html("");
           
           	console.log(result.poi[0].imgList[0])

            var html = `
            <li class="scrollBox_ScrollBoxItem__scrollBox_as_first">
                            <div class="poi_PoiItem">
                                <a href="${result.poi[0].naverUrl}" class="poi_anchor" target="_blank" aria-selected="false" aria-current="false" rel="noreferrer noopener">
                                    <figure class="poi_figure">
                                        <img class="poi_figure_img1 poi_img" src="${result.poi[0].imgList[0]}" alt="가볼만한 곳 이미지" loading="lazy">
                                        <img class="poi_figure_img2 poi_img" src="${result.poi[0].imgList[1]}" alt="가볼만한 곳 이미지" loading="lazy">
                                    </figure>
                                    <div class="poi_info">
                                        <span class="poi_name">${result.poi[0].name}</span>
                                        <div class="poi_hashtag">${result.poi[0].tag}</div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        `;
            
            $('.scrollBox_list').append(html);
            
            // 배열의 길이 측정 후 갯수만큼 반복
            var repet = result.poi.length
            for (var i=1; i<repet; i++) {
            	var img1 = result.poi[i].imgList[0]
            	var img2 = result.poi[i].imgList[1]
            	console.log(img1)
                var html = `
                <li class="scrollBox_ScrollBoxItem__scrollBox_as_first">
                    <div class="poi_PoiItem">
                        <a href="${result.poi[i].naverUrl}" class="poi_anchor" target="_blank" aria-selected="false" aria-current="false" rel="noreferrer noopener">
                            <figure class="poi_figure">
                                <img class="poi_figure_img1 poi_img" src="${img1}" alt="가볼만한 곳 이미지" loading="lazy">
                                <img class="poi_figure_img2 poi_img" src="${img2}" alt="가볼만한 곳 이미지" loading="lazy">
                                </figure>
                                <div class="poi_info">
                                            <span class="poi_name">${result.poi[i].name}</span>
                                            <div class="poi_hashtag">${result.poi[i].tag}</div>
                                            </div>
                                            </a>
                                            </div>
                                            </li>
                                            `;
                $('.scrollBox_list').append(html);
            }
        }).fail(function (xhr, status, error) {
            console.log("Ajax request failed:", error);
        });
	}
	
	
	</script>
</body>
</html>