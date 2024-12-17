package kr.ac.kopo.report.vo;

import java.util.Date;

public class ReportVO {

	private Long reportId;
	private Long petitionId;
	private String userId;
	private String content;
	private Date createDate;

	public Long getReportId() {
		return reportId;
	}

	public void setReportId(Long reportId) {
		this.reportId = reportId;
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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public ReportVO(Long reportId, Long petitionId, String userId, String content, Date createDate) {
		super();
		this.reportId = reportId;
		this.petitionId = petitionId;
		this.userId = userId;
		this.content = content;
		this.createDate = createDate;
	}

	public ReportVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "ReportVO [reportId=" + reportId + ", petitionId=" + petitionId + ", userId=" + userId + ", content="
				+ content + ", createDate=" + createDate + "]";
	}
}
