package kr.ac.kopo.controller.member;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.comment.service.PetitionCommentService;
import kr.ac.kopo.comment.service.PetitionCommentServiceImpl;
import kr.ac.kopo.comment.vo.PetitionCommentVO;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.petition.service.PetitionService;
import kr.ac.kopo.petition.service.PetitionServiceImpl;
import kr.ac.kopo.petition.vo.PetitionVO;

public class MemberHistoryController implements Controller {
	private PetitionService petitionService;
	private PetitionCommentService petitionCommentService;

	// 생성자에서 PetitionService 및 PetitionCommentService 초기화
	public MemberHistoryController() {
		this.petitionService = new PetitionServiceImpl();
		this.petitionCommentService = new PetitionCommentServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

	    // 작성한 청원 목록 조회
	    List<PetitionVO> userPetitions = petitionService.getPetitionsByUser(userId);
	    request.setAttribute("userPetitions", userPetitions);

	    // 참여한 청원 목록 조회
	    List<PetitionVO> joinedPetitions = petitionService.getJoinedPetitions(userId);
	    request.setAttribute("joinedPetitions", joinedPetitions);
	    
	    for(PetitionVO vo : joinedPetitions)
	    	System.out.println(vo);
	    //
//	    // 작성한 댓글 목록 조회
	    List<PetitionCommentVO> userComments = petitionCommentService.getCommentsByUser(userId);
	    for(PetitionCommentVO vo : userComments)
	    	System.out.println(vo);
	    request.setAttribute("userComments", userComments);
		return "/jsp/member/history.jsp";
	}

}
