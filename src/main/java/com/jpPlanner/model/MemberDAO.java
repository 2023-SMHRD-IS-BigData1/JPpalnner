package com.jpPlanner.model;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jpPlanner.db.SqlSessionManager;

public class MemberDAO {
    private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

    public int join(MemberVO vo) {
        SqlSession session = sqlSessionFactory.openSession(true);
        int cnt = session.insert("com.jpPlanner.db.Membermapper.join", vo);
        session.close();
        return cnt;
    }

    public MemberVO login(MemberVO MemberVO) {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        MemberVO loginVO = sqlSession.selectOne("com.jpPlanner.db.Membermapper.login", MemberVO);
        sqlSession.close();
        return loginVO;
    }
    
 	public boolean idCheck(String id) {
 		
 		SqlSession sqlSession = sqlSessionFactory.openSession(true);
 		MemberVO vo = sqlSession.selectOne("com.jpPlanner.db.Membermapper.idCheck", id);
 		sqlSession.close();
 		
 		if(vo != null) {
 			// 중복 O
 			return false;
 		}else {
 			// 중복 X
 			return true;
 		}
 		
 		
 	}
    
    
    
    
    
    

}