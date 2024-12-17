<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>청원 수정</title>
<link rel="stylesheet" href="/StudentPetition/resources/css/layout.css">
</head>
<body>
    <header>
        <%@ include file="/jsp/include/topMenu.jsp"%>
    </header>

    <section class="edit-petition-section">
	<div class="container">
		<h1>청원 수정</h1>
		<form action="/StudentPetition/petition/edit.do" method="post">
			<input type="hidden" name="petitionId" value="${petition.petitionId}">
			
			<div class="form-group">
				<label for="title">제목</label>
                    <input type="text" id="title" value="${petition.title}" readonly />
			</div>

			<div class="form-group">
				<label for="content">내용</label>
                    <textarea id="content" readonly>${petition.content}</textarea>
			</div>

			<div class="form-group">
				<label for="category">카테고리</label>
                    <input type="text" id="category" value="${petition.category}" readonly />
			</div>
			
			<div class="form-group">
				<label for="closeDate">마감일</label>
				<input type="date" id="closeDate" name="closeDate" value="${petition.closeDate}" required>
			</div>

			<div class="form-group">
				<label for="status">상태</label>
				<select id="status" name="status" required>
					<option value="ACTIVE" ${petition.status == '진행' ? 'selected' : ''}>진행</option>
					<option value="CLOSURE" ${petition.status == '마감' ? 'selected' : ''}>마감</option>
					<option value="END" ${petition.status == '종료' ? 'selected' : ''}>종료</option>
				</select>
			</div>

			<div class="form-actions">
				<button type="submit" class="btn-submit">수정</button>
				<button type="button" class="btn-delete" onclick="location.href='/StudentPetition/petition/delete.do?petitionId=${petition.petitionId}'">삭제</button>
				<button type="button" class="btn-back" onclick="history.back();">취소</button>
			</div>
		</form>
	</div>
</section>


    <footer>
        <%@ include file="/jsp/include/footer.jsp"%>
    </footer>
</body>
</html>
