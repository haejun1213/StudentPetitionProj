package kr.ac.kopo.controller.admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.petition.service.PetitionService;
import kr.ac.kopo.petition.service.PetitionServiceImpl;
import kr.ac.kopo.petition.vo.PetitionVO;

public class AdminAnswerFormController implements Controller {

	private PetitionService petitionService;

    // 생성자에서 PetitionService 및 PetitionCommentService 초기화
    public AdminAnswerFormController() {
        petitionService = new PetitionServiceImpl();
    }
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

        PetitionVO petition = petitionService.selectById(Long.parseLong(request.getParameter("petitionId")));
        
        request.setAttribute("petition", petition);
		return "/jsp/admin/answerForm.jsp";
	}

}
