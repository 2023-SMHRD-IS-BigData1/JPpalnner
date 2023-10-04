function resize(obj) {
	obj.style.height = '1px';
	obj.style.height = (12 + obj.scrollHeight) + 'px';
}
// 여행지 추천 지역 선택
const btn = document.querySelector('.btn-select');
const list = document.querySelector('.list-member');
btn.addEventListener('click', () => {
	btn.classList.toggle('on');
});
list.addEventListener('click', (event) => {
	if (event.target.nodeName === "BUTTON") {
		btn.innerText = event.target.innerText;
		btn.classList.remove('on');
	}
});


// 테이블 행 추가 코드
let num = 1;
let tableId = '';
let rowId = '';
let cell = '';
// 선택한 table의 tr 구하는 코드
var form = document.querySelector('#schedule');
form.addEventListener('click', function(event) {
	// 클릭된 요소가 버튼인지 확인합니다.
	if (event.target && event.target.classList.contains('add')) {
		// 클릭된 버튼의 부모(td)의 부모(tr)의 id 값을 가져옵니다.
		tableId = null;
		tableId = event.target.closest('table').id;
		rowId = null;
		rowId = event.target.closest('tr').id;

		console.log('클릭된 버튼이 속한 행의 id:', rowId);
		// console.log('클릭된 버튼이 속한 행의 id:', tableId);
		// 가져온 id 값을 콘솔에 출력하거나 원하는 대로 활용할 수 있습니다.
	} else if (event.target && event.target.classList.contains('delete')) {
		// 클릭된 버튼의 부모(td)의 부모(tr)의 id 값을 가져옵니다.
		tableId = null;
		tableId = event.target.closest('table').id;
		rowId = null;
		rowId = event.target.closest('tr').id;
		tbodyId = event.target.closest('tbody').id;

		// console.log('클릭된 버튼이 속한 행의 id:', rowId);
		console.log('클릭된 버튼이 속한 행의 id:', tableId);
		// 가져온 id 값을 콘솔에 출력하거나 원하는 대로 활용할 수 있습니다.
	}
});


//테이블 행 추가 코드
$(document).on('click', '.add', () => {
	cell = null;
	cell = document.querySelector('#' + tableId + ' .tg-rbsuDay');
	console.log('테이블 아이디:', tableId);
	console.log('행의 일차 값: ', cell);
	console.log('tr id:', rowId);
	cell.setAttribute('rowspan', num + 1);
	let innerHtml = '';
	innerHtml += `<tr id="user_text${num + 1}" class="user_text">
                              <td class="tg-mlo0"><textarea onkeydown="resize(this)" onkeyup="resize(this)" cols="120px" rows="1" name="time" class="time" spellcheck="false"></textarea></td>
                              <td class="tg-mlo0"><textarea onkeydown="resize(this)" onkeyup="resize(this)" cols="360px" rows="1" name="content" class="content" spellcheck="false"></textarea></td>
                              <td class="tg-mlo0"><textarea onkeydown="resize(this)" onkeyup="resize(this)" cols="90px" rows="1" name="cost" class="cost" spellcheck="false"></textarea></td>
                              <td class="tg-mlo0"><textarea onkeydown="resize(this)" onkeyup="resize(this)" cols="200px" rows="1" name="notes" class="notes" spellcheck="false"></textarea></td>
                              <td class="addAndDelete"><button type="button" class="add">+</button></td>
                              <td class="addAndDelete"><button class="delete">–</button></td>
                            </tr>`
	console.log('클릭된 버튼이 속한 행의 id:', rowId);
	// 1.
	// let rowIdElement = document.getElementById(rowId);
	// rowIdElement.insertAdjacentHTML("afterend", innerHtml);
	// 2.
	$('#' + tableId + ' #' + rowId).after(innerHtml);

	num += 1;
})


$(document).on('click', '.delete', () => {
	var trCnt = $('#' + tableId + ' tr').length;
	if (trCnt > 2) {
		$('#' + rowId).remove();
		cell = null;
		cell = document.querySelector('#' + tableId + ' .tg-rbsuDay');
		cell.setAttribute('rowspan', num - 1);
	} else {
		alert('더이상 삭제 되지 않습니다.');
	}
})

