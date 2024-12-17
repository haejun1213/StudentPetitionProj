package kr.ac.kopo.controller.admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;

public class AdminMemberStatusController implements Controller {
	
	private MemberService memberService;

	public AdminMemberStatusController() {
		this.memberService = new MemberServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userId = request.getParameter("userId");
		String currentStatus = memberService.getMemberStatus(userId);

        // 상태 변경: ACTIVE ↔ INACTIVE
        String newStatus = "ACTIVE".equals(currentStatus) ? "INACTIVE" : "ACTIVE";

        // 상태 업데이트
        memberService.updateMemberStatus(userId, newStatus);
		return "redirect:/admin/mMember.do";
	}

}
