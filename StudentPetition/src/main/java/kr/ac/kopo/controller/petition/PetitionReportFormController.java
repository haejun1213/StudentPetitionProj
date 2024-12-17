package kr.ac.kopo.controller.petition;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.petition.service.PetitionService;
import kr.ac.kopo.petition.service.PetitionServiceImpl;
import kr.ac.kopo.petition.vo.PetitionVO;

public class PetitionReportFormController implements Controller {
	private PetitionService petitionService;

	// 생성자에서 PetitionService 및 PetitionCommentService 초기화
	public PetitionReportFormController() {
		petitionService = new PetitionServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PetitionVO petition = petitionService.selectById(Long.parseLong(request.getParameter("petitionId")));

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId"); 
		String message = "";
		Long petitionId = Long.valueOf(request.getParameter("petitionId"));
	

		if (userId == null) {
			message = "-1";
			return "redirect:/petition/detail.do?petitionId=" + petitionId + "&message=" + message; // 로그인 페이지나 오류 페이지로 리다이렉트
		}

		// 댓글 계층 구조 조회
		request.setAttribute("petition", petition);
		return "/jsp/petition/reportForm.jsp";
	}

}
