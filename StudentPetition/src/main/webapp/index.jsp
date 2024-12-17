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
    
    <style>
        /* 메인 페이지 스타일 */
        .main-content {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
        }

        .main-content h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
        }

        .main-content p {
            font-size: 16px;
            color: #555;
            line-height: 1.8;
        }

        .procedure {
            margin-top: 30px;
        }

        .procedure h3 {
            font-size: 20px;
            margin-bottom: 15px;
            color: #007bff;
        }

        .procedure ul {
            list-style: none;
            padding: 0;
        }

        .procedure li {
            margin: 10px 0;
            padding: 10px 15px;
            background-color: #f9f9f9;
            border-left: 4px solid #007bff;
            text-align: left;
            font-size: 16px;
        }

        .procedure li span {
            font-weight: bold;
            color: #333;
        }

        .footer-text {
            margin-top: 20px;
            font-size: 14px;
            color: #666;
        }
    </style>
</head>

<body>
    <!-- 헤더 포함 -->
    <header>
        <jsp:include page="/jsp/include/topMenu.jsp" />
    </header>

    <!-- 메인 콘텐츠 시작 -->
   <section class="main-content">
   <h1>청원 시스템에 오신 것을 환영합니다!</h1>
        <h2>학생 청원 시스템 소개</h2>
        <p>
            학생 청원 시스템은 학생들이 자유롭게 의견을 제시하고, 이를 통해 학교 커뮤니티의 문제를 해결할 수 있는 소통 창구입니다.
            누구나 쉽게 청원을 작성할 수 있으며, 접수된 청원은 관리자가 검토 후 절차에 따라 처리됩니다.
        </p>

        <div class="procedure">
            <h3>청원 처리 절차</h3>
            <ul>
                <li><span>1. 접수:</span> 학생들이 청원 내용을 작성하여 제출합니다.</li>
                <li><span>2. 의견 수렴:</span> 다른 학생들의 동의를 받거나 댓글을 통해 의견을 수렴합니다.</li>
                <li><span>3. 처리:</span> 관리자가 검토 후 해당 문제를 해결하기 위한 적절한 조치를 취합니다.</li>
                <li><span>4. 종료:</span> 처리된 청원은 관리자 답변과 함께 공개되며, 최종적으로 종료됩니다.</li>
            </ul>
        </div>

        <p class="footer-text">
            청원은 공정하고 투명한 절차에 따라 진행되며, 모든 학생들이 참여할 수 있는 열린 공간입니다.
        </p>
    </section>
    <!-- 푸터 포함 -->
    <footer>
        <%@ include file="/jsp/include/footer.jsp" %>
    </footer>

</body>
</html>