<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>청원 시스템</title>
<link rel="stylesheet" href="/StudentPetition/resources/css/layout.css">

</head>

<body>
	<!-- 헤더 포함 -->
	<header>
		<%@ include file="/jsp/include/topMenu.jsp"%>
	</header>

	<!-- 메인 콘텐츠 시작 -->
	<section>

		<!-- 청원 목록 시작 -->
		<div class="petition-List">
			<div class="pagination">
				<!-- 이전 페이지 버튼 -->
				<c:if test="${currentPage > 1}">
					<a href="/StudentPetition/petition/list.do?page=${currentPage - 1}"
						class="page prev">&laquo; 이전</a>
				</c:if>

				<!-- 페이지 번호 범위 설정 -->
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

				<!-- 페이지 번호 표시 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<span class="page current">${i}</span>
					</c:if>
					<c:if test="${i != currentPage}">
						<a href="/StudentPetition/petition/list.do?page=${i}" class="page">${i}</a>
					</c:if>
				</c:forEach>

				<!-- 다음 페이지 버튼 -->
				<c:if test="${currentPage < totalPages}">
					<a href="/StudentPetition/petition/list.do?page=${currentPage + 1}"
						class="page next">다음 &raquo;</a>
				</c:if>
			</div>


			<!-- 청원 목록을 반복하여 출력 -->
			<c:forEach var="petition" items="${petitionList}">
				<a
					href="/StudentPetition/petition/detail.do?petitionId=${petition.petitionId}"
					class="petition-itemL">
					<div class="petition-item">
						<!-- 날짜 정보 -->

						<p class="petition-status ${petition.status}">
							${petition.status eq 'ACTIVE' ? '진행중' : petition.status eq 'CLOSURE' ? '마감' : petition.status eq 'END' ? '종료' : petition.status}
						</p>

						<!-- 청원 제목 및 카테고리 -->
						<div>
							<h3 class="petition-title">
								<c:out value="${petition.title}" />
							</h3>
							<p class="petition-info details">${petition.category}</p>
						</div>

						<p class="petition-info participants">
							참여 수:
							<c:out value="${petition.participantCount}" />&nbsp;&nbsp;
						</p>
						<p class="petition-info date">마감일:  
    ${fn:substring(petition.closeDate, 0, 10)}
</p>
					</div>
				</a>
			</c:forEach>

			<!-- 페이징 네비게이션 -->
			<div class="pagination">
				<!-- 이전 페이지 버튼 -->
				<c:if test="${currentPage > 1}">
					<a href="/StudentPetition/petition/list.do?page=${currentPage - 1}"
						class="page prev">&laquo; 이전</a>
				</c:if>

				<!-- 페이지 번호 범위 설정 -->
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

				<!-- 페이지 번호 표시 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<span class="page current">${i}</span>
					</c:if>
					<c:if test="${i != currentPage}">
						<a href="/StudentPetition/petition/list.do?page=${i}" class="page">${i}</a>
					</c:if>
				</c:forEach>

				<!-- 다음 페이지 버튼 -->
				<c:if test="${currentPage < totalPages}">
					<a href="/StudentPetition/petition/list.do?page=${currentPage + 1}"
						class="page next">다음 &raquo;</a>
				</c:if>
			</div>


		</div>
		<!-- 청원 목록 끝 -->
	</section>

	<!-- 푸터 포함 -->
	<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>

</body>
</html>