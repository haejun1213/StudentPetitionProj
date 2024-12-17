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
		<div class="search-bar">
    <form action="/StudentPetition/petition/search.do" method="get">
        <input type="hidden" name="page" value="1" />
        <input type="text" name="title" placeholder="제목 검색" value="${param.title}" />

        <select name="category">
            <option value="">카테고리 선택</option>
            <option value="교육" ${param.category == '교육' ? 'selected' : ''}>교육</option>
            <option value="시설" ${param.category == '시설' ? 'selected' : ''}>시설</option>
            <option value="생활" ${param.category == '생활' ? 'selected' : ''}>생활</option>
            <option value="환경" ${param.category == '환경' ? 'selected' : ''}>환경</option>
            <option value="기타" ${param.category == '기타' ? 'selected' : ''}>기타</option>
        </select>

        <select name="status">
            <option value="">상태 선택</option>
            <option value="ACTIVE" ${param.status == 'ACTIVE' ? 'selected' : ''}>진행중</option>
            <option value="CLOSURE" ${param.status == 'CLOSURE' ? 'selected' : ''}>마감</option>
            <option value="END" ${param.status == 'END' ? 'selected' : ''}>종료</option>
        </select>

        <select name="sortBy">
            <option value="none">정렬 기준 선택</option>
            <option value="participants" ${param.sortBy == 'participants' ? 'selected' : ''}>참여 수</option>
        </select>

        <button type="submit" style="margin-left:auto;">검색</button>
    </form>
</div>

		<!-- 청원 목록 시작 -->
		<div class="petition-List">
		
		<c:if test="${ empty petitionList}"> 
    <p style="text-align: center; color: #555;">검색조건에 해당하는 청원이 없습니다.</p>
</c:if>

			<!-- 페이징 네비게이션 -->
			<div class="pagination">
				<!-- 이전 페이지 버튼 -->
				<c:if test="${currentPage > 1}">
					<a href="/StudentPetition/petition/search.do?page=${currentPage - 1}&title=${ param.title }&category=${ param.category }&status=${ param.status }&sortBy=${ param.sortBy }"
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
					<c:set var="startPage" value="${startPage - (endPage - totalPages)}" />
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
						<a href="/StudentPetition/petition/search.do?page=${i}&title=${ param.title }&category=${ param.category }&status=${ param.status }&sortBy=${ param.sortBy }" class="page">${i}</a>
					</c:if>
				</c:forEach>

				<!-- 다음 페이지 버튼 -->
				<c:if test="${currentPage < totalPages}">
					<a href="/StudentPetition/petition/search.do?page=${currentPage + 1}&title=${ param.title }&category=${ param.category }&status=${ param.status }&sortBy=${ param.sortBy }"
						class="page next">다음 &raquo;</a>
				</c:if>
			</div>

			<!-- 청원 목록을 반복하여 출력 -->
			
			
			<c:forEach var="petition" items="${petitionList}">
				<a href="/StudentPetition/petition/detail.do?petitionId=${petition.petitionId}" class="petition-itemL">
					<div class="petition-item">
						<!-- 상태 -->
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
							참여 수: <c:out value="${petition.participantCount}" />&nbsp;&nbsp;
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
					<a href="/StudentPetition/petition/search.do?page=${currentPage - 1}&title=${ param.title }&category=${ param.category }&status=${ param.status }&sortBy=${ param.sortBy }"
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
					<c:set var="startPage" value="${startPage - (endPage - totalPages)}" />
					<c:set var="endPage" value="${totalPages}" />
				</c:if>
				<c:if test="${startPage < 1}">
					<c:set var="startPage" value="1" />
				</c:if>

				<!-- 페이지 번호 표시 -->
	
				<!-- 페이지 번호 표시 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<span class="page current">${i}</span>
					</c:if>
					<c:if test="${i != currentPage}">
						<a href="/StudentPetition/petition/search.do?page=${i}&title=${ param.title }&category=${ param.category }&status=${ param.category }&sortBy=${ param.sortBy }" class="page">${i}</a>
					</c:if>
				</c:forEach>

				<!-- 다음 페이지 버튼 -->
				<c:if test="${currentPage < totalPages}">
					<a href="/StudentPetition/petition/search.do?page=${currentPage + 1}&title=${ param.title }&category=${ param.category }&status=${ param.category }&sortBy=${ param.sortBy }"
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