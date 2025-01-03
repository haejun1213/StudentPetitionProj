package kr.ac.kopo.inquiry.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.kopo.inquiry.dao.InquiryDAO;
import kr.ac.kopo.inquiry.dao.InquiryDAOImpl;
import kr.ac.kopo.inquiry.vo.InquiryVO;

public class InquiryServiceImpl implements InquiryService {

    private InquiryDAO inquiryDAO;

    public InquiryServiceImpl() {
        this.inquiryDAO = new InquiryDAOImpl();
    }

    @Override
    public void addInquiry(InquiryVO inquiry) {
        inquiryDAO.insertInquiry(inquiry);
    }

    @Override
    public int countInquiries() {
        return inquiryDAO.countInquiries();
    }

    @Override
    public List<InquiryVO> selectPagedInquiries(int offset, int pageSize) {
        return inquiryDAO.selectPagedInquiries(offset, pageSize);
    }

	@Override
	public void deleteInquiry(int inquiryId) {
		inquiryDAO.deleteInquiry(inquiryId);
	}
    
    
}
