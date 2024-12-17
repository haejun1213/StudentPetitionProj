package kr.ac.kopo.answer.vo;

public class AdminAnswerVO {

	private Long answerId;
	private Long petitionId;
	private String userId;
	private String content;
	private String createdDate;

	public AdminAnswerVO() {
	}

	public AdminAnswerVO(Long answerId, Long petitionId, String userId, String content, String createdDate) {
		this.answerId = answerId;
		this.petitionId = petitionId;
		this.userId = userId;
		this.content = content;
		this.createdDate = createdDate;
	}

	public Long getAnswerId() {
		return answerId;
	}

	public void setAnswerId(Long answerId) {
		this.answerId = answerId;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	// toString 메서드
	@Override
	public String toString() {
		return "AdminAnswerVO {" + "answerId=" + answerId + ", petitionId=" + petitionId + ", userId='" + userId + '\''
				+ ", content='" + content + '\'' + ", createdDate=" + createdDate + '}';
	}
}
