package kr.ac.kopo.inquiry.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.inquiry.vo.InquiryVO;
import kr.ac.kopo.mybatis.MyConfig;

public class InquiryDAOImpl implements InquiryDAO {

	private SqlSession sqlSession;

	public InquiryDAOImpl() {
		sqlSession = new MyConfig().getInstance();
	}

	@Override
	public int insertInquiry(InquiryVO inquiry) {
		int res = sqlSession.insert("dao.InquiryDAO.insertInquiry", inquiry);
		sqlSession.commit();
		return res;
	}

	@Override
	public int countInquiries() {
		sqlSession.clearCache();
		return sqlSession.selectOne("dao.InquiryDAO.countInquiries");
	}

	@Override
	public List<InquiryVO> selectPagedInquiries(int offset, int pageSize) {
		sqlSession.clearCache();
		Map<String, Integer> params = new HashMap<>();
		params.put("offset", offset);
		params.put("pageSize", pageSize);

		return sqlSession.selectList("dao.InquiryDAO.selectPagedInquiries", params);
	}

	@Override
	public void deleteInquiry(int inquiryId) {
		sqlSession.delete("dao.InquiryDAO.deleteInquiry", inquiryId);
		sqlSession.commit();
	}
	
	
}
