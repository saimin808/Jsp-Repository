package chap04.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chap04.model.Student;

@WebServlet("/test2")
public class TestServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 현재 서버의 정보를 담고있는 객체를 불러옴
		ServletContext application = req.getServletContext();
		
		// application scope
		application.setAttribute("food", "Kimchi");
		
		// 요청 객체의 내부 정보(각 브라우저에 저장되어 있는 세션ID값)를 사용해
		// 알맞은 세션 객체를 불러옴
		HttpSession session = req.getSession();
		
		// session scope
		session.setAttribute("food", "Chocolate");
		
		// request scope
		req.setAttribute("food", "Bisket");
		req.setAttribute("info", new Student("Park", 50, 55, 65));
		
		// forward
		req
			.getRequestDispatcher("/attribute/view/test1.jsp")
			.forward(req, resp);
	}


}
