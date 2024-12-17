package kr.ac.kopo.report.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.mybatis.MyConfig;
import kr.ac.kopo.report.vo.ReportVO;

public class ReportDAOImpl implements ReportDAO {
	
	SqlSession sqlSession;
	
	

	public ReportDAOImpl() {
		sqlSession = new MyConfig().getInstance();
	}



	@Override
	public void addReport(ReportVO reportVo) throws Exception {
		sqlSession.insert("dao.ReportDAO.insertReport",reportVo);
		sqlSession.commit();
	}



	@Override
	public List<ReportVO> selectAll() throws Exception {
		sqlSession.clearCache();
		return sqlSession.selectList("dao.ReportDAO.selectAllReport");
	}



	@Override
	public int deleteReport(Long reportId) throws Exception {
		int res = sqlSession.delete("dao.ReportDAO.deleteReport", reportId);
		sqlSession.commit();
		return res;
	}

	@Override
    public List<ReportVO> selectPagedReports(int offset, int pageSize) {
		sqlSession.clearCache();
        return sqlSession.selectList("dao.ReportDAO.selectPagedReports", Map.of("offset", offset, "pageSize", pageSize));
    }

    @Override
    public int countReports() {
		sqlSession.clearCache();
        return sqlSession.selectOne("dao.ReportDAO.countReports");
    }



	@Override
	public int countCommentReports() {
		sqlSession.clearCache();
		return sqlSession.selectOne("dao.ReportDAO.countCommentReports");
	}



	@Override
	public List<ReportVO> selectPagedCommentReports(int offset, int pageSize) {
		sqlSession.clearCache();
		return sqlSession.selectList("dao.ReportDAO.selectPagedCommentReports", Map.of("offset", offset, "pageSize", pageSize));
	}



	@Override
	public void addCommentReport(ReportVO commentReport) {
		sqlSession.insert("dao.ReportDAO.insertReport",commentReport);
		sqlSession.commit();
	}
    
	
}
