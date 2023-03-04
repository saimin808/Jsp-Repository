<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>댓글 수정</title>
</head>
<body>

	<h3>댓글 수정</h3>

	<div id="comment" class="container">
		<form action="./do" method="POST" id="modify">
			<input type="hidden" name="comment_id" value="${comment.comment_id}" />
			<input type="hidden" name="board_id" value="${comment.board_id}" />
			<div id="comment_info">
				아이디 : <input type="text" name="comment_writer" value="${comment.comment_writer}" />&nbsp;
				비밀번호 : <input type="password" name="comment_pw" />
			</div>
			<br>
			<div id="comment_content">
				<textarea rows="5" cols="65" name="comment_content">${comment.comment_content}</textarea>
			</div>
			<input type="submit" value="수정"/>
		</form>
	</div>

	<script src="<%=request.getContextPath()%>/assets/script/modify_form.js"></script>
</body>
</html>