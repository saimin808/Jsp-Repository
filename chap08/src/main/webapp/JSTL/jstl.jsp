<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%
	// ※ 비즈니스 로직에서 어트리뷰트에 추가한 후 포워드로 받았다고 가정한다.
	String[] animals = {"cat", "dog", "monkey", "tiger", "lion", "rabbit"};

	List<String> fruits = new ArrayList<>();
	
	pageContext.setAttribute("animals", animals);
	pageContext.setAttribute("fruits", fruits);
	
	fruits.add("apple");
	fruits.add("banana");
	fruits.add("orange");
	fruits.add("kiwi");
	fruits.add("mango");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Jsp Standard Tag Library</title>
</head>
<body>

	<h3>JSTL (Jsp Standard Tag Library)</h3>
	
	<ul>
		<li>JSP에서 Java 코드를 사용하면 코드가 너무 지저분해져서 등장한 라이브러리</li>
		<li>자바에서 자주 쓰는 기능들을 태그 모양으로 사용할 수 있도록 만들어 둠.</li>
		<li>자바의 모든 기능을 사용할 수 있는 것은 아니지만 뷰를 만들기에는 충분한 기능들이다.</li>
		<li>JSTL 특유의 import문을 맨 위에 추가한 후 사용해야 한다.</li>
	</ul>
	
	<ul> 
		<c:forEach items="${animals }" var="animal">
			<li>${animal }</li>
		</c:forEach>
	</ul>
	
	<h3># JSTL Core</h3>
	
		<p>자바 주요 문법들이 포함되어 있는 커스텀 태그 라이브러리</p>
	<dl>
		<dt>&lt;c:set&gt;</dt>
		<dd>setAttribute를 편리하게 수행할 수 있다.</dd>
		<dt>&lt;c:if&gt;</dt>
		<dd>if문을 편리하게 수행할 수 있지만, else if와 else는 없다</dd>
		<dt>&lt;c:choose&gt;, &lt;c:when&gt;, &lt;c:otherwise&gt;</dt>
		<dd>if, else if, else 처럼 사용할 수 있는 조건문</dd>
		<dt>&lt;c:forEach&gt;</dt>
		<dd>숫자를 이용한 반복문과
			배열, 리스트등 순차적으로 꺼낼 수 있는(iterable)
			객체를 통한 반복문을 사용할 수 있다</dd>
		<dt>&lt;c:forTokens&gt;</dt>
		<dd>문자열을 원하는 기준으로 자르면서 자른 문자열로 반복</dd>
		<dt>&lt;c:url%gt;</dt>
		<dd>복잡한 url을 좀 더 편리하게 생성할 수 있는 기능
			(ContextPath를 자동으로 추가해준다)</dd>
	</dl>
	
	<hr>
	
	<!-- c:set을 이용해 원하는 어트리뷰트를 추가 -->
	<c:set var="waffle" value="strawberry" scope="page" />
	<c:set var="waffle" value="blueberry" scope="request" />
	<c:set var="waffle" value="vanila" scope="session" />
	<c:set var="waffle" value="choco" scope="application" />
	
	${waffle }
	
	<h3># c:if</h3>
	
	<c:if test="${requestScope.waffle eq 'strawberry'}">
		<h3>waffle은 strawberry입니다.</h3>
	</c:if>
	<c:if test="${requestScope.waffle eq 'blueberry'}">
		<h3>waffle은 blueberry입니다.</h3>
	</c:if>
	
	<c:set var="score" value="99" />
	
	<h3># c:choose</h3>
	
	<c:choose>
		<c:when test="${score > 100 || score < 0}">
			<h3>F등급입니다.</h3>
		</c:when>
		<c:when test="${score >= 90}">
			<h3>A등급입니다.</h3>
		</c:when>
		<c:when test="${score >= 80}">
			<h3>B등급입니다.</h3>
		</c:when>
		<c:when test="${score >= 70}">
			<h3>C등급입니다.</h3>
		</c:when>
		<c:when test="${score >= 60}">
			<h3>D등급입니다.</h3>
		</c:when>
		<c:otherwise>
			<h3>F등급입니다.</h3>
		</c:otherwise>
	</c:choose>
	
	<h3># c:forEach</h3>
	
	<h4>1. 원하는 숫자로 반복 돌리는 버전</h4>
	
	<ul>
		<c:forEach begin="0" end="10" var="i">
			<li id="list-item${i}">${i}번째 반복입니다.</li>
		</c:forEach>
	</ul>
	
	<h4>2. Iterable로 반복 돌리는 버전 (Array, List)</h4>
	
	<ul>
		<c:forEach items="${animals}" var="animal">
			<li id="${animal}">${animal}</li>
		</c:forEach>
	</ul>
	
	<ul>
		<c:forEach items="${fruits}" var="f">
			<li id="${f}">${f}</li>
		</c:forEach>
	</ul>
	
	<h3># c:forTokens</h3>
	
	<c:set var="portals" value="naver/daum/goolge/yahoo/nate/paran/hanmir"/>
	
	<c:forTokens items="${portals}" delims="/" var="portal">
		<div id="${portal}">www.${portal}${portal eq 'daum' ? '.net' : '.com'}</div>
	</c:forTokens>
	
	<h3># c:url</h3>
	
	<ul>
		<li>기본 : <c:url value="/pizza/order"/></li>
		<li>어트리뷰트에 선언 : <c:url value="/pizza/list" var="to_list" />${to_list}</li>
		<li><a href="${to_list}">주문하러가기</a></li>
		<li>파라미터 추가 :
			<!-- 상대 경로에는 contextPath를 추가하지 않는다. -->
			<c:url value="./hello">
				<c:param name="first_name" value="Smith"/>
				<c:param name="last_name" value="King"/>
				<c:param name="age" value="45"/>
			</c:url></li>
	</ul>
	
</body>
</html>