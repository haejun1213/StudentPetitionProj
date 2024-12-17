package kr.ac.kopo.controller.admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.report.service.ReportService;
import kr.ac.kopo.report.service.ReportServiceImpl;

public class AdminDeleteReportController implements Controller {

	private ReportService reportService;

	public AdminDeleteReportController() {
		reportService = new ReportServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Long reportId = Long.parseLong(request.getParameter("reportId"));
		System.out.println(reportId);
		System.out.println(reportService.deleteReport(reportId));
		
		return "redirect:/admin/mPetition.do";
	}

}
