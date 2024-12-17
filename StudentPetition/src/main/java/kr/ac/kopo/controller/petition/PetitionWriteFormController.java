package kr.ac.kopo.controller.petition;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.controller.Controller;

public class PetitionWriteFormController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId"); 
		String message = "";
		if (userId == null) {
			message = "-1";
			return "redirect:/index.jsp?message=" + message; // 로그인 페이지나 오류 페이지로 리다이렉트
		}
		
		return "/jsp/petition/writeForm.jsp";
	}

}
