package kr.ac.kopo.member.vo;

public class MemberVO {
    private String userId;      // 사용자 ID
    private String email;       // 이메일
    private String password;    // 비밀번호
    private String name;        // 이름
    private String role;        // 역할
    private String status;      // 상태
    private String createdAt;     // 생성일
    private String updatedAt;     // 수정일

    public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String userId, String email, String password, String name, String role, String status,
			String createdAt, String updatedAt) {
		super();
		this.userId = userId;
		this.email = email;
		this.password = password;
		this.name = name;
		this.role = role;
		this.status = status;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
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

	public String getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(String updatedAt) {
		this.updatedAt = updatedAt;
	}

	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", email=" + email + ", password=" + password + ", name=" + name
				+ ", role=" + role + ", status=" + status + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt
				+ "]";
	}

    
}
