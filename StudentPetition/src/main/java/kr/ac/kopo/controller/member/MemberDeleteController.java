package kr.ac.kopo.controller.member;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;

public class MemberDeleteController implements Controller {

	private MemberService memberService;

    public MemberDeleteController() {
        this.memberService = new MemberServiceImpl();
    }

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String userId = request.getParameter("userId");

        memberService.deleteMember(userId);

        request.getSession().invalidate();

        return "redirect:/index.jsp";
    }

}
