<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, chap04.model.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

	<%
		Object mem = application.getAttribute("members");
	
		Map<String, Member> map = null;
		
		if (mem != null) {
			map = (Map) mem;
		}
	%>

	<h5>현재 회원은 <%= map == null ? 0 : map.size() %>명 입니다.</h5>

	<%
		Object login = session.getAttribute("login");
	
		// 현재 로그인하지 않은 상태라면 ...
		if(login == null || !((Boolean)login)) {
	%>
	<form id="login-form" action="/chap04/memo/login" method="POST"></form>
	
	ID:<input name="id" type="text" form="login-form">
	PW:<input name="pw" type="text" form="login-form">
	
	<!-- button 태그에도 type="submit"이 가능하다.  -->
	<button type="submit" form="login-form">로그인</button>
	<button onclick="location.href='/chap04/memo/register'">회원가입</button>

	<%} else {%>
		<% Member currMem = (Member)session.getAttribute("currMem");
	%>
		'<%=currMem  %>' 님 환영합니다!
	 <form action="/chap04/memo/add" method="GET">
	 	<input type="text" name="memo"> <input type="submit" value="add">
	 </form>
	<%	for(String memo : currMem.getMemos()) { %>
			<div><%=memo %></div>
		<%}
	  } %>
<hr>

<h3># 요구사항</h3>
	
	<ul>
		<li>아이디와 비밀번호를 입력해 로그인을 할 수 있다.</li>
		<li>회원가입은 아이디와 비밀번호만 입력하면 완료된다 (아이디 중복은 체크)</li>
		<li>로그인 한 사람은 새로운 메모를 등록할 수 있다.</li>
		<li>로그인에 성공하면 예전에 등록했던 메모들이 어딘가에 보여야 한다.</li>
		<li>서버를 종료했을 때 모든 내용이 날아가도 상관은 없다.</li>
		<li>페이지 개수에 제한은 없다.</li>
	</ul>

</body>
</html>