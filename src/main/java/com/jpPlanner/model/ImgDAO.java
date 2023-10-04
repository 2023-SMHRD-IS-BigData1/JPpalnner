package com.jpPlanner.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jpPlanner.db.SqlSessionManager;

public class ImgDAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<String> imgSelect(String userChoice) {
		
		System.out.print("img sql문 실행");
        SqlSession session = sqlSessionFactory.openSession(true);
        List<String> data = session.selectList("com.jpPlanner.db.RecommendMapper.imgSelect", userChoice);
        session.close();
        System.out.print("img sql문 실행 성공");
		
		return data;
	}

}
