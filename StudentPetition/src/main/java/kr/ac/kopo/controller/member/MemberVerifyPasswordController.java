package kr.ac.kopo.controller.member;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;

public class MemberVerifyPasswordController implements Controller {

    private MemberService memberService;

    public MemberVerifyPasswordController() {
        memberService = new MemberServiceImpl();
    }

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        String inputPassword = request.getParameter("password");

        // Validate password
        boolean isValid = memberService.verifyPassword(userId, inputPassword);

        if (isValid) {
            return "redirect:/jsp/member/editForm.jsp"; // 비밀번호가 일치하면 수정 폼 페이지로 이동
        } else {
            return "redirect:/member/myPage.do?message=0"; // 비밀번호가 일치하지 않으면 다시 입력 페이지로
        }
    }
}
