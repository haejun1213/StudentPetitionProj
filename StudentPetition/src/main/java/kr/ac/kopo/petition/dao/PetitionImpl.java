package kr.ac.kopo.petition.dao;

import java.util.List;

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
	public PetitionVO selectById(int petitionId) throws Exception {
		return sqlSession.selectOne("dao.PetitionDAO.selectPetitionById", petitionId);
	}
	
	

}
