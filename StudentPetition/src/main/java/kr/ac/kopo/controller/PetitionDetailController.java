package kr.ac.kopo.controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.comment.service.PetitionCommentService;
import kr.ac.kopo.comment.service.PetitionCommentServiceImpl;
import kr.ac.kopo.comment.vo.PetitionCommentVO;
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
        PetitionVO petition = petitionService.selectById(Integer.parseInt(request.getParameter("id")));

        // 댓글 계층 구조 조회
        Long petitionId = petition.getPetitionId();
        List<PetitionCommentVO> comments = petitionCommentService.getAllCommentsByPetitionId(petitionId);

        request.setAttribute("petition", petition);
        request.setAttribute("comments", comments);

        return "/jsp/petition/detail.jsp";
    }

}