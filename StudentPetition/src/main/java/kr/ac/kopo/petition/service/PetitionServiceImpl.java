package kr.ac.kopo.petition.service;

import java.util.List;

import kr.ac.kopo.petition.dao.PetitionDAO;
import kr.ac.kopo.petition.dao.PetitionImpl;
import kr.ac.kopo.petition.vo.PetitionVO;

public class PetitionServiceImpl implements PetitionService{
	
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
	public PetitionVO selectById(int petitionId) throws Exception {
		return petitionDao.selectById(petitionId);
	}
	
	
}
