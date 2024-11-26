<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
    <link rel="stylesheet" href="/StudentPetition/resources/css/layout.css">
<script src="/StudentPetition/resources/js/jquery-3.7.1.min.js"></script>
<script src="/StudentPetition/resources/js/myJS.js"></script>
</head>
<body>
	<header>
		<%@ include file="/jsp/include/topMenu.jsp"%>
	</header>
   <div id="signup-container" class="form-container">
        <h1 class="form-title">회원가입</h1>
        <form id="signup-form" class="form-content" action="signUp.do" method="post">
            <!-- 사용자 ID -->
            <label for="userId" class="form-label">아이디:</label>
            <input type="text" id="userId" name="userId" class="form-input" required><br>

            <!-- 이메일 -->
            <label for="email" class="form-label">이메일:</label>
            <input type="email" id="email" name="email" class="form-input" required><br>

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
