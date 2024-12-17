package kr.ac.kopo.controller.admin;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.report.service.ReportService;
import kr.ac.kopo.report.service.ReportServiceImpl;
import kr.ac.kopo.report.vo.ReportVO;

public class AdminReportPetitionListController implements Controller {

    private ReportService reportService;

    public AdminReportPetitionListController() {
        reportService = new ReportServiceImpl();
    }

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 페이징 변수 처리
        int currentPage = 1; // 기본 페이지 번호
        int pageSize = 10;  // 한 페이지당 항목 수
        if (request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }

        // 페이징에 맞는 데이터 가져오기
        int totalReports = reportService.countReports(); // 전체 신고 수
        int totalPages = (int) Math.ceil((double) totalReports / pageSize);
        int offset = (currentPage - 1) * pageSize;

        List<ReportVO> reportList = reportService.selectPagedReports(offset, pageSize);

        // 요청 속성에 데이터 추가
        request.setAttribute("reportList", reportList);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        return "/jsp/admin/reportPetitionList.jsp";
    }
}
