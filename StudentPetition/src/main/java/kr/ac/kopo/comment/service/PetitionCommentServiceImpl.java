package kr.ac.kopo.comment.service;

import java.util.List;

import kr.ac.kopo.comment.dao.PetitionCommentDAO;
import kr.ac.kopo.comment.dao.PetitionCommentDAOImpl;
import kr.ac.kopo.comment.vo.PetitionCommentVO;

public class PetitionCommentServiceImpl implements PetitionCommentService{

    private PetitionCommentDAO petitionCommentDAO;

    // 생성자에서 DAO 초기화
    public PetitionCommentServiceImpl() {
        petitionCommentDAO = new PetitionCommentDAOImpl();
    }

    // 특정 청원의 모든 댓글 조회
    public List<PetitionCommentVO> getAllCommentsByPetitionId(Long petitionId) {
        return petitionCommentDAO.selectAllCommentsByPetitionId(petitionId);
    }

    // 댓글 추가
    public void addComment(PetitionCommentVO comment) {
        petitionCommentDAO.insertComment(comment);
    }

    // 대댓글 추가
    public void addReplyComment(PetitionCommentVO comment) {
        petitionCommentDAO.insertReplyComment(comment);
    }

    // 댓글 수정
    public void updateComment(PetitionCommentVO comment) {
        petitionCommentDAO.updateComment(comment);
    }

    // 댓글 삭제
    public void deleteComment(Long commentId) {
        petitionCommentDAO.deleteComment(commentId);
    }
}
