package kr.ac.kopo.controller.info;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.inquiry.service.InquiryService;
import kr.ac.kopo.inquiry.service.InquiryServiceImpl;
import kr.ac.kopo.inquiry.vo.InquiryVO;

public class InquiryController implements Controller {

	 private InquiryService inquiryService;

	    public InquiryController() {
	        this.inquiryService = new InquiryServiceImpl();
	    }
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 String userId = request.getParameter("userId");
         String title = request.getParameter("title");
         String content = request.getParameter("content");

         InquiryVO inquiry = new InquiryVO();
         inquiry.setInquiryUserId(userId);
         inquiry.setTitle(title);
         inquiry.setContent(content);

         inquiryService.addInquiry(inquiry);
         return "redirect:/index.jsp?message=1";
	}

}
