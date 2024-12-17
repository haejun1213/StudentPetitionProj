<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<link rel="stylesheet" href="/StudentPetition/resources/css/layout.css">
<script src="/StudentPetition/resources/js/jquery-3.7.1.min.js"></script>
<script src="/StudentPetition/resources/js/myJS.js"></script>
<script>
	function checkDuplicate(field, value, callback) {
		$.ajax({
			url : "/StudentPetition/member/checkDuplicate.do",
			type : "POST",
			data : {
				field : field,
				value : value
			},
			success : function(response) {
				console.log(response);
				callback(response.duplicate); 
			},
			error : function(error) {
				console.error("중복 확인 실패:", error);
				alert("중복 확인 중 문제가 발생했습니다. 다시 시도해주세요.");
			}
		});
	}

	$(document).ready(function() {
		// 중복 확인 함수
		var isIdDuplicate = false;
		var isEmailDuplicate = false;

		$("#userId").on("blur", function() {
			const userId = $(this).val();
			if (userId.trim() !== "") {
				checkDuplicate("id", userId, function(isDuplicate) {
					isIdDuplicate = isDuplicate;
					if (isDuplicate) {
						// 중복된 경우 빨간색 텍스트로 메시지 표시
						$("#userIdMessage").text("이미 사용 중인 아이디입니다.").css("color", "red");
					} else {
						// 중복되지 않으면 메시지 숨기기
						$("#userIdMessage").text("");
					}
				});
			}
		});

		$("#email").on("blur", function() {
			const email = $(this).val();
			if (email.trim() !== "") {
				checkDuplicate("email", email, function(isDuplicate) {
					isEmailDuplicate = isDuplicate;
					if (isDuplicate) {
						// 중복된 경우 빨간색 텍스트로 메시지 표시
						$("#emailMessage").text("이미 사용 중인 이메일입니다.").css("color", "red");
					} else {
						// 중복되지 않으면 메시지 숨기기
						$("#emailMessage").text("");
					}
				});
			}
		});

		// 폼 제출 시 중복 검사
		$("#signup-form").on("submit", function(e) {
			if (isIdDuplicate || isEmailDuplicate) {
				e.preventDefault();  // 폼 제출 방지
				alert("아이디 또는 이메일이 중복됩니다. 다시 입력해주세요.");
			}
		});
	});
</script>
<c:choose>
	<c:when test="${ param.message eq 0 }">
		<script>
			alert("이미 사용중인 아이디입니다.");
		</script>
	</c:when>
</c:choose>

</head>
<body>
	<header>
		<%@ include file="/jsp/include/topMenu.jsp"%>
	</header>
	<div id="signup-container" class="form-container">
		<h1 class="form-title">회원가입</h1>
		<form id="signup-form" class="form-content" action="signUp.do"
			method="post">
			<!-- 사용자 ID -->
			<label for="userId" class="form-label">아이디:</label> 
			<input type="text" id="userId" name="userId" class="form-input" required>
			<!-- 중복 메시지 표시 영역 -->
			<span id="userIdMessage" class="error-message"></span><br>

			<!-- 이메일 -->
			<label for="email" class="form-label">이메일:</label> 
			<input type="email" id="email" name="email" class="form-input" required>
			<!-- 중복 메시지 표시 영역 -->
			<span id="emailMessage" class="error-message"></span><br>

			<!-- 비밀번호 -->
			<label for="password" class="form-label">비밀번호:</label> 
			<input type="password" id="password" name="password" class="form-input" required><br>

			<!-- 이름 -->
			<label for="name" class="form-label">이름:</label> 
			<input type="text" id="name" name="name" class="form-input" required><br>

			<!-- 버튼 -->
			<button type="submit" id="signup-button" class="form-button">회원가입</button>
		</form>
	</div>
	<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>
</body>
</html>
