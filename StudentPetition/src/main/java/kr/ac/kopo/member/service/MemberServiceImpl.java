package kr.ac.kopo.member.service;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.dao.MemberDAOImpl;
import kr.ac.kopo.member.vo.MemberVO;

public class MemberServiceImpl implements MemberService {
	
	private MemberDAO memberDao;

	public MemberServiceImpl() {
		this.memberDao = new MemberDAOImpl();
	}

	@Override
	public MemberVO login(MemberVO memebrVo) throws Exception {
		System.out.println("ser" + memebrVo);
		return memberDao.selectMember(memebrVo);
	}

	@Override
	public void signup(MemberVO memebrVo) throws Exception {
		System.out.println("ser" + memebrVo);
		System.out.println(memberDao.insert(memebrVo) == 1);
		
	}

}
