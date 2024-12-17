package kr.ac.kopo.petition.vo;

public class PetitionVO {
    private Long petitionId; // 청원 ID
    private String title; // 제목
    private String content; // 내용
    private String category; // 카테고리
    private String closeDate; // 마감일
    private String status; // 상태 (예: ACTIVE, INACTIVE 등)
    private String createdDate; // 생성일
    private String userId; // 사용자 ID
    private int participantCount; // 참여 수

    public PetitionVO() {
        super();
    }

    public PetitionVO(Long petitionId, String title, String content, String category, String closeDate, String status,
                      String createdDate, String userId, int participantCount) {
        super();
        this.petitionId = petitionId;
        this.title = title;
        this.content = content;
        this.category = category;
        this.closeDate = closeDate;
        this.status = status;
        this.createdDate = createdDate;
        this.userId = userId;
        this.participantCount = participantCount;
    }

    public Long getPetitionId() {
        return petitionId;
    }

    public void setPetitionId(Long petitionId) {
        this.petitionId = petitionId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCloseDate() {
        return closeDate;
    }

    public void setCloseDate(String closeDate) {
        this.closeDate = closeDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getParticipantCount() {
        return participantCount;
    }

    public void setParticipantCount(int participantCount) {
        this.participantCount = participantCount;
    }

    @Override
    public String toString() {
        return "PetitionVO [petitionId=" + petitionId + ", title=" + title + ", content=" + content + ", category="
                + category + ", closeDate=" + closeDate + ", status=" + status + ", createdDate=" + createdDate
                + ", userId=" + userId + ", participantCount=" + participantCount + "]";
    }
}
