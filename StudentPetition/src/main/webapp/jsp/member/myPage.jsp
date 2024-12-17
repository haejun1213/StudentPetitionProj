<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/StudentPetition/resources/css/layout.css">
<title>마이페이지</title>
<c:choose>
	<c:when test="${ param.message eq 0 }">
		<script>
			alert("비밀번호가 일치하지 않습니다.");
		</script>
	</c:when>
</c:choose>
</head>
<body>
	<header>
		<%@ include file="/jsp/include/topMenu.jsp"%>
	</header>
	<div class="myPage-container">
		<h1>마이페이지</h1>
		<table class="myPage-table">
			<tr>
				<th>아이디</th>
				<td>${userInfo.userId}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${userInfo.name}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${userInfo.email}</td>
			</tr>
			<tr>
				<th>역할</th>
				<td>${ userInfo.role eq 'USER' ? '일반 유저' : userInfo.role eq 'ADMIN' ? '관리자' : userInfo.role }</td>
			</tr>
			<tr>
				<th>상태</th>
				<td>${ userInfo.status eq 'ACTIVE' ? '활성' : userInfo.status eq 'INACTIVE' ? '비활성' : userInfo.status }
						</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${userInfo.createdDate}</td>
			</tr>
			<c:if test="${ not empty userInfo.updatedDate}">
				<tr>
					<th>수정일</th>
					<td>${userInfo.updatedDate}</td>
				</tr>
			</c:if>
		</table>
		<div class="myPage-button-container">
			<a href="/StudentPetition/member/history.do" class="myPage-button">활동
				내역</a>
			<c:if test="${ empty sessionScope.type }">
				<a href="/StudentPetition/member/verify.do" class="myPage-button">정보
					수정</a>
			</c:if>
		</div>
	</div>
	<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>
</body>
</html>
