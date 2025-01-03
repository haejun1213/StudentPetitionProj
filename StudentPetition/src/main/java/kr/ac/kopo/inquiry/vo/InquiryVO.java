package kr.ac.kopo.inquiry.vo;

import java.util.Date;

public class InquiryVO {
    private int inquiryId;
    private String inquiryUserId;
    private String title;
    private String content;
    private Date createdDate;

    public int getInquiryId() {
        return inquiryId;
    }

    public void setInquiryId(int inquiryId) {
        this.inquiryId = inquiryId;
    }

    public String getInquiryUserId() {
        return inquiryUserId;
    }

    public void setInquiryUserId(String inquiryUserId) {
        this.inquiryUserId = inquiryUserId;
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

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
}
