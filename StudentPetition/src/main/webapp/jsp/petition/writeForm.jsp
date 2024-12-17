<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>청원 작성</title>
<link rel="stylesheet" href="/StudentPetition/resources/css/layout.css">
</head>
<script>
	window.onload = function() {
		// 현재 날짜 가져오기
		const today = new Date();

		// 한 달 뒤 날짜 계산
		const nextMonth = new Date(today);
		nextMonth.setMonth(today.getMonth() + 1);

		// YYYY-MM-DD 형식으로 변환
		const year = nextMonth.getFullYear();
		const month = String(nextMonth.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1
		const day = String(nextMonth.getDate()).padStart(2, '0');
		const formattedDate = year + '-' + month + '-' + day; //  대신 +로 문자열 결합

		// input[type="date"]의 초기값 설정
		document.getElementById("closeDate").value = formattedDate;

		document.getElementById('closeDate').setAttribute('min',
				new Date().toISOString().split('T')[0]);
	};
</script>

<body>
	<header>
		<%@ include file="/jsp/include/topMenu.jsp"%>
	</header>

	<section class="petition-write-section">
		<div class="container">
			<h1>청원 작성</h1>
			<form action="write.do" method="post">
				<div class="form-group">
					<label for="title">제목</label> <input type="text" id="title"
						name="title" required placeholder="청원의 제목을 입력하세요." maxlength="255">
				</div>

				<div class="form-group">
					<label for="content">내용</label>
					<textarea id="content" name="content" required
						placeholder="청원의 내용을 입력하세요." rows="6"></textarea>
				</div>

				<div class="form-group">
					<label for="category">카테고리</label> <select id="category"
						name="category" required>
						<option value="교육">교육</option>
						<option value="시설">시설</option>
						<option value="생활">생활</option>
						<option value="환경">환경</option>
						<option value="기타">기타</option>
					</select>
				</div>

				<div class="form-group">
					<label for="endDate">마감일</label> <input type="date" id="closeDate"
						name="closeDate" required min="" />
				</div>

				<div class="form-group">
					<button type="submit" class="btn-submit">청원 제출</button>
				</div>
			</form>
		</div>
	</section>

	<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>


</body>


</html>
