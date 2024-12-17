package kr.ac.kopo.controller.petition;

import java.util.List;
import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.petition.service.PetitionService;
import kr.ac.kopo.petition.service.PetitionServiceImpl;
import kr.ac.kopo.petition.vo.PetitionVO;

public class PetitionSearchController implements Controller {
	private PetitionService petitionService;

	// 생성자에서 PetitionService 초기화
	public PetitionSearchController() {
		petitionService = new PetitionServiceImpl();
	}
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    int itemsPerPage = 5;
	    String pageParam = request.getParameter("page");
	    int currentPage = Integer.parseInt(pageParam == null ? "1" : pageParam);

	    String title = request.getParameter("title");
	    String category = request.getParameter("category");
	    String status = request.getParameter("status");
	    String sortBy = request.getParameter("sortBy");

	    // 검색 조건 생성
	    Map<String, String> searchCriteria = Map.of(
	        "title", title != null ? title : "",
	        "category", category != null ? category : "",
	        "status", status != null ? status : "",
	        "sortBy", sortBy != null ? sortBy : ""
	    );

	    // 청원 데이터 조회
	    List<PetitionVO> petitionList = petitionService.searchPetitionsByPage(searchCriteria, currentPage, itemsPerPage);
	    int totalItems = petitionService.countPetitionsByCriteria(searchCriteria);
	    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

	    request.setAttribute("petitionList", petitionList);
	    request.setAttribute("currentPage", currentPage);
	    request.setAttribute("totalPages", totalPages);

	    return "/jsp/petition/search.jsp";
	}

}
