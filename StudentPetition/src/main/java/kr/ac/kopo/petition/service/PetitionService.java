package kr.ac.kopo.petition.service;

import java.util.List;

import kr.ac.kopo.petition.vo.PetitionVO;

public interface PetitionService {
	List<PetitionVO> searchAllPetition() throws Exception;
	void insertPetition(PetitionVO petitionVO) throws Exception;
	PetitionVO selectById(int petitionId) throws Exception;
}
