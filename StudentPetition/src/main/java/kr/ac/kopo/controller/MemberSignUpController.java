package kr.ac.kopo.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;
import kr.ac.kopo.member.vo.MemberVO;

public class MemberSignUpController implements Controller{
	
	private MemberService memberService;
	
	

	public MemberSignUpController() {
		this.memberService = new MemberServiceImpl();
	}


	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 폼에서 넘어온 데이터를 HttpServletRequest에서 가져오기
        String userId = request.getParameter("userId");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        
        MemberVO memberVo = new MemberVO();
        memberVo.setUserId(userId);
        memberVo.setEmail(email);
        memberVo.setPassword(password);
        memberVo.setName(name);
        
        // PetitionService를 통해 청원 저장
        try {
            // 청원이 정상적으로 저장된 후, 청원 목록 페이지로 리디렉션
        	memberService.signup(memberVo);
            return "/jsp/member/loginForm.jsp";
            //return "/petition/list.do"; // 리디렉션 URL
        } catch (Exception e) {
            // 오류가 발생하면 에러 메시지를 포함하여 작성 페이지로 이동
            return "/jsp/petition/list.jsp"; // 포워드 URL
        }
	}

}
