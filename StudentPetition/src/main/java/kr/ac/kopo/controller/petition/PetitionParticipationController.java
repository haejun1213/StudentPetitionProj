package kr.ac.kopo.controller.petition;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.petition.service.PetitionService;
import kr.ac.kopo.petition.service.PetitionServiceImpl;

public class PetitionParticipationController implements Controller {

	private PetitionService petitionService;

	public PetitionParticipationController() {
		this.petitionService = new PetitionServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId"); // 세션에서 사용자 ID를 가져옵니다.
		System.out.println(userId);
		String message = "";
		// 로그인 여부 체크
		Long petitionId = Long.valueOf(request.getParameter("petitionId"));

		if (userId == null) {
			message = "-1";
			return "redirect:/petition/detail.do?petitionId=" + petitionId + "&message=" + message; // 로그인 페이지나 오류 페이지로 리다이렉트
		}
		// petitionId를 요청 파라미터에서 가져옵니다.

		// 중복 참여 체크
		boolean isAlreadyParticipated = petitionService.isParticipantExists(petitionId, userId);
		if (isAlreadyParticipated) {
			message = "0";
			return "redirect:/petition/detail.do?petitionId=" + petitionId + "&message=" + message; // 중복 참여 오류 메시지 출력
		}

		// 참여 처리
		boolean participated = petitionService.addParticipant(petitionId, userId);
		if (participated) {
			message = "1";
		} else {
			message = "2";
		}

		// 참여 후 결과 페이지로 리다이렉트
		return "redirect:/petition/detail.do?petitionId=" + petitionId + "&message=" + message; // 참여 성공 후 표시할 페이지
	}
}
