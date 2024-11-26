package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;
import kr.ac.kopo.member.vo.MemberVO;

public class MemberLoginController implements Controller {
	
	private MemberService memberService;
	
	public MemberLoginController() {
		this.memberService = new MemberServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    // 로그인 폼에서 전달된 값
	    String id = request.getParameter("userId");
	    String password = request.getParameter("password");

	    MemberVO memberVo = new MemberVO();
	    memberVo.setUserId(id);
	    memberVo.setPassword(password);
	    // 로그인 성공 여부 확인
	    System.out.println("con" + memberVo);
	    if (memberService.login(memberVo) != null) {
	        // 로그인 성공 -> 세션 생성 및 유저 정보 저장
	        HttpSession session = request.getSession();
	        session.setAttribute("userId", id); // 세션에 사용자 ID 저장
	        session.setAttribute("isLoggedIn", true); // 로그인 상태 플래그

	        // 메인 페이지로 리다이렉트
	        return "redirect:/petition/list.do";
	    } else {
	        // 로그인 실패 -> 에러 메시지와 함께 로그인 페이지로 이동
	        request.setAttribute("errorMessage", "아이디 또는 비밀번호가 올바르지 않습니다.");
	        return "/member/loginForm.do";
	    }
	}


}
