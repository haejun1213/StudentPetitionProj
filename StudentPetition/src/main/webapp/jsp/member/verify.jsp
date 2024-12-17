<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 확인</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.edit-container {
	width: 50%;
	margin: 50px auto;
}

h1 {
	text-align: center;
}

form {
	background-color: #f9f9f9;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-group {
	margin-bottom: 15px;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

input[type="password"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

.button-container {
	text-align: center;
}

.button {
	padding: 10px 20px;
	background-color: #007BFF;
	color: white;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
}

.button:hover {
	background-color: #0056b3;
}
</style>
<link rel="stylesheet" href="/StudentPetition/resources/css/layout.css">
</head>
<body>
	<header>
		<%@ include file="/jsp/include/topMenu.jsp"%>
	</header>
	<div class="edit-container">
		<h1>정보 수정</h1>
		<form action="/StudentPetition/member/verifyPassword.do" method="post">
			<div class="form-group">
				<label for="password">비밀번호 확인</label> <input
					type="password" id="password" name="password" required>
			</div>
			<div class="button-container">
				<button type="submit" class="button">확인</button><button class="button" onclick="history.back();">취소</button>
			</div>
		</form>
	</div>
	<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>
</body>
</html>