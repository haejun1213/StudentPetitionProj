package kr.ac.kopo.controller.petition;

import java.util.Date;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.comment.service.PetitionCommentService;
import kr.ac.kopo.comment.service.PetitionCommentServiceImpl;
import kr.ac.kopo.comment.vo.PetitionCommentVO;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.report.service.ReportService;
import kr.ac.kopo.report.service.ReportServiceImpl;
import kr.ac.kopo.report.vo.ReportVO;

public class CommentReportController implements Controller {

	private ReportService reportService; // Service 클래스 의존성

	private PetitionCommentService petitionCommentService;

	public CommentReportController() {
		this.reportService = new ReportServiceImpl();
		this.petitionCommentService = new PetitionCommentServiceImpl();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String commentIdParam = request.getParameter("commentId");
		String petitionId = request.getParameter("petitionId");
		String userId = (String) request.getSession().getAttribute("userId"); 
		String message = "";


		if (userId == null) {
			message = "-1";
			return "redirect:/petition/detail.do?petitionId=" + petitionId + "&message=" + message;
																									
		}

		Long commentId = Long.parseLong(commentIdParam);
		
		PetitionCommentVO commentVo = petitionCommentService.getComment(commentId);
		// 댓글 정보를 기반으로 신고 생성
		ReportVO commentReport = new ReportVO();
		commentReport.setPetitionId(commentVo.getPetitionId());
		commentReport.setUserId(userId);
		commentReport.setContent(commentVo.getContent());
		commentReport.setCreateDate(new Date());

		// 신고 저장
		reportService.addCommentReport(commentReport);
		System.out.println(commentReport);
		return "redirect:/petition/detail.do?petitionId=" + petitionId;
	}
}
