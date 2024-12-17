<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>청원 시스템</title>
    <link rel="stylesheet" href="/StudentPetition/resources/css/layout.css"> <!-- 외부 CSS 파일 추가 -->
    
    <c:choose>
        <c:when test="${ param.message eq -1 }">
            <script>
                alert("로그인 후 작성할 수 있습니다.");
            </script>
        </c:when>
    </c:choose>
</head>

<body>
    <!-- 헤더 포함 -->
    <header>
        <jsp:include page="/jsp/include/topMenu.jsp" />
    </header>

    <!-- petition-write-section 클래스 적용 -->
    <section class="petition-write-section">
        <div class="container">
            <h1>회원 정보 수정</h1>
            <form action="/StudentPetition/member/updateInfo.do" method="post">
                <div class="form-group">
                    <label for="name">이름:</label>
                    <input type="text" id="name" name="name" value="${sessionScope.loginedMember.name}" required>
                </div>
                
                <div class="form-group">
                    <label for="password">새 비밀번호:</label>
                    <input type="password" id="password" name="password" placeholder="미변경시 미입력">
                </div>
                
                <button type="submit" class="btn-submit">수정</button>
                <button type="reset" class="btn-delete" onclick="if (confirm('정말 탈퇴하시겠습니까?')) { 
                     location.href = '/StudentPetition/member/delete.do?userId=${sessionScope.loginedMember.userId}'; 
                 }">탈퇴</button>
            </form>
        </div>
    </section>

    <!-- 푸터 포함 -->
    <footer>
        <%@ include file="/jsp/include/footer.jsp" %>
    </footer>
</body>
</html>
