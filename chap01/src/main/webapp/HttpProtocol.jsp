<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>HttpProtocol.jsp</title>
</head>
<style>
li {
	line-height: 40px;
}

	#url-example {
		position: relative;
		border: solid 3px red;
		padding: 15px;
		word-spacing: -5px;
	}
	
	#protocol {
		border: solid 2px blue;
	}
	
	#protocol + div {
		position: absolute;
		color: blue;
		font-size: 0.8em;
	}
	
	#ip-address {
		border: solid 2px orange;
	}
	
	#ip-address + div {
		position: absolute;
		color: orange;
		font-size: 0.8em;
		left: 7em;
		top: -3px;
	}
	
	#port-number {
		border: solid 2px green;
	}	
	
	#port-number + div {
		position: absolute;
		color: green;
		font-size: 0.8em;
		left: 15em;
		word-spacing: 0;
	}
	
	#uri {
		border: solid 2px darkred;
	}
	
	#uri + div {
		position: absolute;
		color: darkred;
		font-size: 0.8em;
		top: -3px;
		left: 30em;
		word-spacing: 0;
	}
</style>
<body>

	<h3># 프로토콜 (Protocol)</h3>
	
	<!-- eclipse에서 Emmet은 Ctrl+E로 활용 -->
	<!-- 주석은 Ctrl + Shift + / -->
	
	<ul>
		<li>통신 규약</li>
		<li>컴퓨터들 간의 통신 절차를 규정하고 해당 절차에 이름을 붙이는 것</li>
		<li>ftp, http, https(http + 보안), telnet, smtp... 등등</li>
	</ul>
	
	<h3># HTTP 프로토콜의 작동 순서</h3>
	
	<ol>
		<li>
			사용자 (클라이언트, Client)가 웹 브라우저의 주소창에 보고 싶은 페이지의 URL을 입력한다.
			(링크를 클릭하는 것도 주소창에 URL을 입력하는 것과 같은 효과가 있다.)
		</li>
		<li>
			웹 브라우저는 URL에 포함된 호스트의 IP주소를 통해
			해당 웹 서버로 요청(Request)을 보낸다.
		</li>
			<!-- https://comic.naver.com/webtoon/detail?titleId=748105&no=198&weekday=sun
				 [프로토콜][domain(or IP)][                     URI                       ] -->
		<li>
			요청을 받은 웹 서버는 클라이언트가 보낸 URL을 보고
			알맞은 결과(웹 페이지, 이미지, css, js 등)를 응답(Response)한다.
		</li>
		<li>
			응답을 받은 클라이언트의 웹 브라우저가 해당 응답을 해석하여 클라이언트에게 보여준다.
		</li>	
	</ol>
	
	<h3># URL</h3>
	
	<div id="url-example">
		<span id="protocol">https://</span>
		<div>프로토콜</div>
		<span id="ip-address">comic.naver.com</span>
		<div>IP주소(DNS)</div>
		<span id="port-number">(:443)</span>
		<div>포트번호(생략 가능)</div>
		<span id="uri">/webtoon/detail?titleId=748105&no=198&weekday=sun</span>
		<div>URI(어떤 웹툰을 요청할 것인지)</div>
	</div>
	
	<h3># DNS (Domain Name Service)</h3>
	
	<ul>
		<li>IP주소 자리에 대신 쓸 수 있는 IP주소 보다 보기 좋은 이름</li>
		<li>IP주소는 외우기 힘들어서 외우기 쉬운 이름으로 치환해주는 서비스이다</li>
		<li>
			URL에 IP주소 대신 도메인 이름을 사용하면 근처의 DNS 서버에서 
			알맞은 IP주소를 찾은 후 해당 서버를 찾아가게 된다.
		</li>
	</ul>
	
	<h3># 포트 번호</h3>
	
	<ul>
		<li>해당 데이터가 어떤 프로그램의 데이터인지 구분하기 위한 번호</li>
		<li>0 ~ 65535번 까지 있다. (2byte)</li>
		<li>고정적으로 사용하는 잘 알려진 포트번호(well-known port)들이 있다.</li>
		<li>잘 알려진 포트번호들은 URL에서 생략이 가능하다 (80, 22, 23, 443, ...)</li>
	</ul>

</body>
</html>