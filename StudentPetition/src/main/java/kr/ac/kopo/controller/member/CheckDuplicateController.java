package kr.ac.kopo.controller.member;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;

public class CheckDuplicateController implements Controller {

    private MemberService memberService;

    public CheckDuplicateController() {
        this.memberService = new MemberServiceImpl();
    }

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String field = request.getParameter("field");
        String value = request.getParameter("value");

        boolean isDuplicate = false;

        // 필드 값에 따라 중복 여부 확인
        if ("id".equals(field)) {
            isDuplicate = memberService.isIdDuplicate(value);
        } else if ("email".equals(field)) {
            isDuplicate = memberService.isEmailDuplicate(value);
        }
        System.out.println(isDuplicate);
        // JSON 응답 설정
        response.setContentType("application/json; charset=UTF-8");
        response.getWriter().write("{\"duplicate\": " + isDuplicate + "}");

        return null; // 여기에서는 JSP 페이지로 포워딩할 필요가 없으므로 null 반환
    }
}
