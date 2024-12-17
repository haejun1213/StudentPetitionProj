package kr.ac.kopo.controller.petition;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.petition.service.PetitionService;
import kr.ac.kopo.petition.service.PetitionServiceImpl;
import kr.ac.kopo.petition.vo.PetitionVO;

public class PetitionEditFormController implements Controller {

    private PetitionService petitionService;

    // 생성자에서 PetitionService 및 PetitionCommentService 초기화
    public PetitionEditFormController() {
        petitionService = new PetitionServiceImpl();
    }

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 청원 정보 조회
        PetitionVO petition = petitionService.selectById(Long.parseLong(request.getParameter("petitionId")));

        // 댓글 계층 구조 조회
        request.setAttribute("petition", petition);
        System.out.println(petition);

        return "/jsp/petition/editForm.jsp";
    }

}