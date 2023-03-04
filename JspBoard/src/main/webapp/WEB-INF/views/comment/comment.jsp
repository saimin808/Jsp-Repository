<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%-- <%@ page import="jspboard.dto.comment.Comment" %> --%>

<h3>��� ${comments_size}��</h3>
	<hr>
	<!-- c�±׷� ����� ������ ��� �����ֱ� -->
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
						<input type="submit" class="submitLink" value="����" />
					</form>
					<form action="./delete_comment" method="GET" name="delete">
						<input type="hidden" name="comment_id" value="${comment.comment_id}" />
						<input type="hidden" name="msg" value="delete"/>
						<input type="submit" class="submitLink" value="����" />
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
						���̵� : <input type="text" form="write" name="comment_writer"/>&nbsp;
						��й�ȣ : <input type="password" form="write" name="comment_pw"/>
					</div>
					<br>
					<div id="c_content">
						<textarea rows="5" cols="65" form="write" name="comment_content"></textarea>
					</div>
					<input type="submit" form="write" value="�ۼ�"/>
				</form>
			</div>
			
			<script src="<%=request.getContextPath()%>/assets/script/write_form.js"></script>