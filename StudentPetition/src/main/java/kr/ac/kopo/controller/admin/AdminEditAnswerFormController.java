package kr.ac.kopo.controller.admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.comment.service.PetitionCommentService;
import kr.ac.kopo.comment.service.PetitionCommentServiceImpl;
import kr.ac.kopo.comment.vo.PetitionCommentVO;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.petition.service.PetitionService;
import kr.ac.kopo.petition.service.PetitionServiceImpl;
import kr.ac.kopo.petition.vo.PetitionVO;

public class AdminEditAnswerFormController implements Controller {

	private PetitionService petitionService;
	private PetitionCommentService petitionCommentService;

	public AdminEditAnswerFormController() {
		petitionService = new PetitionServiceImpl();
		petitionCommentService = new PetitionCommentServiceImpl();
	}
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Long petitionId = Long.parseLong(request.getParameter("petitionId"));
		
		PetitionVO petition = petitionService.selectById(petitionId);
		PetitionCommentVO answer = petitionCommentService.getAnswerByPetitionId(petitionId); 
        
        request.setAttribute("petition", petition);
		request.setAttribute("answer", answer);
		return "/jsp/admin/answerEditForm.jsp";
	}

}
