package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.petition.service.PetitionService;
import kr.ac.kopo.petition.service.PetitionServiceImpl;
import kr.ac.kopo.petition.vo.PetitionVO;

public class PetitionWriteController implements Controller {

	 private PetitionService petitionService;

	    // 생성자에서 PetitionService 초기화
	    public PetitionWriteController() {
	        petitionService = new PetitionServiceImpl();
	    }

	    // handleRequest 메서드 구현
	    @Override
	    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
	        // 폼에서 넘어온 데이터를 HttpServletRequest에서 가져오기
	        String title = request.getParameter("title");
	        String content = request.getParameter("content");
	        String category = request.getParameter("category");
	        String endDate = request.getParameter("endDate");
	        
	        // 현재 로그인한 유저의 ID를 세션에서 가져오는 방식으로 구현
	        String userId = (String) request.getSession().getAttribute("userId");
	        
	        // PetitionVO 객체에 데이터 설정
	        PetitionVO petitionVO = new PetitionVO();
	        petitionVO.setTitle(title);
	        petitionVO.setContent(content);
	        petitionVO.setCategory(category);
	        petitionVO.setEndDate(endDate); // endDate는 String이므로, DB에 맞게 처리해야 할 수도 있음
	        petitionVO.setUserId(userId);
	        
	        // PetitionService를 통해 청원 저장
	        try {
	            petitionService.insertPetition(petitionVO);
	            // 청원이 정상적으로 저장된 후, 청원 목록 페이지로 리디렉션
	            
	            return "/jsp/petition/list.jsp";
	            //return "/petition/list.do"; // 리디렉션 URL
	        } catch (Exception e) {
	            // 오류가 발생하면 에러 메시지를 포함하여 작성 페이지로 이동
	            request.setAttribute("errorMessage", "청원 작성 중 오류가 발생했습니다.");
	            return "/jsp/petition/writeForm.jsp"; // 포워드 URL
	        }
	    }

}
