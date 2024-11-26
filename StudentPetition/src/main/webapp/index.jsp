<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>청원 시스템</title>
    <link rel="stylesheet" href="/StudentPetition/resources/css/layout.css"> <!-- 외부 CSS 파일 추가 -->
</head>

<body>
    <!-- 헤더 포함 -->
    <header>
        <jsp:include page="/jsp/include/topMenu.jsp" />
    </header>

    <!-- 메인 콘텐츠 시작 -->
    <section>
        <h1>청원 시스템에 오신 것을 환영합니다!</h1>

        <!-- 청원 목록 시작 -->
    
        <!-- 청원 목록 끝 -->
    </section>

    <!-- 푸터 포함 -->
    <footer>
        <%@ include file="/jsp/include/footer.jsp" %>
    </footer>

</body>
</html>