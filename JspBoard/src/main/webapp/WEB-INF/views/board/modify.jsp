<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>modify</title>
</head>
<body>

	<h3>글 수정</h3>
	
	<div id="container">
		<form action="./modify/modify" method="POST" id="modify">
			<div id="board_id">
				<b>글 번호: <input type="text" name="board_id" value="${board.board_id}" readonly/></b>
			</div>
			<div id="title">
				<!-- 글 제목: 사용자가 쓴다 -->
				<b>제목:</b> <input type="text" name="title" value="${board.title}" />
			</div>
			<div id="type">
				<b>주제:</b> <select name="type" onselect="${board.type}">
					<option value="자유글">자유글</option>
					<option value="공지사항">공지사항</option>
					<option value="가입인사">가입인사</option>
				</select>
			</div>
			<div id="writer">
				<!-- 작성자: 사용자가 적을 수 있음 (로그인 된 사용자는 저절로 채워짐) -->
				<b>작성자:</b> <input type="text" name="writer" value="${board.writer}"/>
			</div>
			<div id="content">
				<!-- 글 내용: 사용자가 쓴다 -->
				<textarea rows="30" cols="100" name="content">${board.content}</textarea>
			</div>
			<div id="pw">
				<!-- 비밀번호: 사용자가 설정 할 수 있음 (로그인 된 사용자는 비밀번호 적는라인 안보임) -->
				<b>비밀번호:</b> <input type="password" name="pw"/>
			</div>
			<div id="write_date">
				<b>작성일:</b> <input type="text" name="write_date" value="${board.write_date}" readonly/>
			</div>
			<input type="submit" value="수정하기">
		</form>
	</div>

	<script src="<%=request.getContextPath()%>/assets/script/modify_form.js"></script>
</body>
</html>