package kr.ac.kopo.comment.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.comment.vo.PetitionCommentVO;
import kr.ac.kopo.mybatis.MyConfig;

public class PetitionCommentDAOImpl implements PetitionCommentDAO {

	private SqlSession sqlSession;

	public PetitionCommentDAOImpl() {
		sqlSession = new MyConfig().getInstance();
	}

	@Override
	public List<PetitionCommentVO> selectAllCommentsByPetitionId(Long petitionId) {
	    List<PetitionCommentVO> comments = sqlSession.selectList("dao.PetitionCommentDAO.selectAllCommentsByPetitionId", petitionId);

	    // Comment ID를 Key로 사용하는 Map 생성
	    Map<Long, PetitionCommentVO> commentMap = new HashMap<>();
	    List<PetitionCommentVO> rootComments = new ArrayList<>();

	    // 모든 댓글을 Map에 저장
	    for (PetitionCommentVO comment : comments) {
	        comment.setReplies(new ArrayList<>()); // 대댓글 리스트 초기화
	        commentMap.put(comment.getCommentId(), comment);
	    }

	    // 계층 구조 생성
	    for (PetitionCommentVO comment : comments) {
	        Long parentId = comment.getParentCommentId();
	        if (parentId == null) {
	            // 최상위 댓글은 rootComments에 추가
	            rootComments.add(comment);
	        } else {
	            // 대댓글의 경우, 부모 댓글의 replies에 추가
	            PetitionCommentVO parentComment = commentMap.get(parentId);
	            if (parentComment != null) {
	                parentComment.getReplies().add(comment);
	            }
	        }
	    }

	    // 디버깅용 출력
	    for (PetitionCommentVO vo : rootComments) {
	        printCommentTree(vo, 0);
	    }

	    return rootComments;
	}

	// 트리 구조 디버깅용 메서드
	private void printCommentTree(PetitionCommentVO comment, int depth) {
	    // depth에 따라 들여쓰기 조정
	    String indent = " ".repeat(depth * 2);
	    System.out.println(indent + comment);

	    for (PetitionCommentVO reply : comment.getReplies()) {
	        printCommentTree(reply, depth + 1); // 재귀적으로 출력
	    }
	}
	@Override
	public void insertComment(PetitionCommentVO comment) {
		sqlSession.insert("dao.PetitionCommentDAO.insertComment", comment);
		sqlSession.commit();
	}

	@Override
	public PetitionCommentVO selectCommentById(Long commentId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateComment(PetitionCommentVO comment) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteComment(Long commentId) {
		// TODO Auto-generated method stub

	}

	@Override
	public void insertReplyComment(PetitionCommentVO comment) {
		// TODO Auto-generated method stub

	}
}
