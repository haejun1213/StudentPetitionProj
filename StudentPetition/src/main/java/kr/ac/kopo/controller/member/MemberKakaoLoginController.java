package kr.ac.kopo.controller.member;

import java.net.URLDecoder;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;
import kr.ac.kopo.member.vo.MemberVO;

public class MemberKakaoLoginController implements Controller {

   private MemberService memberService;
   
   public MemberKakaoLoginController() {
      this.memberService = new MemberServiceImpl();
   }

   @Override
   public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
      System.out.println("KakaoLoginController 요청 도착"); // 로그 추가
      // POST 요청 데이터 처리
        StringBuilder jb = new StringBuilder();
        String line;
        try (var reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                jb.append(line);
            }
        }

        if (jb.length() > 0) {
            try {
                // 디코딩 및 파싱
                String decodedData = URLDecoder.decode(jb.toString(), "UTF-8");
                String[] pairs = decodedData.split("&");
                long id = 0;
                String nick_nm = null;
                String member_email = null;

                for (String pair : pairs) {
                    String[] keyValue = pair.split("=");
                    if (keyValue.length == 2) {
                        String key = keyValue[0];
                        String value = keyValue[1];
                        if ("id".equals(key)) {
                            id = Long.parseLong(value);
                        } else if ("nickname".equals(key)) {
                            nick_nm = value;
                        } else if ("email".equals(key)) {
                            member_email = value;
                        }
                    }
                }

                // User 객체 생성 및 서비스 호출
                HttpSession session = request.getSession();
                String userId = "";
                MemberVO memberVO = new MemberVO(member_email, nick_nm);
                memberVO = memberService.loginEmail(memberVO);
                
                if (memberVO == null) {
                    // 이메일에서 userId 생성 (이메일의 @ 앞부분)
                    userId = member_email; 

                    // MemberVO 객체 생성
                    memberVO = new MemberVO(userId, member_email, nick_nm);
                    
                    // 회원가입 처리
                    int addUnMemResult = memberService.signup(memberVO);
                    if (addUnMemResult <= 0) {
                        System.out.println("멤버 테이블에 비회원을 추가하지 못했습니다.");
                        return "/jsp/member/loginForm.jsp";
                    }
                    memberVO = memberService.loginEmail(memberVO);
                    // 로그인 후 세션에 정보 저장
                    session.setAttribute("userId", userId); // 세션에 사용자 ID 저장
                	session.setAttribute("type", "Kakao"); 
        	        session.setAttribute("isLoggedIn", true); // 로그인 상태 플래그
        	        session.setAttribute("loginedMember", memberVO);

                    System.out.println(memberVO);
                    return "redirect:/petition/list.do?page=1";
                } else {
                    // 이미 존재하는 회원일 경우
                	session.setAttribute("userId", memberVO.getUserId());
                	session.setAttribute("type", "Kakao"); 
        	        session.setAttribute("isLoggedIn", true); 
        	        session.setAttribute("loginedMember", memberVO);
                    System.out.println(memberVO);
                    return "redirect:/petition/list.do?page=1";
                }
                   
                /*
                 * HttpSession session = request.getSession();
	        session.setAttribute("userId", id);
	        session.setAttribute("isLoggedIn", true);
	        session.setAttribute("loginedMember", loginedMember);
                 * 
                 */
                // 결과 페이지로 포워드
                //request.getSession().setAttribute("loginMemberVO", memberVO);
                //return "/home.jsp";

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorKakaoLogin", "데이터 처리 중 오류 발생: " + e.getMessage());
                return "/jsp/member/loginForm.jsp";
            }
        } else {
            request.setAttribute("errorKakaoLogin", "요청 데이터가 없습니다.");
            return "/jsp/member/loginForm.jsp";
        }
    
   }

}   

