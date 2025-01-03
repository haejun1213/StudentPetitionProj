package kr.ac.kopo.inquiry.dao;

import java.util.List;

import kr.ac.kopo.inquiry.vo.InquiryVO;

public interface InquiryDAO {
    int insertInquiry(InquiryVO inquiry);
    int countInquiries();
    List<InquiryVO> selectPagedInquiries(int offset, int pageSize);
	void deleteInquiry(int inquiryId);

}
