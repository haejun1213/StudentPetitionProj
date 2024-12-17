package kr.ac.kopo.controller.admin;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;
import kr.ac.kopo.member.vo.MemberVO;

public class AdminMemberListController implements Controller {

    private MemberService memberService;

    public AdminMemberListController() {
        this.memberService = new MemberServiceImpl();
    }

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int itemsPerPage = 7;
        String pageParam = request.getParameter("page");
        int currentPage = Integer.parseInt(pageParam == null ? "1" : pageParam);

        String searchParam = request.getParameter("search");
        String search = (searchParam == null) ? "" : searchParam;

        List<MemberVO> memberList = memberService.getMemberList(search, currentPage, itemsPerPage);
        int totalItems = memberService.countMembers(search);
        int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage); 

        for(MemberVO vo : memberList)
        	System.out.println(vo);
        request.setAttribute("memberList", memberList);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("search", search);

        return "/jsp/admin/memberList.jsp";
    }
}
