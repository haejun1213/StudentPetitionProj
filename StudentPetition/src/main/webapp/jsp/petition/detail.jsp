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
    const form = document.getElementById(`replyForm_\${commentId}`)
    form.style.display = (form.style.display === "none") ? "block" : "none"
}

function reportComment(commentId, petitionId) {
    const userConfirmed = confirm("댓글을 신고하시겠습니까?");
    if (userConfirmed) {
    	location.href = `/StudentPetition/petition/reportComment.do?commentId=\${commentId}&petitionId=\${petitionId}`;

    }
}
function deleteComment(commentId, petitionId) {
    if (confirm("정말로 이 댓글을 삭제하시겠습니까?")) {
    	location.href = `/StudentPetition/petition/deleteComment.do?commentId=\${commentId}&petitionId=\${petitionId}`;
    }
}
</script>

<c:choose>
	<c:when test="${ param.message eq -1 }">
		<script>
			alert("로그인 후 할 수 있습니다.");
		</script>
	</c:when>
	<c:when test="${ param.message eq 0 }">
		<script>
			alert("이미 참여한 청원입니다.");
		</script>
	</c:when>
	<c:when test="${ param.message eq 1 }">
		<script>
			alert("청원에 성공적으로 참여하였습니다.");
		</script>
	</c:when>
	<c:when test="${ param.message eq 2 }">
		<script>
			alert("참여 처리 중 오류가 발생했습니다.");
		</script>
	</c:when>
</c:choose>

