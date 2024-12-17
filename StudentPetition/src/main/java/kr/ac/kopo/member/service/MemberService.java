package kr.ac.kopo.member.service;

import java.util.List;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberService {

	MemberVO login(MemberVO memberVo) throws Exception;
	int signup(MemberVO memberVo) throws Exception;
	MemberVO detail(MemberVO member) throws Exception;
	boolean verifyPassword(String userId, String inputPassword) throws Exception;
	List<MemberVO> getMemberList() throws Exception;
	List<MemberVO> getMemberList(String search, int currentPage, int itemsPerPage);
    int countMembers(String search);
	MemberVO loginEmail(MemberVO memberVO) throws Exception;
	boolean isIdDuplicate(String value) throws Exception;
	boolean isEmailDuplicate(String email)throws Exception;
	boolean updateInfo(MemberVO memberVo) throws Exception;
	String getMemberStatus(String userId) throws Exception;
	void updateMemberStatus(String userId, String newStatus) throws Exception;
	void deleteMember(String userId) throws Exception;
}
