package kr.ac.kopo.member.dao;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberDAO {

	MemberVO selectMember(MemberVO memberVo) throws Exception;
	
	int insert(MemberVO memberVo) throws Exception;
}