<body>


	<!-- 헤더 포함 -->
	<header>
		<%@ include file="/jsp/include/topMenu.jsp"%>
	</header>

	<!-- 메인 콘텐츠 시작 -->
	<section>
		<div id="petition-detail-container" class="detail-container">
			<h1 class="detail-title">
				<c:out value="${petition.title}" />
			</h1>

			<button class="btn-report"
				onclick="location.href='/StudentPetition/petition/reportForm.do?petitionId=${petition.petitionId}'">신고</button>
			<c:if test="${ loginedMember.role eq 'ADMIN' }">
				<button class="btn-report"
					onclick="location.href='/StudentPetition/petition/editForm.do?petitionId=${petition.petitionId}'">수정</button>
			</c:if>
			<p class="detail-meta">
				<span class="detail-category">카테고리: ${petition.category} </span> | <span
					class="detail-end-date">마감일: ${petition.closeDate} </span> | <span
					class="detail-status">상태: ${petition.status eq 'ACTIVE' ? '진행중' : petition.status eq 'CLOSURE' ? '마감' : petition.status eq 'END' ? '종료' : petition.status}
				</span> | <span class="detail-uesr">작성자: ${petition.userId} </span> | <span
					class="detail-participate"> 참여 인원: ${ participate } </span>
			</p>
			<hr>
			<div class="detail-content">
				<p>${petition.content}</p>
			</div>
			<div class="detail-actions">
				<hr>
				<c:if test="${ not empty answer }">
					<div class="detail-answers">
						<h5>답변</h5>
						<p>${ answer.userId }</p>
						<p>${ answer.content }</p>
						<p>${ answer.createdDate }</p>
					</div>
				</c:if>
				<c:if test="${petition.status == 'ACTIVE'}">
					<button class="btn-participate"
						onclick="location.href='/StudentPetition/petition/participate.do?petitionId=${petition.petitionId}'">참여</button>
				</c:if>
				<c:if test="${loginedMember.role == 'ADMIN'}">
					<c:if test="${ empty answer }">
						<button class="btn-participate"
							onclick="location.href='/StudentPetition/admin/answerForm.do?petitionId=${petition.petitionId}'">답변
							작성</button>
					</c:if>
					<c:if test="${ not empty answer }">
						<button class="btn-participate"
							onclick="location.href='/StudentPetition/admin/answerEditForm.do?petitionId=${petition.petitionId}&commentId=${ answer.commentId }'"> 

							답변 수정
						</button>
					</c:if>
				</c:if>
				<hr>

				<button class="btn-back" onclick="location.href='/StudentPetition/petition/list.do?page=1'">목록으로
					돌아가기</button>


			</div>
			<hr>
			<div id="comment-section" class="comment-section">
				<h2 class="comment-title">댓글</h2>




				<c:forEach var="comment" items="${comments}">
					<div class="reply">
						<p>
							<strong>${comment.userId}</strong>: ${comment.content}
						</p>
						<p>작성일: ${comment.createdDate}</p>
						<button onclick="showReplyForm(${comment.commentId})"
							class="btn-submit-replyComment">대댓글 작성</button>
						<button class="btn-CommentReport"
							onclick="reportComment('${comment.commentId}', '${ petition.petitionId }')">신고</button>
						<c:if test="${loginedMember.role == 'ADMIN'}">
							<button class="btn-delete-comment"
								onclick="deleteComment('${comment.commentId}', '${petition.petitionId}')">삭제</button>
						</c:if>
						<form id="replyForm_${comment.commentId}" style="display: none;"
							action="/StudentPetition/petition/replyCommentAdd.do"
							method="post">
							<input type="hidden" name="parentCommentId"
								value="${comment.commentId}"> <input type="hidden"
								name="petitionId" value="${petition.petitionId}">
							<textarea name="content" placeholder="대댓글을 입력하세요"></textarea>
							<button type="submit" class="btn-submit-comment">등록</button>
						</form>

						<!-- 대댓글 처리 -->
						<c:if test="${not empty comment.replies}">
							<div class="replies"
								style="margin-left: 20px; border-left: 1px solid #ddd; padding-left: 10px;">
								<c:forEach var="reply" items="${comment.replies}">
									<div class="reply">
										<p>
											<strong>${reply.userId}</strong>: ${reply.content}

										</p>
										<p>작성일: ${reply.createdDate}</p>
										<button onclick="showReplyForm(${reply.commentId})"
											class="btn-submit-replyComment">대댓글 작성</button>
										<button class="btn-CommentReport"
											onclick="reportComment('${reply.commentId}', '${ petition.petitionId }')">신고</button>
										<c:if test="${loginedMember.role == 'ADMIN'}">
											<button class="btn-delete-comment"
												onclick="deleteComment('${reply.commentId}', '${petition.petitionId}')">삭제</button>
										</c:if>
										<form id="replyForm_${reply.commentId}" style="display: none;"
											action="/StudentPetition/petition/replyCommentAdd.do"
											method="post">
											<input type="hidden" name="parentCommentId"
												value="${reply.commentId}"> <input type="hidden"
												name="petitionId" value="${petition.petitionId}">
											<textarea name="content" placeholder="대댓글을 입력하세요"></textarea>
											<button type="submit" class="btn-submit-comment">등록</button>
										</form>

										<!-- 대댓글의 대댓글 처리 -->
										<c:if test="${not empty reply.replies}">
											<div class="replies"
												style="margin-left: 20px; border-left: 1px solid #ddd; padding-left: 10px;">
												<c:forEach var="subReply" items="${reply.replies}">
													<div class="reply">
														<p>
															<strong>${subReply.userId}</strong>: ${subReply.content}
														</p>
														<p>작성일: ${subReply.createdDate}</p>
														<button onclick="showReplyForm(${subReply.commentId})"
															class="btn-submit-replyComment">대댓글 작성</button>
														<button class="btn-CommentReport"
															onclick="reportComment('${subReply.commentId}', '${ petition.petitionId }')">신고</button>
														<c:if test="${loginedMember.role == 'ADMIN'}">
															<button class="btn-delete-comment"
																onclick="deleteComment('${subReply.commentId}', '${petition.petitionId}')">삭제</button>
														</c:if>
														<form id="replyForm_${subReply.commentId}"
															style="display: none;"
															action="/StudentPetition/petition/replyCommentAdd.do"
															method="post">
															<input type="hidden" name="parentCommentId"
																value="${subReply.commentId}"> <input
																type="hidden" name="petitionId"
																value="${petition.petitionId}">
															<textarea name="content" placeholder="대댓글을 입력하세요"></textarea>
															<button type="submit" class="btn-submit-comment">등록</button>
														</form>

														<!-- 대댓글의 대댓글의 대댓글 처리 -->
														<c:if test="${not empty subReply.replies}">
															<div class="replies"
																style="margin-left: 20px; border-left: 1px solid #ddd; padding-left: 10px;">
																<c:forEach var="subSubReply" items="${subReply.replies}">
																	<div class="reply">
																		<p>
																			<strong>${subSubReply.userId}</strong>:
																			${subSubReply.content}
																		</p>
																		<p>작성일: ${subSubReply.createdDate}</p>
																		<button
																			onclick="showReplyForm(${subSubReply.commentId})"
																			class="btn-submit-replyComment">대댓글 작성</button>
																		<button class="btn-CommentReport"
																			onclick="reportComment('${subSubReply.commentId}', '${ petition.petitionId }')">신고</button>
																		<c:if test="${loginedMember.role == 'ADMIN'}">
																			<button class="btn-delete-comment"
																				onclick="deleteComment('${subSubReply.commentId}', '${petition.petitionId}')">삭제</button>
																		</c:if>
																		<form id="replyForm_${subSubReply.commentId}"
																			style="display: none;"
																			action="/StudentPetition/petition/replyCommentAdd.do"
																			method="post">
																			<input type="hidden" name="parentCommentId"
																				value="${subSubReply.commentId}"> <input
																				type="hidden" name="petitionId"
																				value="${petition.petitionId}">
																			<textarea name="content" placeholder="대댓글을 입력하세요"></textarea>
																			<button type="submit" class="btn-submit-comment">등록</button>
																		</form>

																		<!-- 대댓글의 대댓글의 대댓글의 대댓글 처리 -->
																		<c:if test="${not empty subSubReply.replies}">
																			<div class="replies"
																				style="margin-left: 20px; border-left: 1px solid #ddd; padding-left: 10px;">
																				<c:forEach var="subSubSubReply"
																					items="${subSubReply.replies}">
																					<div class="reply">
																						<p>
																							<strong>${subSubSubReply.userId}</strong>:
																							${subSubSubReply.content}
																						</p>
																						<p>작성일: ${subSubSubReply.createdDate}</p>
																						<button class="btn-CommentReport"
																			onclick="reportComment('${subSubSubReply.commentId}', '${ petition.petitionId }')">신고</button>
																		<c:if test="${loginedMember.role == 'ADMIN'}">
																			<button class="btn-delete-comment"
																				onclick="deleteComment('${subSubSubReply.commentId}', '${petition.petitionId}')">삭제</button>
																		</c:if>
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
											</div>
										</c:if>
									</div>
								</c:forEach>
							</div>
						</c:if>
					</div>
				</c:forEach>


				<form id="comment-form" class="comment-form"
					action="/StudentPetition/petition/commentAdd.do" method="post">
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