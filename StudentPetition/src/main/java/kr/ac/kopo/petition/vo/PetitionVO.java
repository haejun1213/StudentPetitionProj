package kr.ac.kopo.petition.vo;

import java.util.Date;

public class PetitionVO {
    private Long petitionId;      // 청원 ID
    private String title;         // 제목
    private String content;       // 내용
    private String category;      // 카테고리
    private String endDate;         // 마감일
    private String status;        // 상태 (예: ACTIVE, INACTIVE 등)
    private String createdAt;       // 생성일
    private String userId;        // 사용자 ID

    // 기본 생성자
   
	public PetitionVO() {
	}

	public PetitionVO(Long petitionId, String title, String content, String category, String endDate, String status,
			String createdAt, String userId) {
		super();
		this.petitionId = petitionId;
		this.title = title;
		this.content = content;
		this.category = category;
		this.endDate = endDate;
		this.status = status;
		this.createdAt = createdAt;
		this.userId = userId;
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

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "PetitionVO [petitionId=" + petitionId + ", title=" + title + ", content=" + content + ", category="
				+ category + ", endDate=" + endDate + ", status=" + status + ", createdAt=" + createdAt + ", userId="
				+ userId + "]";
	}
	
	
}
