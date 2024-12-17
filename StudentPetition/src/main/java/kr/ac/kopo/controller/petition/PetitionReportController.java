package kr.ac.kopo.controller.petition;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.report.service.ReportService;
import kr.ac.kopo.report.service.ReportServiceImpl;
import kr.ac.kopo.report.vo.ReportVO;

public class PetitionReportController implements Controller {

	private ReportService reportService;
		
	public PetitionReportController() {
		reportService = new ReportServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Long petitionId = Long.parseLong(request.getParameter("petitionId"));
		String reportReason = request.getParameter("reportReason");
		String userId = (String) request.getSession().getAttribute("userId");
		
		System.out.println(reportReason);
		ReportVO reportVo = new ReportVO();
		
		reportVo.setPetitionId(petitionId);
		reportVo.setUserId(userId);
		reportVo.setContent(reportReason);
		System.out.println(reportVo);
		
		reportService.addReport(reportVo);
		return "redirect:/petition/detail.do?petitionId=" + petitionId;
	}

}
