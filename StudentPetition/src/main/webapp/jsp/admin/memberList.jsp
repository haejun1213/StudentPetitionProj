<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 목록</title>
    <link rel="stylesheet" href="/StudentPetition/resources/css/layout.css"> <!-- 외부 CSS 파일 추가 -->
    
<style>
    .adminMemberList-table {
        width: 100%;
        border-collapse: collapse;
    }

    .adminMemberList-th, .adminMemberList-td {
        padding: 8px;
        text-align: center;
        border: 1px solid #ddd;
    }

    .adminMemberList-th {
        background-color: #f8f8f8;
        font-weight: bold;
    }

    .adminMemberList-td {
        background-color: #fff;
    }

    .adminMemberList-table th, .adminMemberList-table td {
        width: 12.5%;
    }

    /* 버튼 스타일 */
    .adminMemberList-btn-edit {
        padding: 6px 12px;
        background-color: #007BFF;  /* 파란색 */
        color: white;
        border: none;
        border-radius: 4px;  /* 둥근 모서리 */
        cursor: pointer;
        font-size: 14px;
        transition: background-color 0.3s;  /* 부드러운 색상 전환 효과 */
    }

    .adminMemberList-btn-edit:hover {
        background-color: #0056b3;  /* 호버 시 어두운 파란색 */
    }

    .adminMemberList-btn-edit:focus {
        outline: none;  /* 포커스시 기본 테두리 제거 */
    }
</style>

</head>
<body>
    <!-- 헤더 포함 -->
    <header>
        <jsp:include page="/jsp/include/topMenu.jsp" />
    </header>

    <!-- 메인 콘텐츠 시작 -->
    <section>
        <h1 style="text-align: center; margin-top: 20px;">회원 목록</h1>
        
        <!-- 검색 바 -->
        <div class="search-bar">
            <form action="/StudentPetition/admin/mMember.do" method="get">
                <input type="hidden" name="page" value="1" />
                <input type="text" name="search" placeholder="검색" value="${param.search}" />
                <button type="submit">검색</button>
            </form>
        </div>

		<div class="pagination">
            <!-- 이전 페이지 버튼 -->
            <c:if test="${currentPage > 1}">
                <a href="/StudentPetition/admin/mMember.do?page=${currentPage - 1}&search=${param.search}" class="page prev">&laquo; 이전</a>
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
                    <a href="/StudentPetition/admin/mMember.do?page=${i}&search=${param.search}" class="page">${i}</a>
                </c:if>
            </c:forEach>

            <!-- 다음 페이지 버튼 -->
            <c:if test="${currentPage < totalPages}">
                <a href="/StudentPetition/admin/mMember.do?page=${currentPage + 1}&search=${param.search}" class="page next">다음 &raquo;</a>
            </c:if>
        </div>

        <!-- 회원 목록 테이블 -->
        <table class="adminMemberList-table">
            <thead>
                <tr>
                    <th class="adminMemberList-th">회원 ID</th>
                    <th class="adminMemberList-th">이름</th>
                    <th class="adminMemberList-th">이메일</th>
                    <th class="adminMemberList-th">역할</th>
                    <th class="adminMemberList-th">상태</th>
                    <th class="adminMemberList-th">가입일</th>
                    <th class="adminMemberList-th">수정일</th>
                    <th class="adminMemberList-th">관리</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${memberList}" var="member">
                    <tr class="adminMemberList-tr">
                        <td class="adminMemberList-td">${member.userId}</td>
                        <td class="adminMemberList-td">${member.name}</td>
                        <td class="adminMemberList-td">${member.email}</td>
                        <td class="adminMemberList-td">${ member.role eq 'USER' ? '일반 유저' : member.role eq 'ADMIN' ? '관리자' : member.role }</td>
                        <td class="adminMemberList-td">${ member.status eq 'ACTIVE' ? '활성' : member.status eq 'INACTIVE' ? '비활성' : member.status }</td>
                        <td class="adminMemberList-td">${member.createdDate}</td>
                        <td class="adminMemberList-td">${member.updatedDate}</td>
                        <td class="adminMemberList-td adminMemberList-actions">
                            <button 
        class="adminMemberList-btn-edit" 
        onclick="if (confirm('정말 상태를 변경하시겠습니까?')) { 
                     location.href = '/StudentPetition/admin/memberStatus.do?userId=${member.userId}'; 
                 }">
        상태 변경
    </button>
                            <!-- <button class="adminMemberList-btn-delete"
											onclick="deleteReport(${report.reportId})">삭제</button> -->
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- 페이징 네비게이션 -->
        <div class="pagination">
            <!-- 이전 페이지 버튼 -->
            <c:if test="${currentPage > 1}">
                <a href="/StudentPetition/admin/mMember.do?page=${currentPage - 1}&search=${param.search}" class="page prev">&laquo; 이전</a>
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
                    <a href="/StudentPetition/admin/mMember.do?page=${i}&search=${param.search}" class="page">${i}</a>
                </c:if>
            </c:forEach>

            <!-- 다음 페이지 버튼 -->
            <c:if test="${currentPage < totalPages}">
                <a href="/StudentPetition/admin/mMember.do?page=${currentPage + 1}&search=${param.search}" class="page next">다음 &raquo;</a>
            </c:if>
        </div>
    </section>

    <!-- 푸터 포함 -->
    <footer>
        <jsp:include page="/jsp/include/footer.jsp" />
    </footer>
</body>
</html>
