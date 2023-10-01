package com.jpPlanner.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jpPlanner.db.SqlSessionManager;

public class BoardDAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<BoardVO> boardSelect(String id) {
		
		System.out.print("board sql문 실행");
        SqlSession session = sqlSessionFactory.openSession(true);
        List<BoardVO> vo = session.selectList("com.jpPlanner.db.RecommendMapper.BoardSelect", id);
        session.close();
        System.out.print("board sql문 실행 성공");
		
		return vo;
	}
	
}
