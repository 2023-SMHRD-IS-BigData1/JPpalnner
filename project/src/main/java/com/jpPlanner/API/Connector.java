package com.jpPlanner.API;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javax.print.attribute.SetOfIntegerSyntax;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.jpPlanner.model.LatLon;
import com.jpPlanner.model.dataReader;

import okhttp3.Request;
import okhttp3.Response;

public class Connector extends HttpServlet {

   public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      Gson gson = new Gson();
      
      request.setCharacterEncoding("UTF-8");
      
      // 데이터 받아오기 위한 작업
      StringBuilder sb = new StringBuilder();
       String line = null;

       try (BufferedReader reader = request.getReader()) {
           while ((line = reader.readLine()) != null) {
               sb.append(line);
           }
       }
       String receivedJson = sb.toString();
       
       dataReader data = gson.fromJson(receivedJson, dataReader.class);
      
       String s_value = data.getS_value();
       String e_value = data.getE_value();
       List<String> p_value = data.getP_value();
       
      // 위치가 담긴 리스트 인덱스 2번부터는 경유지
      ArrayList<String> v_list = new ArrayList<String>();
      v_list.add(s_value);
      v_list.add(e_value);
      
      for (int i=0; i<p_value.size(); i++) {
         v_list.add(p_value.get(i));
         System.out.println("경유지" + p_value.get(i));
      }
       
      try {
         
         ArrayList<LatLon> loc_list = new ArrayList<LatLon>();
         
         for (int i=0; i<v_list.size(); i++) {
            
            // 리스트의 지명 이름을 뽑아서 도로명주소로 변환
            String original = new NaverSearch().search(v_list.get(i));
            
            System.out.println(v_list.get(i)); // 입력 장소 이름
            System.out.println(original); // 도로명 주소 출력
            
            // API 메소드 생성 및 호출
            FullTextGeoCoding search = new FullTextGeoCoding();
            
            // 도로명 주소를 집어 넣어 위도 경도 반환
            LatLon result = search.search(original);
            
            String lat = result.getLat(); // 위도
            String lon = result.getLon(); // 경도
            
            // 제이슨으로 반환하기 위해 역직렬화
            LatLon loc = new LatLon(lat, lon);
            loc_list.add(loc);
            
            System.out.println(lat);
            System.out.println(lon);

         }
         
         // 제이슨으로 변환
         
         
         String jsonList = gson.toJson(loc_list);
         
         PrintWriter out = response.getWriter();
         out.print(jsonList);
         
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      

   }

}
