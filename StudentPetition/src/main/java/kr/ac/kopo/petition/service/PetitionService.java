package kr.ac.kopo.petition.service;

import java.util.List;
import java.util.Map;

import kr.ac.kopo.petition.vo.PetitionVO;
import kr.ac.kopo.report.vo.ReportVO;

public interface PetitionService {
	List<PetitionVO> searchAllPetition() throws Exception;

	void insertPetition(PetitionVO petitionVO) throws Exception;

	PetitionVO selectById(Long petitionId) throws Exception;

	int countPetitions() throws Exception; // 총 게시글 수 가져오기

	List<PetitionVO> getPetitionsByPage(int page, int itemsPerPage) throws Exception; // 페이징 처리된 게시글 가져오기

	List<PetitionVO> searchPetitions(Map<String, String> searchCriteria) throws Exception;

	List<PetitionVO> searchPetitionsByPage(Map<String, String> searchCriteria, int page, int itemsPerPage)
			throws Exception;

	int countPetitionsByCriteria(Map<String, String> searchCriteria) throws Exception;

	boolean addParticipant(Long petitionId, String userId) throws Exception;

	boolean isParticipantExists(Long petitionId, String userId) throws Exception;

	List<PetitionVO> getPetitionsByUser(String userId) throws Exception;

	List<PetitionVO> getJoinedPetitions(String userId) throws Exception;

	int getPetitionParticipate(Long petitionId) throws Exception;

	void updatePetition(PetitionVO petition) throws Exception;

	boolean deletePetitionBy(Long petitionId) throws Exception;

}
