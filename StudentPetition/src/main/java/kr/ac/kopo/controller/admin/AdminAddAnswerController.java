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

public class AdminAddAnswerController implements Controller {

	private PetitionService petitionService;
	private PetitionCommentService petitionCommentService;

	public AdminAddAnswerController() {
		petitionService = new PetitionServiceImpl();
		petitionCommentService = new PetitionCommentServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 청원 정보 조회
		PetitionVO petition = petitionService.selectById(Long.parseLong(request.getParameter("petitionId")));
		String content = request.getParameter("content");
		String userId = (String) request.getSession().getAttribute("userId");
		String type = request.getParameter("type");
		// 댓글 계층 구조 조회
		Long petitionId = petition.getPetitionId();
		PetitionCommentVO comment = new PetitionCommentVO();
		
		comment.setPetitionId(petitionId);
		comment.setUserId(userId);
		comment.setContent(content);
		
		System.out.println(petition);
		System.out.println(content);
		System.out.println(userId);
		System.out.println(petitionId);
		System.out.println(comment);
		
		petitionCommentService.addAnswer(comment);

		return "redirect:/petition/detail.do?petitionId=" + petitionId;
	}

}
