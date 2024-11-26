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
<script>
function showReplyForm(commentId) {
    const form = document.getElementById(`replyForm_${commentId}`);
    form.style.display = (form.style.display === "none") ? "block" : "none";
}

</script>

<body>
	<!-- 헤더 포함 -->
	<header>
		<%@ include file="/jsp/include/topMenu.jsp"%>
	</header>

	<!-- 메인 콘텐츠 시작 -->
	<section>
		<div id="petition-detail-container" class="detail-container">
			<h1 class="detail-title">${petition.title}</h1>

			<button class="btn-report"
				onclick="reportPetition(${petition.petitionId})">신고</button>
			<p class="detail-meta">
				<span class="detail-category">카테고리: ${petition.category}</span> | <span
					class="detail-end-date">마감일: ${petition.endDate}</span> | <span
					class="detail-status">상태: ${petition.status}</span>
			</p>
			<hr>
			<div class="detail-content">
				<p>${petition.content}</p>
			</div>
			<div class="detail-actions">
				<hr>
				<button class="btn-participate"
					onclick="participateInPetition(${petition.petitionId})">참여</button>
				<hr>
				<a href="/StudentPetition/petition/list.do" class="btn-back">목록으로
					돌아가기</a>

			</div>
			<hr>
			<div id="comment-section" class="comment-section">
				<h2 class="comment-title">댓글</h2>




				<c:forEach var="comment" items="${comments}">
					<div class="reply">
						<p>
							<strong>${comment.userId}</strong>: ${comment.content}
						</p>
						<p>작성일: ${comment.createdAt}</p>
						<button onclick="showReplyForm(${comment.commentId})">대댓글
							작성</button>
						<form id="replyForm_${comment.commentId}" style="display: none;"
							action="/addReplyComment.do" method="post">
							<input type="hidden" name="parentCommentId"
								value="${comment.commentId}"> <input type="hidden"
								name="petitionId" value="${petition.petitionId}">
							<textarea name="content" placeholder="대댓글을 입력하세요"></textarea>
							<button type="submit">등록</button>
						</form>

						<!-- 대댓글 처리 -->
						<c:if test="${not empty comment.replies}">
							<div class="replies"
								style="margin-left: 20px; border-left: 1px solid #ddd; padding-left: 10px;">
								<!-- 대댓글 반복 -->
								<c:forEach var="reply" items="${comment.replies}">
									<div class="reply">
										<p>
											<strong>${reply.userId}</strong>: ${reply.content}
										</p>
										<p>작성일: ${reply.createdAt}</p>
										<button onclick="showReplyForm(${reply.commentId})">대댓글
											작성</button>
										<form id="replyForm_${reply.commentId}" style="display: none;"
											action="/addReplyComment.do" method="post">
											<input type="hidden" name="parentCommentId"
												value="${reply.commentId}"> <input type="hidden"
												name="petitionId" value="${petition.petitionId}">
											<textarea name="content" placeholder="대댓글을 입력하세요"></textarea>
											<button type="submit">등록</button>
										</form>

										<!-- 대댓글의 대댓글 처리 -->
										<c:if test="${not empty reply.replies}">
											<div class="replies"
												style="margin-left: 20px; border-left: 1px solid #ddd; padding-left: 10px;">
												<!-- 반복적으로 대댓글 출력 -->
												<c:forEach var="subReply" items="${reply.replies}">
													<div class="reply">
														<p>
															<strong>${subReply.userId}</strong>: ${subReply.content}
														</p>
														<p>작성일: ${subReply.createdAt}</p>
													</div>
												</c:forEach>
											</div>
										</c:if>
									</div>
								</c:forEach>
							</div>
						</c:if>
					</div>
				</c:forEach>





				<form id="comment-form" class="comment-form"
					action="/StudentPetition/comment/add.do" method="post">
					<input type="hidden" name="petitionId"
						value="${petition.petitionId}">
					<textarea name="content" class="comment-input"
						placeholder="댓글을 입력하세요..." required></textarea>
					<button type="submit" class="btn-submit-comment">댓글 작성</button>
				</form>
			</div>
		</div>

	</section>

	<!-- 푸터 포함 -->
	<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>

</body>
</html>