<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>simpleMap</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=ZzRVCMWhEL7KOahAwoKic3LiH1DifbjH6A38By0R"></script>

<script type="text/javascript">
	var map;

	var marker_s, marekr_e, waypoint;
	var resultMarkerArr = [];
	//경로그림정보
	var drawInfoArr = [];
	var resultInfoArr = [];
	
	var startX = ""
	var startY = ""
	var endX = ""
	var endY = ""
	var viaX = ""
	var viaY = ""

	function initTmap() {
		resultMarkerArr = [];

		// 1. 지도 띄우기
		map = new Tmapv2.Map("map_div", {
			center : new Tmapv2.LatLng(36.405278291509404, 127.52074279785197),
			width : "60%",
			height : "400px",
			zoom : 7,
			zoomControl : true,
			scrollwheel : true

		});

		// 2. 시작, 도착 심볼찍기
		// 시작
		marker_s = new Tmapv2.Marker({
			position : new Tmapv2.LatLng(38.072355, 128.023355),
			icon : "/upload/tmap/marker/pin_r_m_s.png",
			iconSize : new Tmapv2.Size(24, 38),
			map : map
		});
		resultMarkerArr.push(marker_s);
		// 도착
		marker_e = new Tmapv2.Marker({
			position : new Tmapv2.LatLng(37.414382, 127.142571),
			icon : "/upload/tmap/marker/pin_r_m_e.png",
			iconSize : new Tmapv2.Size(24, 38),
			map : map
		});
		resultMarkerArr.push(marker_e);

		// 3. 경유지 심볼 찍기 (for문으로 제어 예정)
		marker = new Tmapv2.Marker({
			position : new Tmapv2.LatLng(37.399569, 127.103790),
			icon : "/upload/tmap/marker/pin_b_m_1.png",
			iconSize : new Tmapv2.Size(24, 38),
			map : map
		});
		resultMarkerArr.push(marker);

		// 4. 경로탐색 API 사용요청
		var routeLayer;
		$("#btn_select")
				.click(
						function() {

							var searchOption = $("#selectLevel").val();

							var headers = {};
							headers["appKey"] = "ZzRVCMWhEL7KOahAwoKic3LiH1DifbjH6A38By0R";
							headers["Content-Type"] = "application/json";

							var param = JSON.stringify({
								"startName" : "출발지",
								"startX" : startX,
								"startY" : startY,
								"startTime" : "201708081103",
								"endName" : "도착지",
								"endX" : endX,
								"endY" : endY,
								"viaPoints" : [ {
									"viaPointId" : "test01",
									"viaPointName" : "name01",
									"viaX" : viaX,
									"viaY" : viaY
								}],
								"reqCoordType" : "WGS84GEO",
								"resCoordType" : "EPSG3857",
								"searchOption" : searchOption
							});

							$
									.ajax({
										method : "POST",
										url : "https://apis.openapi.sk.com/tmap/routes/routeSequential30?version=1&format=json",//
										headers : headers,
										async : false,
										data : param,
										success : function(response) {

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
												for ( var i in resultInfoArr) {
													resultInfoArr[i]
															.setMap(null);
												}
												resultInfoArr = [];
											}

											for ( var i in resultFeatures) {
												var geometry = resultFeatures[i].geometry;
												var properties = resultFeatures[i].properties;
												var polyline_;

												drawInfoArr = [];

												if (geometry.type == "LineString") {
													for ( var j in geometry.coordinates) {
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
																path : drawInfoArr,
																strokeColor : "#FF0000",
																strokeWeight : 6,
																map : map
															});
													resultInfoArr
															.push(polyline_);

												} else {
													var markerImg = "";
													var size = ""; //아이콘 크기 설정합니다.

													if (properties.pointType == "S") { //출발지 마커
														markerImg = "/upload/tmap/marker/pin_r_m_s.png";
														size = new Tmapv2.Size(
																24, 38);
													} else if (properties.pointType == "E") { //도착지 마커
														markerImg = "/upload/tmap/marker/pin_r_m_e.png";
														size = new Tmapv2.Size(
																24, 38);
													} else { //각 포인트 마커
														markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
														size = new Tmapv2.Size(
																8, 8);
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
																position : new Tmapv2.LatLng(
																		convertPoint._lat,
																		convertPoint._lng),
																icon : markerImg,
																iconSize : size,
																map : map
															});

													resultMarkerArr
															.push(marker_p);
												}
											}
										},
										error : function(request, status, error) {
											console.log("code:"
													+ request.status + "\n"
													+ "message:"
													+ request.responseText
													+ "\n" + "error:" + error);
										}
									});
						});
	}

	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
</script>

</head>
<body onload="initTmap()">
	<!-- 맵 생성 실행 -->
	<p id="result"></p>
	<select id="selectLevel">
		<option value="0" selected="selected">교통최적+추천</option>
		<option value="1">교통최적+무료우선</option>
		<option value="2">교통최적+최소시간</option>
		<option value="3">교통최적+초보</option>
	</select>
	<button id="btn_select">적용하기</button>

	<div id="map_wrap" class="map_wrap">
		<div id="map_div"></div>
	</div>




	<input type="text" id="s_loc">
	<input type="text" id="p_loc">
	<input type="text" id="e_loc">
	<button id="btn-req">위도, 경도 요청</button>


	<script type="text/javascript">
		// 버튼 클릭했을 때, 장소 정보 입력
		$("#btn-req").on("click", function() {

			var s_value = $("#s_loc").val();
			var p_value = $("#p_loc").val();
			var e_value = $("#e_loc").val();

			console.log(s_value);
			console.log(e_value);
			console.log(p_value);
			// Connector로 데이터 전송 후 위도 경도 값 반환
			$.ajax({
				type : 'POST',
				url : "Connector",
				data : {
					s_value : s_value,
					e_value : e_value,
					p_value : p_value
				},
				dataType : "json",
				success : function(result) {
					console.log(result[0].lat) // 위도
					console.log(result[0].lon) // 경도
					console.log(result[1].lat) // 위도
					console.log(result[1].lon) // 경도
					console.log(result[2].lat) // 위도
					console.log(result[2].lon) // 경도
					
					startX = result[0].lon
					startY = result[0].lat
					endX = result[1].lon
					endY = result[1].lat
					viaX = result[2].lon
					viaY = result[2].lat
					
				},
				error : function() {
					alert("요청실패...");
				}
			});
		});
	</script>

</body>
</html>
