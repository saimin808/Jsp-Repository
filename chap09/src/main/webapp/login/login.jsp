<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!
	public String getCookieValue(Cookie[] cookies, String cookieName) { 
    	for (Cookie cookie : cookies) { 
         if(cookie.getName().equals(cookieName)){ 
              return cookie.getValue(); 
         	}
    	}
    	return ""; 
	}
%>

<%
	Cookie[] cookies = request.getCookies();
	String user_id = getCookieValue(cookies, "user_id"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.login == null}">
			<form action="./submit" method="POST">
				아이디 <input type="text" name="id" value="<%=user_id%>"/> <br>
				비밀번호 <input type="password" name="pw"/> <br>
				<input type="submit" value="로그인"/>
				아이디 기억하기 <input type="checkbox" name="remember" value="rem"/>
			</form>
		</c:when>
		<c:otherwise>
			<h3>이미 로그인 되었습니다.</h3>
		</c:otherwise>
	</c:choose>
	
	<hr>
	
	<ul>
		<li>로그인을 시도하면 로그인 결과 페이지로 넘어간다.</li>
		<li>
			로그인에 성공한 경우,
			세션을 끊기 전까지는 로그인 페이지가 이미 로그인 되었습니다. 라고 보여야 한다.
		</li>
		<li>
			아이디 기억하기를 체크한 상태로
			해당 아이디로 로그인을 성공한 경우
			세션 종료 후 다음에 로그인 페이지에 다시 들어와도 30일간은
			아이디가 저절로 입력 되어있도록 만들어보세요
		</li>
		<li>DB 사용할 것 (회원가입은 insert로 할 것)</li>
	</ul>
	
</body>
</html>