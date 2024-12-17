package kr.ac.kopo.answer.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.answer.vo.AdminAnswerVO;

public class AdminAnswerDAOImpl implements AdminAnswerDAO {

    private SqlSession sqlSession;

    // 의존성 주입 (주로 생성자나 setter를 통해 주입)
    public AdminAnswerDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public void addAnswer(AdminAnswerVO adminAnswer) {
        sqlSession.insert("AdminAnswer.addAnswer", adminAnswer);
    }

    @Override
    public void updateAnswer(AdminAnswerVO adminAnswer) {
        sqlSession.update("AdminAnswer.updateAnswer", adminAnswer);
    }

    @Override
    public void deleteAnswer(Long answerId) {
        sqlSession.delete("AdminAnswer.deleteAnswer", answerId);
    }

    @Override
    public AdminAnswerVO getAnswerById(Long answerId) {
        return sqlSession.selectOne("AdminAnswer.getAnswerById", answerId);
    }

    @Override
    public List<AdminAnswerVO> getAllAnswers() {
        return sqlSession.selectList("AdminAnswer.getAllAnswers");
    }
}
