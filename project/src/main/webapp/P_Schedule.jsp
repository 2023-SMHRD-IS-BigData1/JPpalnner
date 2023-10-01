<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="./css/P_PlanerWrite.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body onload="recommend('강원도')">
	<%
	String id = request.getParameter("id");
	String nick = request.getParameter("nick");
	System.out.println("p스케줄 넘어왔냐 "+ id + nick);
	String url = "?id=" + id + "&nick=" + nick;
	%>
	<div class="page">

		<header>
			<div class="header">
				<div class="title">
					<div class="header-1">
						<a href="Main.jsp<%=url%>"><img class="logo"
							src="./img/J와P 로고.png" alt="Logo"></a>
					</div>
					<div class="header-2">
						<h2>P 플래너</h2>
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

	<!-- 여행지 추천 -->

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
											<li><a href=""><span>수도권</span></a></li>
											<li><a href=""><span>경상도</span></a></li>
											<li><a href=""><span>충청도</span></a></li>
											<li><a href=""><span>전라도</span></a></li>
											<li><a href=""><span>강원도</span></a></li>
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
                                <a href="#" class="poi_anchor" target="_blank" aria-selected="false" aria-current="false" rel="noreferrer noopener">
                                    <figure class="poi_figure">
                                        <img class="poi_figure_img1 poi_img" src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch" alt="가볼만한 곳 이미지" loading="lazy">
                                        <img class="poi_figure_img2 poi_img" src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch" alt="가볼만한 곳 이미지" loading="lazy">
                                    </figure>
                                    <div class="poi_info">
                                        <span class="poi_name">화양구곡</span>
                                        <div class="poi_hashtag">#계곡</div>
                                    </div>
                                </a>
                            </div>
                            <div class="poi_PoiItem1">
                                <a href="#" class="poi_anchor" target="_blank" aria-selected="false" aria-current="false" rel="noreferrer noopener">
                                    <figure class="poi_figure">
                                        <img class="poi_figure_img1 poi_img" src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch" alt="가볼만한 곳 이미지" loading="lazy">
                                        <img class="poi_figure_img2 poi_img" src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch" alt="가볼만한 곳 이미지" loading="lazy">
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
                                <a href="#" class="poi_anchor" target="_blank" aria-selected="false" aria-current="false" rel="noreferrer noopener">
                                    <figure class="poi_figure">
                                        <img class="poi_figure_img1 poi_img" src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch" alt="가볼만한 곳 이미지" loading="lazy">
                                        <img class="poi_figure_img2 poi_img" src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch" alt="가볼만한 곳 이미지" loading="lazy">
                                    </figure>
                                    <div class="poi_info">
                                        <span class="poi_name">화양구곡</span>
                                        <div class="poi_hashtag">#계곡</div>
                                    </div>
                                </a>
                            </div>
                            <div class="poi_PoiItem1">
                                <a href="#" class="poi_anchor" target="_blank" aria-selected="false" aria-current="false" rel="noreferrer noopener">
                                    <figure class="poi_figure">
                                        <img class="poi_figure_img1 poi_img" src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch" alt="가볼만한 곳 이미지" loading="lazy">
                                        <img class="poi_figure_img2 poi_img" src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch" alt="가볼만한 곳 이미지" loading="lazy">
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
                                <a href="#" class="poi_anchor" target="_blank" aria-selected="false" aria-current="false" rel="noreferrer noopener">
                                    <figure class="poi_figure">
                                        <img class="poi_figure_img1 poi_img" src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch" alt="가볼만한 곳 이미지" loading="lazy">
                                        <img class="poi_figure_img2 poi_img" src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch" alt="가볼만한 곳 이미지" loading="lazy">
                                    </figure>
                                    <div class="poi_info">
                                        <span class="poi_name">화양구곡</span>
                                        <div class="poi_hashtag">#계곡</div>
                                    </div>
                                </a>
                            </div>
                            <div class="poi_PoiItem1">
                                <a href="#" class="poi_anchor" target="_blank" aria-selected="false" aria-current="false" rel="noreferrer noopener">
                                    <figure class="poi_figure">
                                        <img class="poi_figure_img1 poi_img" src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch" alt="가볼만한 곳 이미지" loading="lazy">
                                        <img class="poi_figure_img2 poi_img" src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch" alt="가볼만한 곳 이미지" loading="lazy">
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
                                <a href="#" class="poi_anchor" target="_blank" aria-selected="false" aria-current="false" rel="noreferrer noopener">
                                    <figure class="poi_figure">
                                        <img class="poi_figure_img1 poi_img" src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch" alt="가볼만한 곳 이미지" loading="lazy">
                                        <img class="poi_figure_img2 poi_img" src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch" alt="가볼만한 곳 이미지" loading="lazy">
                                    </figure>
                                    <div class="poi_info">
                                        <span class="poi_name">화양구곡</span>
                                        <div class="poi_hashtag">#계곡</div>
                                    </div>
                                </a>
                            </div>
                            <div class="poi_PoiItem1">
                                <a href="#" class="poi_anchor" target="_blank" aria-selected="false" aria-current="false" rel="noreferrer noopener">
                                    <figure class="poi_figure">
                                        <img class="poi_figure_img1 poi_img" src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch" alt="가볼만한 곳 이미지" loading="lazy">
                                        <img class="poi_figure_img2 poi_img" src="https://search.pstatic.net/common?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150831_274%2F1440992240963db6KD_JPEG%2F11491268_0.jpg&type=f210_210_domesearch" alt="가볼만한 곳 이미지" loading="lazy">
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
                <div id="scrollBox_scroller"></div>
            </div>
        </div>
        
        
        <!-- p 플레너 입력 -->
        <div class="p-planerwrite"> 
                <div class="h1title">
                    <h1><input type="text" name="title" placeholder="제목을 입력하세요." aria-label="Sizing example input"></h1>
                </div>    

                <hr class="solid">
                
                <div class="button">
                    <button id = "btn_save">저장</button>
                    <button type="reset" value="초기화">초기화</button>
                </div>
                
                <div class="textarea-box">
                    <fieldset>
                        <img src="./img/P 스케줄 이미지.jpg" alt="">
                        
                        <div class="border"></div>
                        <div class="textarea-size">
                            <textarea rows="25" name="cont" id="cont"onkeydown="resize(this)" onkeyup="resize(this)" placeholder="내용을 입력해주세요."></textarea>
                        </div>
                    </fieldset>
                </div>
        </div>    
	
	<!-- footer -->
