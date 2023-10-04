package com.jpPlanner.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.jpPlanner.model.CheckListDAO;
import com.jpPlanner.model.CheckListVO;
import com.jpPlanner.model.JDataVO;
import com.jpPlanner.model.J_sceduleDAO;
import com.jpPlanner.model.ScheduleData;
import com.jpPlanner.model.ScheduleData.Days;
import com.jpPlanner.model.ScheduleData.Days.Rows;
import com.jpPlanner.model.ScheduleData.Days.Rows.Content;
import com.jpPlanner.model.contentDAO;
import com.jpPlanner.model.contentVO;

public class ScheduleDataInsert extends HttpServlet {
   private static final long serialVersionUID = 1L;
   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  Gson gson = new Gson();
      request.setCharacterEncoding("UTF-8");
      
     String id =  request.getParameter("id");
      System.out.println(id);
      
      // JSON 파일 읽기
      
      StringBuilder sb = new StringBuilder();
      String line;
      
      try (BufferedReader reader = request.getReader()) {
         while ((line = reader.readLine()) != null) {
            sb.append(line);
         }
      } catch(Exception e) {
    	  System.out.println(e);
      }
      
      // Java 객체로 반환
      ScheduleData data = gson.fromJson(sb.toString(), ScheduleData.class);
      
      // Session으로 ID 받아서 저장
      // String email = request.getParameter("email");
      
      
      // Insert문으로 스케쥴 테이블에 넣고 ScheduleNum 1 증가 후 반환
      // ---- 여기에 insert문 작성하세요 schedule_num 반환 받아야 합니다. ----
      String title = data.getTitle();
      System.out.println(title);
      JDataVO schedule = new JDataVO(id, title);
      new J_sceduleDAO().insertcon(schedule);
 
      BigDecimal schedule_num = new J_sceduleDAO().schedule().getSchedule_num(); // 여기에 반환 받기
      
      /* 이곳에서 체크리스트를 DB에 삽입합니다. */
      // 체크리스트는 항상 10개의 요소를 가집니다.
      for (int i=0; i<10; i++) {
    	  BigDecimal is_check = data.getCheckList().get(i).getCheck();
    	  String check_list_text = data.getCheckList().get(i).getCheckListText();
    	  
    	  System.out.println(is_check);
    	  System.out.println(check_list_text);
    	  
    	  // 체크리스트 데이터 insert
    	  CheckListVO checkListData = new CheckListVO(schedule_num, check_list_text, is_check);
    	  new CheckListDAO().checkListInsert(checkListData);
    	  
      }
      
      /* 아래 for문으로 row의 수만큼 content를 DB에 삽입합니다. */
      // Day 일 수 측정 후 반복
      int dayLen = data.getDays().size();
      for (int i=0; i<dayLen; i++) {
         Days currentDay = data.getDays().get(i);
         
         // day와 rows 출력
         List<Rows> rows = currentDay.getRows();
         BigDecimal nday = new BigDecimal(Integer.parseInt(currentDay.getDay()));
         // Row 수 측정 후 반복
         int rowLen = rows.size();
         for (int j=0; j<rowLen; j++) {
            Rows currentRow = rows.get(j);
            
            // row와 content 출력
            Content content = currentRow.getContent();
            BigDecimal row_num = new BigDecimal(Integer.parseInt(currentRow.getRow()));
            // content 내부 전부 출력
            String settime = content.getTime();
            String cont = content.getCont();
            String price = content.getPrice();
            String note = content.getNote();
            System.out.println(settime);
            System.out.println(cont);
            System.out.println(price);
            System.out.println(note);
            System.out.println(row_num);

            // JDataVO로 역직렬화
            JDataVO conten = new JDataVO(schedule_num, nday, settime, cont, price, note, row_num);
            int cnt = new J_sceduleDAO().insertconten(conten);
            
            if (cnt > 0) {
                System.out.println("업로드 성공");
                
            } else {
            	
                System.out.println("업로드 실패");
            }
            
            // 콘텐츠 테이블에 해당 내용 Insert
            // ---- 여기에 insert문 작성하세요 ----
            
         }
      }
      
   }

}