package com.jpPlanner.model;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jpPlanner.db.SqlSessionManager;

public class contentDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<contentVO> viewcontent(BigDecimal schedule_num) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<contentVO> contentList = sqlSession.selectList("com.jpPlanner.db.Schedulemapper.viewcontent", schedule_num);
		sqlSession.close();
		return contentList;
	}	
	
	
	
}