<footer class="footer">
    <div id="footer_inner">
        <a href="Main.jsp<%= url %>">
            <img src="./img/footer_logo2.png" alt="">
        </a>
    </div>
</footer>

	<script src="./js/P_PlanerWrite.js"></script>
	<script type="text/javascript">
    $('#btn_save').on('click', function() {
        var title = $('input[name=title]').val();
        console.log(title)
        
        var cont = $('#cont').val(); // textarea를 선택하는 부분을 수정
        console.log(cont)
        $.ajax({
            type: "POST",
            url: "PdatainsertService",
            data: {
                "title" : title,
                "cont" : cont,
                "id" : "<%=id%>",
                "nick" : "<%=nick%>"
            },
            dataType: 'json',
            success: function(data) {
                console.log("성공")
            },
            error: function(error) {
                console.log(error);
                alert('P 스케줄 시간이 부족하여 구현하지 못하였습니다. ');
            }
        });
    });
</script>

<script type="text/javascript">
var cookieName = "JSESSIONID";
var cookieValue = "A0C82F730C4251D1DC033B60DF8A47B1";

// 쿠키 만료일을 설정 (옵션)
var expirationDate = new Date();
expirationDate.setDate(expirationDate.getDate() + 7); // 7일 후 만료

// 쿠키 설정
document.cookie = cookieName + "=" + cookieValue + "; expires=" + expirationDate.toUTCString() + "; path=/";

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