<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<header>
	<nav class="navbar">
		<div class="navbar-left">
			<a href="/StudentPetition/index.jsp" class="logo">PolyPetition</a>
		</div>
		<div class="navbar-center">
			<ul class="nav-links">
				<li><a href="/StudentPetition/petition/list.do?page=1">청원
						목록</a></li>
				<li><a href="/StudentPetition/petition/writeForm.do">청원 작성</a></li>
				<li><a href="/StudentPetition/petition/search.do">청원 검색</a></li>
			</ul>
		</div>
		<div class="navbar-right">
			<c:choose>
				<c:when test="${ isLoggedIn }">
					<!-- 로그인된 상태 -->
					<ul>
						<c:if test="${ loginedMember.role eq 'ADMIN' }">
							<!-- 로그인된 상태 -->
							<li><a href="/StudentPetition/admin/mPetition.do?page=1">신고 관리</a></li>
							<li><a href="/StudentPetition/admin/mMember.do?page=1">회원 관리</a></li>
						</c:if>
						<li><a href="/StudentPetition/member/myPage.do">[ ${ loginedMember.name } ] 마이페이지</a></li>
						<li><a href="/StudentPetition/member/logout.do">로그아웃</a></li>
					</ul>
				</c:when>


				<c:otherwise>
					<!-- 로그인되지 않은 상태 -->
					<ul>
						<li><a href="/StudentPetition/member/loginForm.do">로그인</a></li>
						<li><a href="/StudentPetition/member/signUpForm.do">회원가입</a></li>
					</ul>
				</c:otherwise>
			</c:choose>

		</div>
	</nav>
</header>
