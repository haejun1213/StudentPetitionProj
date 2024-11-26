package kr.ac.kopo.controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.petition.service.PetitionService;
import kr.ac.kopo.petition.service.PetitionServiceImpl;
import kr.ac.kopo.petition.vo.PetitionVO;

public class PetitionListController implements Controller {

	private PetitionService petitionService;

	public PetitionListController() {
		petitionService = new PetitionServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		List<PetitionVO> petitionList = petitionService.searchAllPetition();
		request.setAttribute("petitionList", petitionList);
		return "/jsp/petition/list.jsp";
	}

}
