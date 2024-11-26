package kr.ac.kopo.member.dao;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.mybatis.MyConfig;

public class MemberDAOImpl implements MemberDAO {

	private SqlSession sqlSession;

	public MemberDAOImpl() {
		sqlSession = new MyConfig().getInstance();
	}

	@Override
	public MemberVO selectMember(MemberVO memberVo) throws Exception {
		System.out.println("dao" + memberVo);
		return sqlSession.selectOne("dao.MemberDAO.selectMember", memberVo);
	}

	@Override
	public int insert(MemberVO memberVo) throws Exception {
		int res = sqlSession.insert("dao.MemberDAO.insertMember", memberVo);
		sqlSession.commit();
		return res;
	}
	
	
	
}
