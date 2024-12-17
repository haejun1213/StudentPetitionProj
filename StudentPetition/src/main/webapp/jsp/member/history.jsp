<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 활동</title>
    <link rel="stylesheet" href="/StudentPetition/resources/css/layout.css"> <!-- 외부 CSS 파일 추가 -->
<script>
    // 메뉴 클릭 시 해당 콘텐츠를 표시
    function showContent(sectionId) {
    // 모든 콘텐츠 섹션 숨기기
    document.querySelectorAll('.content-section').forEach(section => {
        section.style.display = 'none';
    });

    // 클릭된 콘텐츠 섹션 표시
    document.getElementById(sectionId).style.display = 'block';

    // 모든 메뉴 버튼의 active 클래스 제거
    document.querySelectorAll('.menu-tab').forEach(tab => {
        tab.classList.remove('active');
    });

    // 클릭된 버튼에 active 클래스 추가
    const activeTab = Array.from(document.querySelectorAll('.menu-tab')).find(tab =>
        tab.getAttribute('onclick').includes(sectionId)
    );
    if (activeTab) {
        activeTab.classList.add('active');
    }
}

// 페이지 로드 시 기본 콘텐츠 표시
window.onload = function() {
    showContent('myPetitions');
};
</script>
</head>
<body>
<header>
        <jsp:include page="/jsp/include/topMenu.jsp" />
</header>

<!-- 메인 콘텐츠 시작 -->
<section>
    <h2>내 활동</h2>
    <!-- 메뉴 탭 -->
    <div id="menu-tabs">
        <button class="menu-tab" onclick="showContent('myPetitions')">내가 작성한 청원</button>
        <button class="menu-tab" onclick="showContent('joinedPetitions')">내가 참여한 청원</button>
        <button class="menu-tab" onclick="showContent('myComments')">내가 작성한 댓글</button>
        <!-- 관리자일 경우만 "내가 작성한 답변" 탭 추가 -->
        <c:if test="${ loginedMember.role eq 'ADMIN' }">
            <button class="menu-tab" onclick="showContent('myAnswers')">내가 작성한 답변</button>
        </c:if>
    </div>

    <!-- 내가 작성한 청원 콘텐츠 -->
    <div id="myPetitions" class="content-section" style="display: none;">
        <h3>내가 작성한 청원</h3>
        <c:if test="${not empty userPetitions}">
            <ul>
                <c:forEach var="petition" items="${userPetitions}">
                    <li>
                        <a href="/StudentPetition/petition/detail.do?petitionId=${petition.petitionId}">
                            ${petition.title}
                        </a>
                        <span>(${petition.createdDate})</span>
                    </li>
                </c:forEach>
            </ul>
        </c:if>
        <c:if test="${empty userPetitions}">
            <p>작성한 청원이 없습니다.</p>
        </c:if>
    </div>

    <!-- 내가 참여한 청원 콘텐츠 -->
    <div id="joinedPetitions" class="content-section" style="display: none;">
        <h3>내가 참여한 청원</h3>
        <c:if test="${not empty joinedPetitions}">
            <ul>
                <c:forEach var="petition" items="${joinedPetitions}">
                    <li>
                        <a href="/StudentPetition/petition/detail.do?petitionId=${petition.petitionId}">
                            ${petition.title}
                        </a>
                        <span>(${petition.createdDate})</span>
                    </li>
                </c:forEach>
            </ul>
        </c:if>
        <c:if test="${empty joinedPetitions}">
            <p>참여한 청원이 없습니다.</p>
        </c:if>
    </div>

    <!-- 내가 작성한 댓글 콘텐츠 -->
    <div id="myComments" class="content-section" style="display: none;">
        <h3>내가 작성한 댓글</h3>
        <c:if test="${not empty userComments}">
            <ul>
                <c:forEach var="comment" items="${userComments}">
                	<c:if test="${ comment.type eq 'C' }">
	                    <li>
	                        <span>${comment.content}</span>
	                        <a href="/StudentPetition/petition/detail.do?petitionId=${comment.petitionId}">
	                            (관련 청원 보기)
	                        </a>
	                        <span>(${comment.createdDate})</span>
	                    </li>
                    </c:if>
                </c:forEach>
            </ul>
        </c:if>
        <c:if test="${empty userComments}">
            <p>작성한 댓글이 없습니다.</p>
        </c:if>
    </div>

    <!-- 관리자만 볼 수 있는 내가 작성한 답변 콘텐츠 -->
    <c:if test="${ loginedMember.role eq 'ADMIN' }">
        <div id="myAnswers" class="content-section" style="display: none;">
            <h3>내가 작성한 답변</h3>
             <c:if test="${not empty userComments}">
            <ul>
                <c:forEach var="comment" items="${userComments}">
                	<c:if test="${ comment.type eq 'A' }">
	                    <li>
	                        <span>${comment.content}</span>
	                        <a href="/StudentPetition/petition/detail.do?petitionId=${comment.petitionId}">
	                            (관련 청원 보기)
	                        </a>
	                        <span>(${comment.createdDate})</span>
	                    </li>
                    </c:if>
                </c:forEach>
            </ul>
        </c:if>
        <c:if test="${empty userComments}">
            <p>작성한 답변이 없습니다.</p>
        </c:if>
        </div>
    </c:if>
</section>

<!-- 푸터 포함 -->
<footer>
    <%@ include file="/jsp/include/footer.jsp" %>
</footer>
</body>
</html>
