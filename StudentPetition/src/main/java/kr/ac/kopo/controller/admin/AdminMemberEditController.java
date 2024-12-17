package kr.ac.kopo.controller.admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;
import kr.ac.kopo.member.vo.MemberVO;

public class AdminMemberEditController implements Controller {
	
	private MemberService memberService;

	public AdminMemberEditController() {

		this.memberService = new MemberServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//상태변경코드 ACTIVE -> "" (역방향 가능)
		//MemberVO memberVo = memberService.selectByUserId();
		//memberService.update();
		return "/StudentPetition/admin/mMember.do";
	}

}
