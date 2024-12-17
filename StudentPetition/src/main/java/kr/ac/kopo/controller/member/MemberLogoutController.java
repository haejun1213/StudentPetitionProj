package kr.ac.kopo.controller.member;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.controller.Controller;

public class MemberLogoutController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(false); // 기존 세션이 없으면 null 반환

	    if (session != null) {
	        // 세션에서 userId와 isLoggedIn 제거
	        session.removeAttribute("userId");
	        session.removeAttribute("isLoggedIn");
	        session.removeAttribute("type");
	        session.removeAttribute("loginedMember"); 
	       
	    }
		return "redirect:/petition/list.do?page=1";
	}

}
