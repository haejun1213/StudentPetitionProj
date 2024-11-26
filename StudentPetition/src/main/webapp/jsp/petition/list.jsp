<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
        <%@ include file="/jsp/include/topMenu.jsp" %>
    </header>

    <!-- 메인 콘텐츠 시작 -->
    <section>
        <h1>청원 시스템에 오신 것을 환영합니다!</h1>

        <!-- 청원 목록 시작 -->
        <div class="petition-List">
            <h2>최근 청원 목록</h2>

            <!-- 청원 목록을 반복하여 출력 -->
            <c:forEach var="petition" items="${petitionList}">
                <div class="petition-item">
                    <h3><a href="/StudentPetition/petition/detail.do?id=${petition.petitionId}">${petition.title}</a></h3>
                    <p>${petition.category} | 마감일: ${petition.endDate}</p>
                    <p>${petition.status}</p>
                </div>
            </c:forEach>

            <!-- 페이징 처리 -->
      <%--       <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="index.jsp?page=${currentPage - 1}">&lt; 이전</a>
                </c:if>
                <c:if test="${currentPage < totalPages}">
                    <a href="index.jsp?page=${currentPage + 1}">다음 &gt;</a>
                </c:if>
            </div> --%>
        </div>
        <!-- 청원 목록 끝 -->
    </section>

    <!-- 푸터 포함 -->
    <footer>
        <%@ include file="/jsp/include/footer.jsp" %>
    </footer>

</body>
</html>