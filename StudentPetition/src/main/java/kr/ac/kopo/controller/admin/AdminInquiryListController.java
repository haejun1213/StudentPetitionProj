package kr.ac.kopo.controller.admin;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.inquiry.service.InquiryService;
import kr.ac.kopo.inquiry.service.InquiryServiceImpl;
import kr.ac.kopo.inquiry.vo.InquiryVO;

public class AdminInquiryListController implements Controller {

	private InquiryService inquiryService;

    public AdminInquiryListController() {
        this.inquiryService = new InquiryServiceImpl();
    }
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 int currentPage = 1; // 기본 페이지 번호
	        int pageSize = 10;  // 한 페이지당 항목 수
	        if (request.getParameter("page") != null) {
	            currentPage = Integer.parseInt(request.getParameter("page"));
	        }

	        // 페이징에 맞는 데이터 가져오기
	        int totalInquiries = inquiryService.countInquiries(); // 전체 문의 수
	        int totalPages = (int) Math.ceil((double) totalInquiries / pageSize);
	        int offset = (currentPage - 1) * pageSize;

	        List<InquiryVO> inquiryList = inquiryService.selectPagedInquiries(offset, pageSize);

	        // 요청 속성에 데이터 추가
	        request.setAttribute("inquiryList", inquiryList);
	        request.setAttribute("currentPage", currentPage);
	        request.setAttribute("totalPages", totalPages);

	        return "/jsp/admin/inquiryList.jsp";  // 요청된 JSP 페이지 반환
	}

}
