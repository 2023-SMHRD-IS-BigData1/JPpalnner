package com.jpPlanner.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jpPlanner.db.SqlSessionManager;

public class CheckListDAO  {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int checkListInsert(CheckListVO vo) {
		System.out.print("sql문 실행");
        SqlSession session = sqlSessionFactory.openSession(true);
        int cnt = session.insert("com.jpPlanner.db.CheckListMapper.checkListInsert", vo);
        session.close();
        System.out.print("sql문 실행 성공");
        return cnt;
    }
	

}
