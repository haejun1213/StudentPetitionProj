<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>청원 신고 관리</title>
<link rel="stylesheet" href="/StudentPetition/resources/css/layout.css">
<!-- 외부 CSS 파일 추가 -->
<style>
.adminMemberList-table {
	width: 100%;
	border-collapse: collapse;
}

.adminMemberList-th, .adminMemberList-td {
	padding: 8px;
	text-align: center;
	border: 1px solid #ddd;
}

.adminMemberList-th {
	background-color: #f8f8f8;
	font-weight: bold;
}

.adminMemberList-td {
	background-color: #fff;
}

.adminMemberList-table th, .adminMemberList-table td {
	width: 12.5%;
}

/* 버튼 스타일 */
.adminMemberList-btn-edit {
	padding: 6px 12px;
	background-color: #007BFF; /* 파란색 */
	color: white;
	border: none;
	border-radius: 4px; /* 둥근 모서리 */
	cursor: pointer;
	font-size: 14px;
	transition: background-color 0.3s; /* 부드러운 색상 전환 효과 */
}

.adminMemberList-btn-edit:hover {
	background-color: #0056b3; /* 호버 시 어두운 파란색 */
}

.adminMemberList-btn-edit:focus {
	outline: none; /* 포커스시 기본 테두리 제거 */
}
</style>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>

	<section class="report-list-section">

		<h1 style="text-align: center; margin-top: 20px;">신고 관리</h1>

		<div class="container">
			<!-- 검색 바 -->
			<div class="pagination">
				<!-- 이전 페이지 버튼 -->
				<c:if test="${currentPage > 1}">
					<a
						href="/StudentPetition/admin/mPetition.do?page=${currentPage - 1}&search=${param.search}"
						class="page prev">&laquo; 이전</a>
				</c:if>

				<!-- 페이지 번호 표시 -->
				<c:set var="startPage" value="${currentPage - 2}" />
				<c:set var="endPage" value="${currentPage + 2}" />
				<c:if test="${startPage < 1}">
					<c:set var="endPage" value="${endPage + (1 - startPage)}" />
					<c:set var="startPage" value="1" />
				</c:if>
				<c:if test="${endPage > totalPages}">
					<c:set var="startPage"
						value="${startPage - (endPage - totalPages)}" />
					<c:set var="endPage" value="${totalPages}" />
				</c:if>
				<c:if test="${startPage < 1}">
					<c:set var="startPage" value="1" />
				</c:if>

				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<span class="page current">${i}</span>
					</c:if>
					<c:if test="${i != currentPage}">
						<a href="/StudentPetition/admin/mPetition.do?page=${i}"
							class="page">${i}</a>
					</c:if>
				</c:forEach>

				<!-- 다음 페이지 버튼 -->
				<c:if test="${currentPage < totalPages}">
					<a
						href="/StudentPetition/admin/mPetition.do?page=${currentPage + 1}"
						class="page next">다음 &raquo;</a>
				</c:if>
			</div>
			<table class="adminMemberList-table">
				<thead>
					<tr class="adminMemberList-tr">
						<th class="adminMemberList-th" style="width: 5%">신고 ID</th>
						<th class="adminMemberList-th" style="width: 5%">청원 ID</th>
						<th class="adminMemberList-th">신고자</th>
						<th class="adminMemberList-th">신고 내용</th>
						<th class="adminMemberList-th">신고일</th>
						<th class="adminMemberList-th">관리</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty reportList}">
							<c:forEach var="report" items="${reportList}">
								<tr class="adminMemberList-tr">
									<td class="adminMemberList-td" style="width: 5%">${report.reportId}</td>
									<td class="adminMemberList-td" style="width: 5%">${report.petitionId}</td>
									<td class="adminMemberList-td">${report.userId}</td>
									<td class="adminMemberList-td">${report.content}</td>
									<td class="adminMemberList-td">
										${fn:substring(report.createDate, 24, 28)} -<c:choose>
											<c:when
												test="${fn:substring(report.createDate, 4, 7) == 'Jan'}">01</c:when>
											<c:when
												test="${fn:substring(report.createDate, 4, 7) == 'Feb'}">02</c:when>
											<c:when
												test="${fn:substring(report.createDate, 4, 7) == 'Mar'}">03</c:when>
											<c:when
												test="${fn:substring(report.createDate, 4, 7) == 'Apr'}">04</c:when>
											<c:when
												test="${fn:substring(report.createDate, 4, 7) == 'May'}">05</c:when>
											<c:when
												test="${fn:substring(report.createDate, 4, 7) == 'Jun'}">06</c:when>
											<c:when
												test="${fn:substring(report.createDate, 4, 7) == 'Jul'}">07</c:when>
											<c:when
												test="${fn:substring(report.createDate, 4, 7) == 'Aug'}">08</c:when>
											<c:when
												test="${fn:substring(report.createDate, 4, 7) == 'Sep'}">09</c:when>
											<c:when
												test="${fn:substring(report.createDate, 4, 7) == 'Oct'}">10</c:when>
											<c:when
												test="${fn:substring(report.createDate, 4, 7) == 'Nov'}">11</c:when>
											<c:when
												test="${fn:substring(report.createDate, 4, 7) == 'Dec'}">12</c:when>
										</c:choose>- ${fn:substring(report.createDate, 8, 10)}
										${fn:substring(report.createDate, 11, 16)}
									</td>
									<td class="adminMemberList-td adminMemberList-actions">
										<button class="adminMemberList-btn-edit"
											onclick="location.href = '/StudentPetition/petition/detail.do?petitionId=${report.petitionId}'">청원
											보기</button>
										<button class="adminMemberList-btn-delete"
											onclick="deleteReport(${report.reportId})">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="adminMemberList-tr">
								<td colspan="6" class="adminMemberList-td">등록된 신고가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>

			<!-- 페이징 처리 -->
			<div class="pagination">
				<!-- 이전 페이지 버튼 -->
				<c:if test="${currentPage > 1}">
					<a
						href="/StudentPetition/admin/mPetition.do?page=${currentPage - 1}&search=${param.search}"
						class="page prev">&laquo; 이전</a>
				</c:if>

				<!-- 페이지 번호 표시 -->
				<c:set var="startPage" value="${currentPage - 2}" />
				<c:set var="endPage" value="${currentPage + 2}" />
				<c:if test="${startPage < 1}">
					<c:set var="endPage" value="${endPage + (1 - startPage)}" />
					<c:set var="startPage" value="1" />
				</c:if>
				<c:if test="${endPage > totalPages}">
					<c:set var="startPage"
						value="${startPage - (endPage - totalPages)}" />
					<c:set var="endPage" value="${totalPages}" />
				</c:if>
				<c:if test="${startPage < 1}">
					<c:set var="startPage" value="1" />
				</c:if>

				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<span class="page current">${i}</span>
					</c:if>
					<c:if test="${i != currentPage}">
						<a href="/StudentPetition/admin/mPetition.do?page=${i}"
							class="page">${i}</a>
					</c:if>
				</c:forEach>

				<!-- 다음 페이지 버튼 -->
				<c:if test="${currentPage < totalPages}">
					<a
						href="/StudentPetition/admin/mPetition.do?page=${currentPage + 1}"
						class="page next">다음 &raquo;</a>
				</c:if>
			</div>
		</div>
	</section>

	<script>
        function deleteReport(reportId) {
            if (confirm("신고를 삭제하시겠습니까?")) {
                location.href = "/StudentPetition/admin/deleteReport.do?reportId=" + reportId;
            }
        }
    </script>

	<footer>
		<jsp:include page="/jsp/include/footer.jsp" />
	</footer>
</body>
</html>
