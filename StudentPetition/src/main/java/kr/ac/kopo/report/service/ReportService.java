package kr.ac.kopo.report.service;

import java.util.List;

import kr.ac.kopo.report.vo.ReportVO;

public interface ReportService {

	void addReport(ReportVO reportVo) throws Exception;

	List<ReportVO> selectAll()throws Exception;

	boolean deleteReport(Long reportId) throws Exception;;

	List<ReportVO> selectPagedReports(int offset, int pageSize);
	
    int countReports();

	int countCommentReports();

	List<ReportVO> selectPagedCommentReports(int offset, int pageSize);

	void addCommentReport(ReportVO commentReport);
}
