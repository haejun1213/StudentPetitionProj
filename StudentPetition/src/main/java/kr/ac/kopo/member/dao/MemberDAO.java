package kr.ac.kopo.member.dao;

import java.util.List;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberDAO {

	MemberVO selectMember(MemberVO memberVo) throws Exception;
	
	int insert(MemberVO memberVo) throws Exception;

	String getPasswordByUserId(String userId) throws Exception;

	List<MemberVO> selectMemberList() throws Exception;

	MemberVO selectMemberEmail(MemberVO memberVO) throws Exception;
	
	int checkIdExists(String id)throws Exception;
	
    int checkEmailExists(String email)throws Exception;

	int updateInfo(MemberVO memberVo)throws Exception;

	List<MemberVO> getMemberList(String search, int currentPage, int itemsPerPage);
	
    int countMembers(String search);

	String getMemberStatus(String userId)throws Exception;

	void updateMemberStatus(String userId, String newStatus) throws Exception;

	void deleteMember(String userId);
}