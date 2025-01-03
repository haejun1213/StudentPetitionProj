package kr.ac.kopo.controller.admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.inquiry.service.InquiryService;
import kr.ac.kopo.inquiry.service.InquiryServiceImpl;

public class AdminInquiryDeleteController implements Controller {
	
	private InquiryService inquiryService;

    // Constructor to inject the InquiryService
    public AdminInquiryDeleteController() {
        this.inquiryService = new InquiryServiceImpl(); // Assuming service is directly instantiated (DI can be used)
    }

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 String inquiryId = request.getParameter("inquiryId");
		 inquiryService.deleteInquiry(Integer.parseInt(inquiryId));
		 return "/admin/mInquiry.do?page=1";
	}

}
