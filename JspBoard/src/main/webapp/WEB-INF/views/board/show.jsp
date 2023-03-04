<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물</title>
<style>
form {
	display: inline;
}

input.submitLink {
	background-color: transparent;
    text-decoration: underline;
    color: blue;
    border: none;
    cursor: pointer;
}
</style>
</head>
<body>

	<h3>게시물 보기</h3>

	<div id="board" class="container">
			<div id="board_id">
				<b>No:</b> ${board.board_id}
			</div>
			<div id="title">
				<b>제목:</b> ${board.title}
			</div>
			<div id="type">
				<b>주제:</b> ${board.type}
			</div>
			<div id="writer">
				<b>작성자:</b> ${board.writer}
			</div>
			<div id="content">
				<textarea cols="50" rows="10" readonly>${board.content}</textarea>
			</div>
			<div id="date">
				<b>쓴 날짜:</b> ${board.write_date}
			</div>
			<div id="views">
				<b>조회수:</b> ${board.view}
			</div>
			<form method="POST" name="form">
				<div id="recommend">
					<b>추천:</b> ${board.recommand}
					<button type="submit" onclick="javascript: form.action='./recommend'">추천</button>
				</div>
				<div id="not_recommand">
					<b>비추천:</b> ${board.not_recommand}
					<button type="submit" onclick="javascript: form.action='./not_recommend'">비추천</button>
				</div>
			</form>
		<div id="buttons">
			<button onclick="location.href='./list?page=1'">글 목록</button>
			<form action="./pw_check" method="GET" id="modify">
				<input type="hidden" form="modify" value="${board.board_id}" name="board_id" />
				<input type="hidden" form="modify" value="modify" name="msg"/>
				<input type="submit" form="modify" value="수정"/>
			</form>
			<form action="./pw_check" method="GET" id="delete">
				<input type="hidden" form="delete" value="${board.board_id}" name="board_id" />
				<input type="hidden" form="delete" value="delete" name="msg"/>
				<input type="submit" form="delete" value="삭제"/>
			</form>
		</div>
	</div>
	
	<br>
	
	<jsp:include page="../comment/comment.jsp"/>
	
	<script>
		if("<%=request.getParameter("delete")%>" == 'complete') {
			alert("댓글 삭제 성공");	
		} else if("<%=request.getParameter("delete")%>" == 'fail') {
			alert("댓글 삭제 실패");
		} else if("<%=request.getParameter("modify")%>" == 'complete') {
			alert("댓글 수정 완료");
		} else if ("<%=request.getParameter("modify")%>" == 'fail') {
			alert("댓글 수정 실패");
		}
	</script>
</body>
</html>