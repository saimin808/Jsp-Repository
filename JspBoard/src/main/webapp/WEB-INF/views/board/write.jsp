<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Write</title>
</head>
<body>

	<ul>
		<li>글 번호: 사용자가 적는게 아님 (시퀀스가 있음)</li>
		<li>작성자: 사용자가 적을 수 있음 (로그인 된 사용자는 저절로 채워짐)</li>
		<li>비밀번호: 사용자가 설정 할 수 있음 (로그인 된 사용자는 비밀번호 적는라인 안보임)</li>
		<li>글 제목: 사용자가 쓴다</li>
		<li>글 내용: 사용자가 쓴다</li>
		<li>글 작성 시간: 사용자가 적는게 아님 (DB의 sysdate를 사용함)</li>
		<li>조회 수 : 사용가 적는게 아님</li>
		<li>추천 수 : x</li>
		<li>비추 수 : x</li>
	</ul>

	<h3>게시글 작성</h3>

	<div id="container">
		<form action="./write/write" method="POST" id="write">
			<div id="board_id">
				<b>글 번호: <input type="text" name="id" value="${board_id}" readonly/></b>
			</div>
			<div id="title">
				<!-- 글 제목: 사용자가 쓴다 -->
				<b>제목:</b> <input type="text" name="title" />
			</div>
			<div id="type">
				<b>주제:</b> <select name="type">
					<option value="자유글">자유글</option>
					<option value="공지사항">공지사항</option>
					<option value="가입인사">가입인사</option>
				</select>
			</div>
			<div id="writer">
				<!-- 작성자: 사용자가 적을 수 있음 (로그인 된 사용자는 저절로 채워짐) -->
				<b>작성자:</b> <input type="text" name="writer"/>
			</div>
			<div id="content">
				<!-- 글 내용: 사용자가 쓴다 -->
				<textarea rows="30" cols="100" name="content"></textarea>
			</div>
			<div id="pw">
				<!-- 비밀번호: 사용자가 설정 할 수 있음 (로그인 된 사용자는 비밀번호 적는라인 안보임) -->
				<b>비밀번호:</b> <input type="password" name="pw" />
			</div>
			<input type="submit" value="쓰기">
		</form>
	</div>
	
	<script src="<%=request.getContextPath()%>/assets/script/write_form.js"></script>
</body>
</html>