package kr.ac.kopo.inquiry.service;

import java.util.List;

import kr.ac.kopo.inquiry.vo.InquiryVO;

public interface InquiryService {
	void addInquiry(InquiryVO inquiry);
	int countInquiries();  
    List<InquiryVO> selectPagedInquiries(int offset, int pageSize);
	void deleteInquiry(int int1); 

}
