<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 답변 작성</title>
<link rel="stylesheet" href="/StudentPetition/resources/css/layout.css">
</head>

<body>
	<header>
		<%@ include file="/jsp/include/topMenu.jsp"%>
	</header>

	<section class="answer-write-section">
		<div class="container">
			<h1>답변 작성</h1>
			<form action="addAnswer.do" method="post">
			
				<input type="hidden" id="petitionId" name="petitionId" value="${param.petitionId}">
				<input type="hidden" id="type" name="type" value="A">
				<div class="form-group">
					<label for="petitionId">청원 제목</label>
					<h2>
					   ${petition.title}
					</h2>
				</div>

				<div class="form-group">
					<label for="userId">작성자 ID</label>
					<input type="text" id="userId" name="userId" readonly
						value="${ userId }" class="form-input">
				</div>

				<div class="form-group">
					<label for="content">답변 내용</label>
					<textarea id="content" name="content" required placeholder="답변 내용을 입력하세요."
						rows="6" class="form-input"></textarea>
				</div>
				
				<div class="form-group" style="text-align: center;">
				<button type="reset" class="btn-submit-comment" onclick="history.back();">
					돌아가기</button>
					<button type="submit" class="btn-submit-comment">답변 등록</button>
				</div>
			</form>
		</div>
	</section>

	<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>
</body>
</html>
