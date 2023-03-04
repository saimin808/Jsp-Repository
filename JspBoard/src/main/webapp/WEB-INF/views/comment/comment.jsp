<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%-- <%@ page import="jspboard.dto.comment.Comment" %> --%>

<h3>댓글 ${comments_size}개</h3>
	<hr>
	<!-- c태그로 댓글이 존재할 경우 보여주기 -->
	<c:if test="${comments != null}">
		<c:forEach items="${comments}" var="comment">
			<div class="container">
				<h3>${comment.comment_writer}</h3>
				<div id="c_content">
					${comment.comment_content}
				</div>
				<br>
				<div id="c_write_date">
					${comment.creationDateTime}
					<form action="./modify_comment" method="GET" name="modify">
						<input type="hidden" name="comment_id" value="${comment.comment_id}" />
						<input type="hidden" name="msg" value="modify"/>
						<input type="submit" class="submitLink" value="수정" />
					</form>
					<form action="./delete_comment" method="GET" name="delete">
						<input type="hidden" name="comment_id" value="${comment.comment_id}" />
						<input type="hidden" name="msg" value="delete"/>
						<input type="submit" class="submitLink" value="삭제" />
					</form>
				</div>
			</div>
			<hr>
		</c:forEach>
	</c:if>
	
	<br>
			<div id="comment" class="container">
				<form action="./comment" method="POST" id="write">
					<input type="hidden" name="board_id" value="${board.board_id}" />
					<div id="c_info">
						아이디 : <input type="text" form="write" name="comment_writer"/>&nbsp;
						비밀번호 : <input type="password" form="write" name="comment_pw"/>
					</div>
					<br>
					<div id="c_content">
						<textarea rows="5" cols="65" form="write" name="comment_content"></textarea>
					</div>
					<input type="submit" form="write" value="작성"/>
				</form>
			</div>
			
			<script src="<%=request.getContextPath()%>/assets/script/write_form.js"></script>