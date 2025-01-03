<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의 목록</title>
<link rel="stylesheet" href="/StudentPetition/resources/css/layout.css">
</head>
<body>
	<!-- 헤더 -->
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>

	<h1 style="text-align: center; margin-top: 20px;">문의 목록</h1>

	<!-- 문의 목록 테이블 -->
	<section>
		<div class="pagination">
			<!-- 이전 페이지 버튼 -->
			<c:if test="${currentPage > 1}">
				<a href="/StudentPetition/admin/mInquiry.do?page=${currentPage - 1}"
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
				<c:set var="startPage" value="${startPage - (endPage - totalPages)}" />
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
					<a href="/StudentPetition/admin/mInquiry.do?page=${i}" class="page">${i}</a>
				</c:if>
			</c:forEach>

			<c:if test="${currentPage < totalPages}">
				<a href="/StudentPetition/admin/mInquiry.do?page=${currentPage + 1}"
					class="page next">다음 &raquo;</a>
			</c:if>
		</div>

		<table class="inquiry-table">
			<thead>
				<tr>
					<th class="inquiry-th">문의 번호</th>
					<th class="inquiry-th">사용자 ID</th>
					<th class="inquiry-th">제목</th>
					<th class="inquiry-th">내용</th>
					<th class="inquiry-th">등록일</th>
					<th class="inquiry-th">관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="inquiry" items="${inquiryList}">
					<tr>
						<td class="inquiry-td">${inquiry.inquiryId}</td>
						<td class="inquiry-td">${inquiry.inquiryUserId}</td>
						<td class="inquiry-td">${inquiry.title}</td>
						<td class="inquiry-td">${inquiry.content}</td>
						<td class="inquiry-td">${inquiry.createdDate}</td>
						<td class="inquiry-td"><button class="btn-searchId"
								onclick="location.href='/StudentPetition/admin/mMember.do?page=1&search=${inquiry.inquiryUserId}'">찾기</button>
							<button class="btn-delete-inquiry"
								onclick="location.href='/StudentPetition/admin/deleteInquiry.do?inquiryId=${inquiry.inquiryId}'">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</section>

	<!-- 페이징 처리 -->
	<div class="pagination">
		<c:if test="${currentPage > 1}">
			<a href="/StudentPetition/admin/mInquiry.do?page=${currentPage - 1}"
				class="page prev">&laquo; 이전</a>
		</c:if>

		<c:set var="startPage" value="${currentPage - 2}" />
		<c:set var="endPage" value="${currentPage + 2}" />
		<c:if test="${startPage < 1}">
			<c:set var="endPage" value="${endPage + (1 - startPage)}" />
			<c:set var="startPage" value="1" />
		</c:if>
		<c:if test="${endPage > totalPages}">
			<c:set var="startPage" value="${startPage - (endPage - totalPages)}" />
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
				<a href="/StudentPetition/admin/mInquiry.do?page=${i}" class="page">${i}</a>
			</c:if>
		</c:forEach>

		<c:if test="${currentPage < totalPages}">
			<a href="/StudentPetition/admin/mInquiry.do?page=${currentPage + 1}"
				class="page next">다음 &raquo;</a>
		</c:if>
	</div>

	<!-- 푸터 -->
	<footer>
		<jsp:include page="/jsp/include/footer.jsp" />
	</footer>
</body>
</html>
