package kr.ac.kopo.petition.dao;

import java.util.List;

import kr.ac.kopo.petition.vo.PetitionVO;

public interface PetitionDAO {

	List<PetitionVO> selectAll() throws Exception;

	int insert(PetitionVO petitionVO) throws Exception;
	
	PetitionVO selectById(int petitionId) throws Exception;
}
