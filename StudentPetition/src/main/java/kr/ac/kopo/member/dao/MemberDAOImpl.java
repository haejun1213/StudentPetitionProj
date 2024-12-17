package kr.ac.kopo.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		sqlSession.clearCache();
		return sqlSession.selectOne("dao.MemberDAO.selectMember", memberVo);
	}

	@Override
	public int insert(MemberVO memberVo) throws Exception {
		int res = sqlSession.insert("dao.MemberDAO.insertMember", memberVo);
		sqlSession.commit();
		return res;
	}

	@Override
	public String getPasswordByUserId(String userId) {
		sqlSession.clearCache();
		return sqlSession.selectOne("dao.MemberDAO.getPasswordByUserId", userId);
	}

	@Override
	public List<MemberVO> selectMemberList() throws Exception {
		sqlSession.clearCache();
		return sqlSession.selectList("dao.MemberDAO.selectMemberList");
	}

	@Override
	public MemberVO selectMemberEmail(MemberVO memberVO) throws Exception {
		sqlSession.clearCache();
		return sqlSession.selectOne("dao.MemberDAO.selectMemberByEmail", memberVO);
	}

	@Override
	public int checkIdExists(String id) throws Exception {
		sqlSession.clearCache();
		return sqlSession.selectOne("dao.MemberDAO.checkIdExists", id);
	}

	@Override
	public int checkEmailExists(String email) throws Exception {
		sqlSession.clearCache();
		return sqlSession.selectOne("dao.MemberDAO.checkEmailExists", email);
	}

	@Override
	public int updateInfo(MemberVO memberVo) throws Exception {
		// TODO Auto-generated method stub
		int res = sqlSession.update("dao.MemberDAO.updateMember", memberVo);
		sqlSession.commit();
		return res;
	}

	@Override
	public List<MemberVO> getMemberList(String search, int currentPage, int itemsPerPage) {
		int offset = (currentPage - 1) * itemsPerPage;
		int limit = itemsPerPage;

		Map<String, Object> params = new HashMap<>();
		params.put("search", "%" + search + "%");
		params.put("offset", offset);
		params.put("limit", limit);
		sqlSession.clearCache();
		return sqlSession.selectList("dao.MemberDAO.getMemberList", params);
	}

	@Override
	public int countMembers(String search) {
		sqlSession.clearCache();
		return sqlSession.selectOne("dao.MemberDAO.countMembers", "%" + search + "%");
	}

	@Override
	public String getMemberStatus(String userId) throws Exception {
		sqlSession.clearCache();
		return sqlSession.selectOne("dao.MemberDAO.getMemberStatus", userId);
	}

	@Override
	public void updateMemberStatus(String userId, String newStatus) throws Exception {
		sqlSession.update("dao.MemberDAO.updateMemberStatus",
				Map.of("userId", userId, "status", newStatus));
		sqlSession.commit();

	}

	@Override
	public void deleteMember(String userId) {
		sqlSession.delete("dao.MemberDAO.deleteMember", userId);
        sqlSession.commit();
		
	}
	
	

}
