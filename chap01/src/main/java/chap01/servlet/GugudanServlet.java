package chap01.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/gugudan")
public class GugudanServlet extends HttpServlet {
	/*
	 	/chap01/gugudan 으로 접속하는 사용자들에게
	 	멋있는 구구단 페이지를 응답하는 서블릿을 만들어보세요
	 */
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//HttpServletRequest : 사용자의 요청 정보가 담겨있는 객체
		//HttpServletRespone : 모든 처리가 끝난 후 응답 해야하는 객체
		
		// JSP의 <%  %> 부분
		PrintWriter out = resp.getWriter();
		
		// JSP가 1차로 서블릿 형태로 변환된다.
		out.print("<html>");
		out.print("<head>");		
		out.print("</head>");
		out.print("<style>");
		
		out.print(" #gugudan-container {\r\n"
				+ "            display: grid;\r\n"
				+ "            width: 50%;\r\n"
				+ "            border: 1px solid black;\r\n"
				+ "            grid-template-columns: 1fr 1fr;\r\n"
				+ "            grid-template-rows: 1fr 1fr 1fr 1fr;\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "        #gugudan-container > div , .dan {\r\n"
				+ "            border: solid 3px black;\r\n"
				+ "            text-align: center;\r\n"
				+ "            margin: 5px;\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "        .gop{\r\n"
				+ "            text-align: center"
				+ "        }\r\n"
				+ "        #dan2 {\r\n"
				+ "            background-color: red;\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "        #dan3 {\r\n"
				+ "            background-color: orange;\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "        #dan4 {\r\n"
				+ "            background-color: yellow;\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "        #dan5 {\r\n"
				+ "            background-color: green;\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "        #dan6 {\r\n"
				+ "            background-color: blue;\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "        #dan7 {\r\n"
				+ "            background-color: navy;\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "        #dan8 {\r\n"
				+ "            background-color: purple;\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "        #dan9 {\r\n"
				+ "            background-color: darkgrey;\r\n"
				+ "        }");
		
		out.print("</style>");
		out.print("<body>");
		out.print("<h1>Gugudan</h1>");
		out.print("<div id='gugudan-container'>");
		for(int dan = 2; dan <= 9; dan++) {
			out.print("<div><div class='dan' id=dan" + dan + ">" + dan + "D</div>");
			for(int gop = 1; gop <= 9; gop++) {
				int answer = dan * gop;
				out.print("<div class='gop'>" + dan + " × " + gop + " = " + answer + "</div>");
			}
			out.print("</div>");
		}
		out.print("</div>");
		out.print("</script>");
		out.print("</body>");
		out.print("</html>");
		
		
	}

}
