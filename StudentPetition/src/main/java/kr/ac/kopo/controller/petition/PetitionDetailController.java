package kr.ac.kopo.controller.petition;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.comment.service.PetitionCommentService;
import kr.ac.kopo.comment.service.PetitionCommentServiceImpl;
import kr.ac.kopo.comment.vo.PetitionCommentVO;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.petition.service.PetitionService;
import kr.ac.kopo.petition.service.PetitionServiceImpl;
import kr.ac.kopo.petition.vo.PetitionVO;

public class PetitionDetailController implements Controller {

    private PetitionService petitionService;
    private PetitionCommentService petitionCommentService;

    // 생성자에서 PetitionService 및 PetitionCommentService 초기화
    public PetitionDetailController() {
        petitionService = new PetitionServiceImpl();
        petitionCommentService = new PetitionCommentServiceImpl();
    }

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 청원 정보 조회
    	
    	Long petitionId = Long.parseLong(request.getParameter("petitionId"));
        PetitionVO petition = petitionService.selectById(petitionId);

        // 댓글 계층 구조 조회
        List<PetitionCommentVO> comments = petitionCommentService.getAllCommentsByPetitionId(petitionId);

        int participate = petitionService.getPetitionParticipate(petitionId);
        
        PetitionCommentVO answer = petitionCommentService.getAnswerByPetitionId(petitionId); 
        
        request.setAttribute("participate", participate);
        request.setAttribute("petition", petition);
        request.setAttribute("comments", comments);
        request.setAttribute("answer", answer);

        return "/jsp/petition/detail.jsp";
    }

}
