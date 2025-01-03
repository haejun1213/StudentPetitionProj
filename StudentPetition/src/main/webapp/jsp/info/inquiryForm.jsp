<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Submit Inquiry</title>
    <link rel="stylesheet" href="/StudentPetition/resources/css/layout.css"> <!-- 외부 CSS 파일 추가 -->
</head>
<body>
    <header>
        <jsp:include page="/jsp/include/topMenu.jsp" />
    </header>
    <div class="inquiry-form-container">
        <h1>문의하기</h1>
        <form action="inquiry.do" method="post">
            <label for="userId">비활성 아이디:</label>
            <input type="text" id="userId" name="userId" required>
            
            <label for="title">문의:</label>
            <input type="text" id="title" name="title" required>
            
            <label for="content">문의 내용:</label>
            <textarea id="content" name="content" rows="5" required></textarea>
            
            <button type="submit">제출</button>
        </form>
    </div>
    <footer>
        <%@ include file="/jsp/include/footer.jsp" %>
    </footer>
</body>
</html>
