package com.jpPlanner.model;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.jpPlanner.db.SqlSessionManager;


public class ScheduleDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

    // Schedule 테이블에 스케줄 정보를 삽입하는 메서드
    public int writeBoard(ScheduleVO schedule) {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        int cnt = sqlSession.insert("com.jpPlanner.db.J_schedulemapper.insertSchedule", schedule);
        sqlSession.close();
        return cnt;
    }
    
    public List<JScheduleContentVO> printSchedule(BigDecimal shcedule_num) {
    	
    	SqlSession sqlSession = sqlSessionFactory.openSession(true);
    	List<JScheduleContentVO> schedule = sqlSession.selectList("com.jpPlanner.db.J_schedulemapper.printSchedule", shcedule_num);
        sqlSession.close();
    	
    	return schedule;
    }

}
