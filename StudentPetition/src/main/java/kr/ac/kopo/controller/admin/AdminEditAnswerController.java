package kr.ac.kopo.controller.admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.comment.service.PetitionCommentService;
import kr.ac.kopo.comment.service.PetitionCommentServiceImpl;
import kr.ac.kopo.comment.vo.PetitionCommentVO;
import kr.ac.kopo.controller.Controller;

public class AdminEditAnswerController implements Controller {

    private PetitionCommentService petitionCommentService;

    public AdminEditAnswerController() {
        petitionCommentService = new PetitionCommentServiceImpl(); // Initialize service
    }

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Long petitionId = Long.parseLong(request.getParameter("petitionId"));
        Long commentId = Long.parseLong(request.getParameter("commentId"));
        String content = request.getParameter("content");
        String userId = request.getParameter("userId");

        PetitionCommentVO petitionCommentVO = new PetitionCommentVO();
        petitionCommentVO.setCommentId(commentId);
        petitionCommentVO.setPetitionId(petitionId);
        petitionCommentVO.setContent(content);
        petitionCommentVO.setUserId(userId);

        petitionCommentService.updateComment(petitionCommentVO);

        return "redirect:/petition/detail.do?petitionId=" + petitionId;
    }
}
