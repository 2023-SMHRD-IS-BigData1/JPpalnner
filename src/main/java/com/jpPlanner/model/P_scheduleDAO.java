package com.jpPlanner.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jpPlanner.db.SqlSessionManager;

public class P_scheduleDAO {

SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int writeBoard(P_scheduleVO vo) { //Board content -> DB
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.insert("com.jpPlanner.db.P_schedulemapper.insert",vo);
		sqlSession.close();
		return cnt;
	}
	
	public List<P_scheduleVO> showBoard() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<P_scheduleVO> board_list = sqlSession.selectList("com.jpPlanner.db.P_schedulemapper.showBoard");
		sqlSession.close();
		return board_list;
	}
	
	public P_scheduleVO selectBoard(int Schedule_num) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		P_scheduleVO board = sqlSession.selectOne("com.jpPlanner.db.P_schedulemapper.selectBoard", Schedule_num);
		sqlSession.close();
		return board;
	}
}