//  데이 추가 코드 구간
let dayNum = 0;
$(document).on('click', '#plusDay', () => {
	dayNum += 1;
	let innerHtml_day = `
                   <table id="tg${dayNum}" class="tg">
                       <thead>
                           <tr>
                               <th></th>
                               <th class="tg-rbsu">시간</th>
                               <th class="tg-rbsu">내용</th>
                               <th class="tg-rbsu">비용</th>
                               <th class="tg-rbsu">비고</th>
                           </tr>
                       </thead>
                       <tbody id="tg_tbody${dayNum}">
                           <!-- tbody안에서 추가 삭제 삽입 -->
                           <tr id="user_text${dayNum}" class="user_text">
                              <td id="tg-rbsu${dayNum}" class="tg-rbsu tg-rbsuDay" rowspan="2">${dayNum + 1}일차</td>
                              <td class="tg-mlo0"><textarea onkeydown="resize(this)" onkeyup="resize(this)" cols="120px" rows="1" name="time" class="time" spellcheck="false"></textarea></td>
                              <td class="tg-mlo0"><textarea onkeydown="resize(this)" onkeyup="resize(this)" cols="360px" rows="1" name="content" class="content" spellcheck="false"></textarea></td>
                              <td class="tg-mlo0"><textarea onkeydown="resize(this)" onkeyup="resize(this)" cols="90px" rows="1" name="cost" class="cost" spellcheck="false"></textarea></td>
                              <td class="tg-mlo0"><textarea onkeydown="resize(this)" onkeyup="resize(this)" cols="200px" rows="1" name="notes" class="notes" spellcheck="false"></textarea></td>
                              <td class="addAndDelete"><button type="button" class="add">+</button></td>
                           </tr>
                       </tbody>
                   </table>
                   `

	$('#scheduleDiv').append(innerHtml_day);
	console.log('test', dayNum);
})

$(document).on('click', '#deleteDay', () => {
	var dayCnt = $('#scheduleDiv table').length;
	if (dayCnt > 1) {
		$('#scheduleDiv table:last').remove();
		dayNum -= 1;
	} else {
		alert('더이상 삭제되지 않습니다.');
	}
})




//-------------------------------------------------------------        


// -------------------------------------------------------------------



// 폼 제출 이벤트
document.addEventListener("DOMContentLoaded", function() {
	// 저장 버튼 클릭 시 이벤트 리스너를 등록합니다.
	document.getElementById("save").addEventListener("click", function(event) {

		// 스케줄 제목 가져오기
		var title = document.querySelector(".scheTitle").value;
		console.log("스케줄 제목: " + title);

		// 시간, 내용, 비용, 비고 데이터 가져오기 (예: 첫 번째 행의 데이터)
		var settime = document.querySelector(".time").value;
		var cont = document.querySelector(".content").value;
		var price = document.querySelector(".cost").value;
		var note = document.querySelector(".notes").value;

		console.log("시간: " + settime);
		console.log("내용: " + cont);
		console.log("비용: " + price);
		console.log("비고: " + note);

		// 체크 리스트 데이터 가져오기 (예: 첫 번째 체크박스)
		var check1 = document.querySelector("#check1").checked;
		var check1Text = document.querySelector("textarea[name='check1_text']").value;

		console.log("체크1: " + check1);
		console.log("체크1 텍스트: " + check1Text);

		// 다른 체크 리스트 항목들도 위와 같은 방법으로 가져올 수 있습니다.

		// 여기에서 데이터를 서버로 보내거나 원하는 처리를 수행할 수 있습니다.
	});
});



//-------------------------------------------- T-Map 지도 그리는 API --------------------------


var map;

var marker_s, marekr_e, waypoint;
var resultMarkerArr = [];
//경로그림정보
var drawInfoArr = [];
var resultInfoArr = [];

var startX = "36.405278291509404"
var startY = "127.52074279785197"
var endX = "36.405278291509404"
var endY = "127.52074279785197"
var viaX = ""
var viaY = ""
var latlngBounds;
var wayPoint = []

