<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:url value="/assets/css/button.css" var="btnCSS"/>
<meta charset="EUC-KR">
<title>Board</title>
<link rel="stylesheet" href="${btnCSS}"/>
</head>
<body>

	<h1>게시판</h1>

	<table id="board" border='3'>
		<tr>
			<th>No</th>
			<th>제목</th>
			<th>종류</th>
			<th>글쓴이</th>
			<th>내용</th>
			<th>작성일</th>
			<th>View</th>
			<th>추천</th>
			<th>비추천</th>
		</tr>
			<!-- c:forEach 사용 -->
			<c:forEach items="${boards}" var="board">
				<tr>
					<td>
						${board.board_id}
					</td>
					<td>
						<a>${board.title}</a>
					</td>
					<td>
						${board.type}
					</td>
					<td>
						<a>${board.writer}</a>
					</td>
					<td>
						<a href="./show?board_id=${board.board_id}">${board.content}</a>
					</td>
					<td>
						${board.creationDateTime} <!-- 오늘건 시간으로.. 어제 이전은 날짜로 -->
					</td>
					<td>
						${board.view}
					</td>
					<td>
						${board.recommand}
					</td>
					<td>
						${board.not_recommand}
					</td>					
				</tr>
			</c:forEach>
	</table>
	
	<div><a href="">&lt;&nbsp;</a>
		<c:forEach begin="${pagination_start}" end="${pagination_end}" var="i">
			<a href="./list?page=${i}">${i}</a>
		</c:forEach>
	<a href="">&nbsp;&gt;</a>&nbsp;<a class="btn" href="./write">글쓰기</a></div>
	
	<script>
		if("<%=request.getParameter("delete")%>" == 'complete') {
			alert("게시글 삭제 성공");	
		} else if("<%=request.getParameter("delete")%>" == 'fail') {
			alert("게시글 삭제 실패");
		} else if("<%=request.getParameter("modify")%>" == 'complete') {
			alert("게시글 수정 완료");
		} else if ("<%=request.getParameter("modify")%>" == 'fail') {
			alert("게시글 수정 실패");
		}
	</script>
</body>
</html>