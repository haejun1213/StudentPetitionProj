package kr.ac.kopo.comment.service;

import java.util.List;

import kr.ac.kopo.comment.vo.PetitionCommentVO;

public interface PetitionCommentService {

    // 특정 청원의 모든 댓글 조회
    public List<PetitionCommentVO> getAllCommentsByPetitionId(Long petitionId) throws Exception;

    // 댓글 추가
    public void addComment(PetitionCommentVO comment)  throws Exception;
    
    // 대댓글 추가
    public void addReplyComment(PetitionCommentVO comment)  throws Exception;

    // 댓글 수정
    public void updateComment(PetitionCommentVO comment)  throws Exception;

    // 댓글 삭제
    public void deleteComment(Long commentId) throws Exception;

	public List<PetitionCommentVO> getCommentsByUser(String userId) throws Exception;

	public void addAnswer(PetitionCommentVO comment);

	public PetitionCommentVO getAnswerByPetitionId(Long petitionId);

	public PetitionCommentVO getComment(Long commentId);
}