function initTmap() {
	// 1. 지도 띄우기
	map = new Tmapv2.Map("map_div", {
		center: new Tmapv2.LatLng((Number(startX) + Number(endX)) / 2, (Number(startY) + Number(endY)) / 2),
		width: "1000px",
		height: "350px",
		zoom: 7,
		zoomControl: true,
		scrollwheel: true

	});

	// 4. 경로탐색 API 사용요청
	var routeLayer;
	$("#btn_select")
		.click(
			function() {
				console.log(resultMarkerArr.length)

				if (resultMarkerArr.length > 0) {
					for (var i in resultMarkerArr) {
						resultMarkerArr[i].setMap(null);
					}
					resultMarkerArr = [];
				}

				console.log(map)
				var searchOption = $("#selectLevel").val();

				var headers = {};
				headers["appKey"] = "ZzRVCMWhEL7KOahAwoKic3LiH1DifbjH6A38By0R";
				headers["Content-Type"] = "application/json";

				var param = JSON.stringify({
					"startName": "출발지",
					"startX": startX,
					"startY": startY,
					"startTime": "201708081103",
					"endName": "도착지",
					"endX": endX,
					"endY": endY,
					"viaPoints": wayPoint,
					"reqCoordType": "WGS84GEO",
					"resCoordType": "EPSG3857",
					"carType": "1",
					"searchOption": searchOption
				});

				$
					.ajax({
						method: "POST",
						url: "https://apis.openapi.sk.com/tmap/routes/routeSequential30?version=1&format=json",//
						headers: headers,
						async: false,
						data: param,
						success: function(response) {

							var resultData = response.properties;
							var resultFeatures = response.features;

							// 결과 출력
							var tDistance = "총 거리 : "
								+ (resultData.totalDistance / 1000)
									.toFixed(1)
								+ "km,  ";
							var tTime = "총 시간 : "
								+ (resultData.totalTime / 60)
									.toFixed(0)
								+ "분,  ";
							var tFare = "총 요금 : "
								+ resultData.totalFare
								+ "원";

							$("#result").text(
								tDistance + tTime + tFare);

							//기존  라인 초기화

							if (resultInfoArr.length > 0) {
								for (var i in resultInfoArr) {
									resultInfoArr[i]
										.setMap(null);
								}
								resultInfoArr = [];
							}
							// 마커도 초기화 (왜 마커 초기화는 API에 내장을 안 한 거지?)

							for (var i in resultFeatures) {
								var geometry = resultFeatures[i].geometry;
								var properties = resultFeatures[i].properties;
								var polyline_;

								drawInfoArr = [];

								if (geometry.type == "LineString") {
									for (var j in geometry.coordinates) {
										// 경로들의 결과값(구간)들을 포인트 객체로 변환 
										var latlng = new Tmapv2.Point(
											geometry.coordinates[j][0],
											geometry.coordinates[j][1]);
										// 포인트 객체를 받아 좌표값으로 변환
										var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
											latlng);
										// 포인트객체의 정보로 좌표값 변환 객체로 저장
										var convertChange = new Tmapv2.LatLng(
											convertPoint._lat,
											convertPoint._lng);

										drawInfoArr
											.push(convertChange);
									}

									polyline_ = new Tmapv2.Polyline(
										{
											path: drawInfoArr,
											strokeColor: "#4F44FF",
											strokeWeight: 6,
											map: map
										});
									resultInfoArr
										.push(polyline_);

								} else {
									var markerImg = "";
									var size = ""; //아이콘 크기 설정합니다.

									if (properties.pointType == "S") { //출발지 마커
										markerImg = "./img/startPoint.png";
										size = new Tmapv2.Size(
											24, 36);
									} else if (properties.pointType == "E") { //도착지 마커
										markerImg = "./img/endPoint.png";
										size = new Tmapv2.Size(
											24, 36);
									} else { //각 포인트 마커
										markerImg = "./img/wayPoint.png";
										size = new Tmapv2.Size(
											24, 36);
									}

									// 경로들의 결과값들을 포인트 객체로 변환 
									var latlon = new Tmapv2.Point(
										geometry.coordinates[0],
										geometry.coordinates[1]);
									// 포인트 객체를 받아 좌표값으로 다시 변환
									var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
										latlon);

									marker_p = new Tmapv2.Marker(
										{
											position: new Tmapv2.LatLng(
												convertPoint._lat,
												convertPoint._lng),
											icon: markerImg,
											iconSize: size,
											map: map
										});

									resultMarkerArr
										.push(marker_p);
								}
							}
						},
						error: function(request, status, error) {
							console.log("code:"
								+ request.status + "\n"
								+ "message:"
								+ request.responseText
								+ "\n" + "error:" + error);
						},
						// 줌 맞추기
						complete: function() {
							// console.log(map.getCenter());
							// setMap(map, startX, endX, startY, endY);
							console.log(map);

							map.fitBounds(latlngBounds, 100);
						}
					});
			});
}

function setMap(map, startX, endX, startY, endY) {
	console.log((Number(startX) + Number(endX)) / 2)
	var t = new Tmapv2.LatLng((Number(startY) + Number(endY)) / 2, (Number(startX) + Number(endX)) / 2);
	console.log(typeof (t))
	console.log(t)
	map.setCenter(t)
	console.log(map.getCenter());
}

function addComma(num) {
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}

// ----------------------------------- 버튼 클릭해서 경로 요청 ----------------------------------

