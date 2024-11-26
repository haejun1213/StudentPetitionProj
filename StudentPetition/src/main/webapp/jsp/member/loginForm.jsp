<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/StudentPetition/resources/css/layout.css">
<script src="/StudentPetition/resources/js/jquery-3.7.1.min.js"></script>
<script src="/StudentPetition/resources/js/myJS.js"></script>
<script>
	let checkForm = function() {

		let id = document.loginForm.id
		let password = document.loginForm.password

		if (checkBlacnk(id, "아이디를 입력해주세요")) {
			return false
		}

		if (checkBlacnk(password, "비밀번호를 입력해주세요")) {
			return false
		}

		return true
	}
</script>
</head>
<body>
	<header>
		<%@ include file="/jsp/include/topMenu.jsp"%>
	</header>
	<section class="login-section">
    <div id="login-container" class="form-container">
        <h2 class="form-title">로그인</h2>
        <form name="loginForm" id="login-form" class="form-content" action="login.do" method="post" onsubmit="return checkForm()">
            <label for="userId" class="form-label">아이디:</label>
            <input type="text" id="userId" name="userId" class="form-input" required><br>
            <label for="password" class="form-label">비밀번호:</label>
            <input type="password" id="password" name="password" class="form-input" required><br>
            
            <button type="submit" class="form-button">로그인</button>
        </form>
    </div>
</section>


	<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>
</body>
</html>