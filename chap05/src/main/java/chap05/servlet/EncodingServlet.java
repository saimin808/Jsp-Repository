package chap05.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EncodingServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		response.setCharacterEncoding("EUC-KR");
		
		System.out.println("오늘 뭐 먹을지 결정~!");
		
		// PrintWriter을 먼저 선언하면 뒤에 나오는 명령들은 characterEncoding이 선언이 안된 채로
		// 작업하기 때문에 글자가 깨지는것
		// (안 깨지게 만들려면 1. 앞에 response.setCharacterEncoding("")을 써준다.
		// 				   2. PrintWriter를 안쓰고 forward해서 jsp에서 출력작업을 한다.)
//		PrintWriter out = response.getWriter();
		
		/*
		 	GET방식 파라미터는 URL뒤에 데이터가 추가되어 도착한다.
		 	URL의 해석은 WAS(Apache-Tomcat)가 담당하기 때문에
		 	해당 값을 올바른 인코딩 타입으로 해석하기 위해서는 서버의 설정을 변경해야 한다.
		 	(server.xml에서 포트번호 수정한 곳에 URIEncoding="EUC-KR"을 추가)
		 */
		
		// samgim이랑 smoothie값 받아서 출력해보기
		
		String samgim = request.getParameter("samgim");
		String smoothie = request.getParameter("smoothie");
		
		request.getRequestDispatcher("/encodingResult.jsp").forward(request, response);
		
//		out.print("<h1>오늘의 점심 메뉴~!</h1>");
//		out.print("<br>");
//		out.print("<div>메인 : " + samgim + "</div>");
//		out.print("<div>음료 : " + smoothie + "</div>");
//		out.print("<h6>겁나 조촐하네...</h6>");
//		response.getWriter().append("<h1>" + samgim + "</h1>")
//							.append("<h1>" + smoothie + "</h1>");
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		/*
		 	POST 방식 파라미터 값은 request 객체 내부에 실려서 도착하므로
		 	request 객체의 인코딩 타입을 설정해주어야 한다.
		 */
		request.setCharacterEncoding("EUC-KR");
		
		String samgim = request.getParameter("samgim");
		String smoothie = request.getParameter("smoothie");
		
		System.out.println(samgim);
		System.out.println(smoothie);
		
		// JSP의 맨 위에 <% %> 안에 있는 설정들과 같은 역할을 하는 것
		response.setCharacterEncoding("EUC-KR"); // pageEncoding 역할
		// Chrome이라서 깨지지 않을 뿐 다른 브라우저에선 깨질 수 있다.
//		response.setContentType("EUC-KR"); // contentType 역할
		
		PrintWriter out = response.getWriter();
		
		out.append("<html><head></head><body>");
		
		out.append("삼각김밥: " + samgim + "<br>");
		out.append("스무디: " + smoothie);
		
		out.append("</body></html>");
	}
}