// 버튼 클릭했을 때, 장소 정보 입력
$("#btn-req").on("click", function() {

	var s_value = $("#s_loc").val();
	var p_value = [];  // 배열로 초기화
	var e_value = $("#e_loc").val();
	for (var i = 0; i < 3; i++) {
		var currentVal = $(".p_loc").eq(i).val();  // .eq(i)를 사용하여 i번째 요소의 값을 가져옵니다.
		console.log(currentVal)
		if (currentVal !== "") {  // 값이 비어있으면 end값 추가
			p_value.push(currentVal);
		}
	}

	var len = p_value.length

	for (var i = 0; i < 3 - len; i++) {
		p_value.push(e_value);
	}

	console.log(s_value);
	console.log(e_value);
	console.log(p_value);

	// Connector로 데이터 전송 후 위도 경도 값 반환
	// 배열을 GET 방식으로 넘기기 위해 배열 사전 인코딩
	$.ajax({
		type: 'POST', // POST 방식을 사용하여 JSON 데이터를 전송
		url: "Connector",
		data: JSON.stringify({
			s_value: s_value,
			e_value: e_value,
			p_value: p_value
		}),
		contentType: "application/json",
		dataType: "json",
		success: function(result) {
			var minLat = ""
			var minLon = ""
			var minLatLon;
			var maxlatLon;

			startX = result[0].lon
			startY = result[0].lat

			// bound 설정을 위해 제일작은 위도 경도 추출
			minLat = startX
			minLon = startY

			maxLat = startX
			maxLon = startY

			endX = result[1].lon
			endY = result[1].lat

			// end 값과 latlon 비교
			if (minLat > endX) {
				minLat = endX
			}

			if (minLon > endY) {
				minLon = endY
			}
			if (maxLat < endX) {
				maxLat = endX
			}

			if (maxLon < endY) {
				maxLon = endY
			}
			wayPoint = []
			var cnt = 1;
			for (var i = 2; i < result.length; i++) {
				console.log(result[i].lon)
				var id = "test" + cnt
				var name = "name" + cnt
				cnt = cnt + 1
				viaX = result[i].lon
				viaY = result[i].lat
				wayPoint.push({
					"viaPointId": id,
					"viaPointName": name,
					"viaX": viaX,
					"viaY": viaY
				})

				// via 값과 latlon 비교
				if (minLat > viaX) {
					minLat = viaX
				}
				if (minLon > viaY) {
					minLon = viaY
				}


				if (maxLat < viaX) {
					maxLat = viaX
				}

				if (maxLon < viaY) {
					maxLon = viaY
				}
			}
			minLatLon = new Tmapv2.LatLng(minLon, minLat)
			maxlatLon = new Tmapv2.LatLng(maxLon, maxLat)

			console.log(minLatLon)
			console.log(maxlatLon)

			latlngBounds = new Tmapv2.LatLngBounds(minLatLon, maxlatLon);
			console.log(latlngBounds)

			alert('위치 등록 완료!')

		},
		error: function() {
			alert("요청실패...");
		}
	});
});





// 슬라이드 버튼 구현 구간
//              const scrollBox_list = document.querySelector('.scrollBox_list'); //전체 슬라이드 컨테이너
// const slideImg = document.querySelectorAll('.scrollBox_list li'); //모든 슬라이드들
// let currentIdx = 0; //현재 슬라이드 index
// const slideCount = slideImg.length; // 슬라이드 개수
// const prev = document.querySelector('.scrollBox_left'); //이전 버튼
// const next = document.querySelector('.scrollBox_right'); //다음 버튼
// const slideWidth = 100; //한개의 슬라이드 넓이
// const slideMargin = 30; //슬라이드간의 margin 값

// //전체 슬라이드 컨테이너 넓이 설정
// scrollBox_list.style.width = (slideWidth + slideMargin) * slideCount + 'px';

// function moveSlide(num) {
//   scrollBox_list.style.left = -num * 130 + 'px'; //slideWidth + slideMargin
//   currentIdx = num;
// }

// prev.addEventListener('click', function () {
//   /*첫 번째 슬라이드로 표시 됐을때는
//   이전 버튼 눌러도 아무런 반응 없게 하기 위해
//   currentIdx !==0일때만 moveSlide 함수 불러옴 */

//   if (currentIdx !== 0) moveSlide(currentIdx - 1);
// });

// next.addEventListener('click', function () {
//   /* 마지막 슬라이드로 표시 됐을때는
//   다음 버튼 눌러도 아무런 반응 없게 하기 위해
//   currentIdx !==slideCount - 1 일때만
//   moveSlide 함수 불러옴 */
//   if (currentIdx !== slideCount - 1) {
//     moveSlide(currentIdx + 1);
//   }
// });
