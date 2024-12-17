package kr.ac.kopo.member.service;

import java.util.List;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.dao.MemberDAOImpl;
import kr.ac.kopo.member.vo.MemberVO;

public class MemberServiceImpl implements MemberService {

	private MemberDAO memberDao;

	public MemberServiceImpl() {
		this.memberDao = new MemberDAOImpl();
	}

	@Override
	public MemberVO login(MemberVO memberVo) throws Exception {
		System.out.println("ser" + memberVo);
		return memberDao.selectMember(memberVo);
	}

	@Override
	public int signup(MemberVO memberVo) throws Exception {
		System.out.println("ser" + memberVo);
		return memberDao.insert(memberVo);

	}

	@Override
	public MemberVO detail(MemberVO member) throws Exception {
		return memberDao.selectMember(member);
	}

	public boolean verifyPassword(String userId, String password) throws Exception {
		String storedPassword = memberDao.getPasswordByUserId(userId);
		return storedPassword.equals(password); // DB에서 가져온 비밀번호와 비교
	}

	@Override
	public List<MemberVO> getMemberList() throws Exception {
		return memberDao.selectMemberList();
	}

	@Override
	public MemberVO loginEmail(MemberVO memberVO) throws Exception {
		return memberDao.selectMemberEmail(memberVO);
	}

	@Override
	public boolean isIdDuplicate(String id) throws Exception {
		return memberDao.checkIdExists(id) != 0;
	}

	@Override
	public boolean isEmailDuplicate(String email) throws Exception {
		return memberDao.checkEmailExists(email) != 0;
	}

	@Override
	public boolean updateInfo(MemberVO memberVo) throws Exception {
		return memberDao.updateInfo(memberVo) == 1;
	}

	@Override
    public List<MemberVO> getMemberList(String search, int currentPage, int itemsPerPage) {
        return memberDao.getMemberList(search, currentPage, itemsPerPage);
    }

    @Override
    public int countMembers(String search) {
        return memberDao.countMembers(search);
    }

	@Override
	public String getMemberStatus(String userId) throws Exception {
		return memberDao.getMemberStatus(userId);
	}

	@Override
    public void updateMemberStatus(String userId, String newStatus) throws Exception {
        memberDao.updateMemberStatus(userId, newStatus);
    }

	@Override
	public void deleteMember(String userId) throws Exception {
		 memberDao.deleteMember(userId);
	}

	
	
	
}
