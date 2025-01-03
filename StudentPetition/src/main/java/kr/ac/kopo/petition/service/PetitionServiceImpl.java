package kr.ac.kopo.petition.service;

import java.util.List;
import java.util.Map;

import kr.ac.kopo.petition.dao.PetitionDAO;
import kr.ac.kopo.petition.dao.PetitionImpl;
import kr.ac.kopo.petition.vo.PetitionVO;

public class PetitionServiceImpl implements PetitionService {

	private PetitionDAO petitionDao;

	public PetitionServiceImpl() {
		petitionDao = new PetitionImpl();
	}

	public List<PetitionVO> searchAllPetition() throws Exception {
		List<PetitionVO> boardList = petitionDao.selectAll();
		return boardList;
	}

	@Override
	public void insertPetition(PetitionVO petitionVO) throws Exception {
		System.out.println(petitionDao.insert(petitionVO));
	}

	@Override
	public PetitionVO selectById(Long petitionId) throws Exception {
		return petitionDao.selectById(petitionId);
	}

	@Override
	public int countPetitions() throws Exception {
		return petitionDao.countPetitions();
	}

	@Override
	public List<PetitionVO> getPetitionsByPage(int currentPage, int itemsPerPage) {
        int offset = (currentPage - 1) * itemsPerPage;
        return petitionDao.selectPetitionsWithParticipantCount(offset, itemsPerPage);
    }
	
	

	public List<PetitionVO> searchPetitions(Map<String, String> searchCriteria) throws Exception {
		return petitionDao.searchPetitions(searchCriteria);
	}

	@Override
	public List<PetitionVO> searchPetitionsByPage(Map<String, String> searchCriteria, int page, int itemsPerPage)
			throws Exception {
		int offset = (page - 1) * itemsPerPage;
		return petitionDao.searchPetitionsByPage(searchCriteria, offset, itemsPerPage);
	}

	@Override
	public int countPetitionsByCriteria(Map<String, String> searchCriteria) throws Exception {
		return petitionDao.countPetitionsByCriteria(searchCriteria);
	}

	@Override
	public boolean addParticipant(Long petitionId, String userId) throws Exception {
		return petitionDao.addParticipant(petitionId, userId);
	}

	@Override
	public boolean isParticipantExists(Long petitionId, String userId) throws Exception {
		return petitionDao.isParticipantExists(petitionId, userId);
	}

	@Override
	public List<PetitionVO> getPetitionsByUser(String userId) throws Exception {
		return petitionDao.getPetitionsByUser(userId);
	}

	@Override
	public List<PetitionVO> getJoinedPetitions(String userId) throws Exception {
		return petitionDao.getJoinedPetitions(userId);
	}

	@Override
	public int getPetitionParticipate(Long petitionId) throws Exception {
		return petitionDao.getPetitionParticipate(petitionId);
	}

	@Override
	public void updatePetition(PetitionVO petition) throws Exception {
		petitionDao.updatePetition(petition);
		
	}

	@Override
	public boolean deletePetitionBy(Long petitionId) throws Exception {
		return petitionDao.deletePetition(petitionId) == 1;
		
	}

	@Override
	public List<PetitionVO> getCurrentPetitionsByPage(int currentPage, int itemsPerPage) throws Exception {
		int offset = (currentPage - 1) * itemsPerPage;
		return petitionDao.getCurrentPetitionsByPage(offset, itemsPerPage);
	}

	@Override
	public int countCurrentPetitions() throws Exception {
		return petitionDao.countCurrentPetitions();
	}
	
	
	

}
