package kr.ac.kopo.controller.member;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.comment.service.PetitionCommentService;
import kr.ac.kopo.comment.service.PetitionCommentServiceImpl;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.petition.service.PetitionService;
import kr.ac.kopo.petition.service.PetitionServiceImpl;

public class MemberMyPageController implements Controller {

	private MemberService memberService;
	private PetitionService petitionService;
    private PetitionCommentService petitionCommentService;

	public MemberMyPageController() {
		this.memberService = new MemberServiceImpl();
		this.petitionService = new PetitionServiceImpl();
		this.petitionCommentService = new PetitionCommentServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		MemberVO memberVo = new MemberVO();
		memberVo.setUserId(userId);
		MemberVO userInfo = memberService.detail(memberVo);
		request.setAttribute("userInfo", userInfo);
		
		return "/jsp/member/myPage.jsp";
	}

}
