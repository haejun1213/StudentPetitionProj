
package kr.ac.kopo.controller.admin;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.petition.service.PetitionService;
import kr.ac.kopo.petition.service.PetitionServiceImpl;
import kr.ac.kopo.petition.vo.PetitionVO;

public class AdminCurrentPetitionController implements Controller {
	private PetitionService petitionService;

	public AdminCurrentPetitionController() {
		petitionService = new PetitionServiceImpl();
	}
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

			int itemsPerPage = 5; // 페이지당 항목 수
			String pageParam = request.getParameter("page");
			int currentPage = Integer.parseInt(pageParam == null ? "1" : pageParam);

			// Petition 데이터 조회
			List<PetitionVO> petitionList = petitionService.getCurrentPetitionsByPage(currentPage, itemsPerPage);
			int totalItems = petitionService.countCurrentPetitions();
			int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

			// 요청 속성에 값 설정
			request.setAttribute("petitionList", petitionList);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("totalPages", totalPages);

			return "/jsp/petition/currlist.jsp";
	}

}
