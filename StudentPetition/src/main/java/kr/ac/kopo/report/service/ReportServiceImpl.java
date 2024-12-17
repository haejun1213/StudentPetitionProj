package kr.ac.kopo.report.service;

import java.util.List;

import kr.ac.kopo.report.dao.ReportDAO;
import kr.ac.kopo.report.dao.ReportDAOImpl;
import kr.ac.kopo.report.vo.ReportVO;

public class ReportServiceImpl implements ReportService {
	 private ReportDAO reportDAO;

	    // 생성자에서 DAO 초기화
	    public ReportServiceImpl() {
	    	reportDAO = new ReportDAOImpl();
	    }

	@Override
	public void addReport(ReportVO reportVo) throws Exception {
		reportDAO.addReport(reportVo);
	}

	@Override
	public List<ReportVO> selectAll() throws Exception {
		return reportDAO.selectAll();
	}

	@Override
	public boolean deleteReport(Long reportId) throws Exception {
		return reportDAO.deleteReport(reportId) == 1;
	}
	
	@Override
    public List<ReportVO> selectPagedReports(int offset, int pageSize) {
        return reportDAO.selectPagedReports(offset, pageSize);
    }

    @Override
    public int countReports() {
        return reportDAO.countReports();
    }

	@Override
	public int countCommentReports() {
		return reportDAO.countCommentReports();
	}

	@Override
	public List<ReportVO> selectPagedCommentReports(int offset, int pageSize) {
		return reportDAO.selectPagedCommentReports(offset, pageSize);
	}

	@Override
	public void addCommentReport(ReportVO commentReport) {
		reportDAO.addCommentReport(commentReport);
	}
    
	

}
