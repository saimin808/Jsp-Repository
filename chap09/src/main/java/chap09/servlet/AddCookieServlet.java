package chap09.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cookie/add")
public class AddCookieServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 새 쿠키 생성하기
		Cookie cookie = new Cookie("animal", "lion");
		Cookie cookie2 = new Cookie("food", "pizza");
		Cookie cookie3 = new Cookie("save_query", "save");
		Cookie cookie4 = new Cookie("favorite", "135");
		
		cookie4.setPath(req.getContextPath() + "/cartoon");
		cookie4.setMaxAge(60 * 60 * 24 * 365); // keep 365 days
		
		cookie3.setPath(req.getContextPath() + "/search");
		cookie3.setMaxAge(-1); // session = not stored
		
		resp.addCookie(cookie3);
		resp.addCookie(cookie4);
		
		// 쿠키의 옵션값 설정하기
		
		// 쿠키의 경로 (쿠키가 적용되는 uri를 설정)
		cookie.setPath(req.getContextPath());
		// 쿠키의 수명 설정 (설정하지 않으면 세션 만료시까지 유지됨)
		cookie.setMaxAge(30);
		// 쿠키값 설정
		cookie.setValue("tiger");
		
		// 사용자의 웹 브라우저에 쿠키를 응답하기 위해 적재
		resp.addCookie(cookie);
		resp.addCookie(cookie2);
		
		// JSP위에 있는 <%@ contentType="" %>을 여기서 수동으로 진행하는 것
		resp.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html");
		
		// JSP 밑부분의 HTML부분
		resp.getWriter().append("<h3>쿠키가 생성되었습니다. F12를 눌러 확인</h3>");
	}
}
