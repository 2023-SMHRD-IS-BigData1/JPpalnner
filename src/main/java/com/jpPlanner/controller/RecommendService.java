package com.jpPlanner.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.jpPlanner.model.ImgDAO;
import com.jpPlanner.model.RecommendDAO;
import com.jpPlanner.model.RecommendJSON;
import com.jpPlanner.model.RecommendJSON.Poi;
import com.jpPlanner.model.RecommendVO;

public class RecommendService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// JSP로부터 get 방식으로 데이터 전달 받기
		String userChoice = request.getParameter("choice");
		System.out.println(userChoice);
		
		List<RecommendJSON.Poi> recommend = new ArrayList<>();
		
		// 선택된 지역 이름으로 where절 작성하여 요소 select 해서 가져오기
		List<RecommendVO> poi = new RecommendDAO().poiSelect(userChoice);
		List<String> imgList = new ImgDAO().imgSelect(userChoice);
		// poi 수만큼 순회
		int cnt = 0;
		for (RecommendVO currentPoi : poi) {
			List<String> decodedImgList = new ArrayList<>();
			// img 할당하기
			int startIdx = cnt * 3;
			int endIdx = Math.min(imgList.size(), (cnt + 1) * 3 + 1);
			cnt += 1;
			
			String name = currentPoi.getLocation_name();
			String tag = currentPoi.getKewWords();
			String naverUrl = currentPoi.getNameLink();
			
			List<String> matchImg = imgList.subList(startIdx, endIdx);
			for (String imgUrl : matchImg) {
			    try {
			        // 이미지 URL을 디코드하고 디코드된 URL을 리스트에 추가합니다.
			        String decodedUrl = URLDecoder.decode(imgUrl, "UTF-8");
			        decodedImgList.add(decodedUrl);
			    } catch (UnsupportedEncodingException e) {
			        e.printStackTrace();
			    }
			}
			RecommendJSON.Poi newPoi = new RecommendJSON(null).new Poi(name, tag, naverUrl, null);
			
			newPoi.setImgList(decodedImgList);
			recommend.add(newPoi);
		}

		// JSON으로 변환 후 내보내기
		RecommendJSON jsonList = new RecommendJSON(recommend);
		
		
		Gson gson = new Gson();
		String json = gson.toJson(jsonList);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print(json);
	}
}
