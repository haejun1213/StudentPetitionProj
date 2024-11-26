package kr.ac.kopo.comment.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PetitionCommentVO {
    
    private Long commentId;          // 댓글 ID
    private Long petitionId;         // 청원 ID
    private String userId;           // 작성자 ID
    private Long parentCommentId;    // 부모 댓글 ID
    private String content;          // 댓글 내용
    private Date createdAt;          // 생성일
    private List<PetitionCommentVO> replies = new ArrayList<>();

    // 기본 생성자
    public PetitionCommentVO() {}

    // 모든 필드를 초기화하는 생성자
    public PetitionCommentVO(Long commentId, Long petitionId, String userId, Long parentCommentId, String content, Date createdAt) {
        this.commentId = commentId;
        this.petitionId = petitionId;
        this.userId = userId;
        this.parentCommentId = parentCommentId;
        this.content = content;
        this.createdAt = createdAt;
    }
    public List<PetitionCommentVO> getReplies() {
        return replies;
    }

    public void setReplies(List<PetitionCommentVO> replies) {
        this.replies = replies;
    }
    
    public void addReplies(PetitionCommentVO petitionCommentVo) {
        this.replies.add(petitionCommentVo);
    }
    // Getter and Setter Methods
    public Long getCommentId() {
        return commentId;
    }

    public void setCommentId(Long commentId) {
        this.commentId = commentId;
    }

    public Long getPetitionId() {
        return petitionId;
    }

    public void setPetitionId(Long petitionId) {
        this.petitionId = petitionId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Long getParentCommentId() {
        return parentCommentId;
    }

    public void setParentCommentId(Long parentCommentId) {
        this.parentCommentId = parentCommentId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "PetitionCommentVO [commentId=" + commentId + ", petitionId=" + petitionId + ", userId=" + userId
                + ", parentCommentId=" + parentCommentId + ", content=" + content + ", createdAt=" + createdAt + "]";
    }
}
