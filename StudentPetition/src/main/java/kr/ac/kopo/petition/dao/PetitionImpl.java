package kr.ac.kopo.petition.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.mybatis.MyConfig;
import kr.ac.kopo.petition.vo.PetitionVO;

public class PetitionImpl implements PetitionDAO {

	private SqlSession sqlSession;

	public PetitionImpl() {
		sqlSession = new MyConfig().getInstance();
	}

	@Override
	public List<PetitionVO> selectAll() throws Exception {
		sqlSession.clearCache();
		List<PetitionVO> boardList = sqlSession.selectList("dao.PetitionDAO.selectAllPetitions");
		return boardList;
	}

	@Override
	public int insert(PetitionVO petitionVO) throws Exception {
		int res = sqlSession.insert("dao.PetitionDAO.insertPetition", petitionVO);
		sqlSession.commit();
		return res;
	}

	@Override
	public PetitionVO selectById(Long petitionId) throws Exception {
		return sqlSession.selectOne("dao.PetitionDAO.selectPetitionById", petitionId);
	}

	public int countPetitions() throws Exception {
		// 총 게시글 수 반환
		sqlSession.clearCache();
		return sqlSession.selectOne("dao.PetitionDAO.countPetitions");
	}

	public List<PetitionVO> selectPetitionsByPage(int offset, int limit) {
		sqlSession.clearCache();
		Map<String, Integer> params = Map.of("offset", offset, "limit", limit);
		return sqlSession.selectList("dao.PetitionDAO.selectPetitionsByPage", params);
	}

	public List<PetitionVO> searchPetitions(Map<String, String> searchCriteria) {
		sqlSession.clearCache();
		return sqlSession.selectList("dao.PetitionDAO.searchPetitions", searchCriteria);
	}

	@Override
	public List<PetitionVO> searchPetitionsByPage(Map<String, String> searchCriteria, int offset, int itemsPerPage)
			throws Exception {

		sqlSession.clearCache();
		Map<String, Object> params = new HashMap<>(searchCriteria);
		params.put("offset", offset);
		params.put("limit", itemsPerPage);
		return sqlSession.selectList("dao.PetitionDAO.searchPetitionsByPage", params);
	}

	@Override
	public int countPetitionsByCriteria(Map<String, String> searchCriteria) throws Exception {
		sqlSession.clearCache();
		return sqlSession.selectOne("dao.PetitionDAO.countPetitionsByCriteria", searchCriteria);
	}


	public void insertParticipant(Long petitionId, String userId) {
		sqlSession.insert("dao.PetitionDAO.insertParticipant", Map.of("petitionId", petitionId, "userId", userId));
		sqlSession.commit();
	}
	
	public boolean addParticipant(Long petitionId, String userId) throws Exception {
	    // Map에 petitionId와 userId를 담아서 전달
	    Map<String, Object> params = new HashMap<>();
	    params.put("petitionId", petitionId);
	    params.put("userId", userId);

	    // MyBatis 쿼리 호출 시 Map을 전달
	    int result = sqlSession.insert("dao.PetitionDAO.addParticipant", params);
	    sqlSession.commit();
	    return result > 0;
	}

    @Override
    public boolean isParticipantExists(Long petitionId, String userId) throws Exception {
        // Map에 petitionId와 userId를 담아서 전달
        Map<String, Object> params = new HashMap<>();
        params.put("petitionId", petitionId);
        params.put("userId", userId);

        // MyBatis 쿼리 호출 시 Map을 전달
        sqlSession.clearCache();
        Integer count = sqlSession.selectOne("dao.PetitionDAO.isParticipantExists", params);
        return count != null && count > 0;
    }

	@Override
	public List<PetitionVO> getPetitionsByUser(String userId) throws Exception {
		sqlSession.clearCache();
		return sqlSession.selectList("dao.PetitionDAO.getPetitionsByUser", userId);
	}

	@Override
	public List<PetitionVO> getJoinedPetitions(String userId) throws Exception {
		sqlSession.clearCache();
		return sqlSession.selectList("dao.PetitionDAO.getJoinedPetitions", userId);
	}

	@Override
	public int getPetitionParticipate(Long petitionId) throws Exception {
		sqlSession.clearCache();
		return sqlSession.selectOne("dao.PetitionDAO.getPetitionParticipate", petitionId);
	}

	@Override
	public void updatePetition(PetitionVO petition) throws Exception {
		sqlSession.update("dao.PetitionDAO.updatePetition", petition);
		sqlSession.commit();
	}

	@Override
	public int deletePetition(Long petitionId) throws Exception {
		int res = sqlSession.delete("dao.PetitionDAO.deletePetition", petitionId);
		sqlSession.commit();
		return res;
		
	}
	
	public List<PetitionVO> selectPetitionsWithParticipantCount(int offset, int limit) {
            return sqlSession.selectList("dao.PetitionDAO.selectPetitionsWithParticipantCount", 
                Map.of("offset", offset, "limit", limit));
        }

    
	
}
