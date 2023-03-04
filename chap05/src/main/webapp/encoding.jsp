<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>인코딩 설정</title>
</head>
<body>

	<h3># JSP의 여러가지 charset 설정</h3>
	
	<dl>
		<dt>1. meta 태그의 charset</dt> <!-- 4 -->
		<dd>클라이언트의 웹 브라우저가 해당 페이지를 해석할 때 사용할 charset</dd>
		<dt>2. contentType의 charset</dt> <!-- 3 -->
		<dd>이 서블릿에서 생성한 응답 결과물의 charset</dd>
		<dt>3. pageEncoding의 charset</dt> <!-- 2 -->
		<dd>.jsp를 .java로 1차 번역할 때의 charset</dd>
		<dt>4. 현재 이 페이지에서 Eclipse가 사용하고 있는 charset</dt> <!-- 1 -->
		<dd>
			우리가 하드 디스크에 저장할 때(Ctrl + S를 누를 때) 사용할 인코딩 타입 <br>
			이 파일 우클릭 후 Properties > Resource > Text file Encoding에서 확인 가능
		</dd>
	</dl>
	
	<h3>#서블릿으로 한글 데이터 보내기 (GET 방식)</h3>
	
	<p>
		GET방식 파라미터 값은 URI에서 해석되기 때문에 서버 설정을 바꿔줘야 함
	</p>
	
	<form action="/chap05/encodingTest" method="GET">
		<input type="hidden" value="참치마요" name="samgim"/>
		<input type="hidden" value="블루베리스무디" name="smoothie"/>
		<input type="submit" value="보내기"/>
	</form>
	
	<h3># 서블릿으로 한글 데이터 보내기 (POST 방식)</h3>
	
	<p>
		POST방식 파라미터 값은 요청 객체 내부에 실려가므로
		요청 객체의 인코딩 타입을 설정해야 한다.
	</p>
	
	<form action="/chap05/encodingTest" method="POST">
		<input type="hidden" value="고추장불고기" name="samgim"/>
		<input type="hidden" value="딸기스무디" name="smoothie"/>
		<input type="submit" value="보내기"/>
	</form>
	
	<!-- web.xml의 설정을 통해 /encodingTest로 보내는 요청을 모두
		EncodingServlet으로 매핑시켜보세요 -->

</body>
</html>