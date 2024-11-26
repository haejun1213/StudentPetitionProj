package kr.ac.kopo.comment.dao;

import java.util.List;

import kr.ac.kopo.comment.vo.PetitionCommentVO;

public interface PetitionCommentDAO {

    // 특정 청원에 대한 모든 댓글 조회
    List<PetitionCommentVO> selectAllCommentsByPetitionId(Long petitionId);
    
    // 특정 댓글 조회
    PetitionCommentVO selectCommentById(Long commentId);
    
    // 댓글 삽입
    void insertComment(PetitionCommentVO comment);
    
    // 댓글 업데이트
    void updateComment(PetitionCommentVO comment);
    
    // 댓글 삭제
    void deleteComment(Long commentId);

    // 대댓글 삽입
    void insertReplyComment(PetitionCommentVO comment);

}