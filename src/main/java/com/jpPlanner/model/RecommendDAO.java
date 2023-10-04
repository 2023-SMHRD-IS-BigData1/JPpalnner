package com.jpPlanner.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jpPlanner.db.SqlSessionManager;
import com.jpPlanner.model.RecommendJSON.Poi;;

public class RecommendDAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<RecommendVO> poiSelect(String userChoice) {
		
		System.out.print("poi sql문 실행");
        SqlSession session = sqlSessionFactory.openSession(true);
        List<RecommendVO> data = session.selectList("com.jpPlanner.db.RecommendMapper.poiSelect", userChoice);
        session.close();
        System.out.print("poi sql문 실행 성공");
        
		return data;
	}

}
