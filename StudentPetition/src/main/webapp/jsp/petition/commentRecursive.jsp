<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:if test="${not empty comments}">
    <c:forEach var="comment" items="${comments}">
        <div class="reply">
            <p>
                <strong>${comment.userId}</strong>: ${comment.content}
            </p>
            <p>작성일: ${comment.createdAt}</p>
            <button onclick="showReplyForm(${comment.commentId})">대댓글 작성</button>
            <form id="replyForm_${comment.commentId}" style="display: none;" action="/addReplyComment.do" method="post">
                <input type="hidden" name="parentCommentId" value="${comment.commentId}">
                <textarea name="content" placeholder="대댓글을 입력하세요"></textarea>
                <button type="submit">등록</button>
            </form>

            <!-- 재귀 호출 -->
            <c:if test="${not empty comment.replies}">
                <div class="replies" style="margin-left: 20px; border-left: 1px solid #ddd; padding-left: 10px;">
                    <jsp:include page="commentRecursive.jsp">
                        <jsp:param name="comments" value="${comment.replies}" />
                    </jsp:include>
                </div>
            </c:if>
        </div>
    </c:forEach>
</c:if>
