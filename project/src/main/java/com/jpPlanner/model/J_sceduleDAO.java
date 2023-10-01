package com.jpPlanner.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jpPlanner.db.SqlSessionManager;

public class J_sceduleDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int insertcon(JDataVO schedule) {
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	int schedule_num = sqlSession.insert("com.jpPlanner.db.Schedulemapper.insertcon", schedule);
	sqlSession.close();
	return schedule_num;
	
	}
	
	public int insertconten(JDataVO JDataVO) {
		System.out.println();
		System.out.println(JDataVO.getSchedule_num());
		System.out.println(JDataVO.getNday());
		System.out.println(JDataVO.getTime());
		System.out.println(JDataVO.getCont());
		System.out.println(JDataVO.getPrice());
		System.out.println(JDataVO.getNote());
		System.out.println(JDataVO.getRow_Num());
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.insert("com.jpPlanner.db.Schedulemapper.insertconten", JDataVO);
		sqlSession.close();
		return cnt;
	}
	
	
	public JDataVO schedule() {
		
		 SqlSession sqlSession = sqlSessionFactory.openSession(true);
		 System.out.println("넘어왔냐/????");
		 JDataVO schedule = sqlSession.selectOne("com.jpPlanner.db.Schedulemapper.schedule");
		 sqlSession.close();
		 return schedule;
	}
	
	
	
	
}
