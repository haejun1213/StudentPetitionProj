package test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.mybatis.MyConfig;
import kr.ac.kopo.petition.vo.PetitionVO;

class MyBatisTest {
	
	
	

	@Disabled
	@Test
	void test() throws Exception {
		new MyConfig();
	}

	@Disabled
	@Test
	void sqlSessionTest() throws Exception {
		SqlSession session = new MyConfig().getInstance();
		assertNotNull(session);
	}

	@Disabled
	@Test
	void selectBoardTest() throws Exception {
		SqlSession session = new MyConfig().getInstance();

		List<PetitionVO> list = session.selectList("dao.PetitionDAO.selectAllPetitions");
		assertNotEquals(list.size(), 0);
	}
	
	
	@Disabled
	@Test
	void selectTest() throws Exception {
		SqlSession session = new MyConfig().getInstance();
		MemberVO loginVO = new MemberVO();
		loginVO.setUserId("qwer");
		loginVO.setPassword("1234");
		MemberVO member = session.selectOne("dao.MemberDAO.selectMember", loginVO);
		assertNotNull(member);
	}
	
	@Test
	void insertTest() throws Exception {
		SqlSession session = new MyConfig().getInstance();
		PetitionVO petitionVO = new PetitionVO();
        petitionVO.setTitle("제목2");
        petitionVO.setContent("내용2");
        petitionVO.setCategory("학교");
        petitionVO.setEndDate("2024-11-30"); // endDate는 String이므로, DB에 맞게 처리해야 할 수도 있음
        petitionVO.setUserId("qwer");
		int res = session.insert("dao.PetitionDAO.insertPetition", petitionVO);
		System.out.println(res);
		session.commit();
		assertEquals(res, 1);
	}
}
