<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>청원 작성</title>
    <link rel="stylesheet" href="/StudentPetition/resources/css/layout.css">
</head>
<body>
    <header>
        <%@ include file="/jsp/include/topMenu.jsp" %>
    </header>

    <section class="petition-write-section">
        <div class="container">
            <h1>청원 작성</h1>
            <form action="write.do" method="post">
                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" id="title" name="title" required placeholder="청원의 제목을 입력하세요." maxlength="255">
                </div>

                <div class="form-group">
                    <label for="content">내용</label>
                    <textarea id="content" name="content" required placeholder="청원의 내용을 입력하세요." rows="6"></textarea>
                </div>

                <div class="form-group">
                    <label for="category">카테고리</label>
                    <select id="category" name="category" required>
                        <option value="사회">교육</option>
                        <option value="정치">시설</option>
                        <option value="경제">생활</option>
                        <option value="환경">환경</option>
                        <option value="기타">기타</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="endDate">마감일</label>
                    <input type="date" id="endDate" name="endDate" required>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn-submit">청원 제출</button>
                </div>
            </form>
        </div>
    </section>

    <footer>
        <%@ include file="/jsp/include/footer.jsp" %>
    </footer>

</body>

</html>
