package kr.ac.kopo.petition.dao;

import java.util.List;
import java.util.Map;

import kr.ac.kopo.petition.vo.PetitionVO;

public interface PetitionDAO {

	List<PetitionVO> selectAll() throws Exception;

	int insert(PetitionVO petitionVO) throws Exception;
	
	PetitionVO selectById(Long petitionId) throws Exception;
	
	int countPetitions() throws Exception;

	List<PetitionVO> selectPetitionsByPage(int offset, int itemsPerPage) throws Exception;
	
	List<PetitionVO> searchPetitions(Map<String, String> searchCriteria) throws Exception;
	
	List<PetitionVO> searchPetitionsByPage(Map<String, String> searchCriteria, int offset, int itemsPerPage) throws Exception;

	int countPetitionsByCriteria(Map<String, String> searchCriteria) throws Exception;
	
	public void insertParticipant(Long petitionId, String userId) throws Exception;
	
	boolean addParticipant(Long petitionId, String userId) throws Exception;
	
    boolean isParticipantExists(Long petitionId, String userId) throws Exception;

	List<PetitionVO> getPetitionsByUser(String userId) throws Exception;

	List<PetitionVO> getJoinedPetitions(String userId) throws Exception;

	int getPetitionParticipate(Long petitionId) throws Exception;

	void updatePetition(PetitionVO petition) throws Exception;

	int deletePetition(Long petitionId) throws Exception;

	List<PetitionVO> selectPetitionsWithParticipantCount(int offset, int itemsPerPage);
	
	

}
