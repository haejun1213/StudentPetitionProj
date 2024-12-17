package kr.ac.kopo.controller.member;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;
import kr.ac.kopo.member.vo.MemberVO;

public class MemberUpdateInfoController implements Controller {

	private MemberService memberService;

	public MemberUpdateInfoController() {
		this.memberService = new MemberServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String name = request.getParameter("name");
		String password = request.getParameter("password");

		MemberVO memberVo = new MemberVO();
		memberVo.setUserId(userId);
		memberVo.setName(name);
		System.out.println(name);
		memberVo.setPassword(password);

		System.out.println(memberVo);
		memberService.updateInfo(memberVo);
		memberVo = memberService.login(memberVo);
		session.setAttribute("loginedMember", memberVo);

		return "redirect:/member/myPage.do";
	}

}
