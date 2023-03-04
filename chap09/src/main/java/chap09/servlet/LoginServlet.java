package chap09.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap09.dao.LoginDAO;
import chap09.dto.Account;

@WebServlet("/login/submit")
public class LoginServlet extends HttpServlet {

	@Override
	public void init(ServletConfig config) throws ServletException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("OracleDriver loaded...");
		} catch (ClassNotFoundException e) {
			System.out.println("Fail to load OracleDriver...");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String remember_id = req.getParameter("remember");
		
			Account account = LoginDAO.login(id, pw);
			if(account != null) {
				if("rem".equals(remember_id)) {
					Cookie id_cookie = new Cookie("user_id", account.getId());
					id_cookie.setPath(req.getContextPath() + "/login");
					id_cookie.setMaxAge(60 * 60 * 24 * 30); //30days
					resp.addCookie(id_cookie);
				}
				req.getSession().setAttribute("login", "yes");
			} else {
				System.out.println("로그인 실패입니다. (서블릿)");
			}
			resp.sendRedirect(req.getContextPath() + "/login/login_result.jsp");
	}
}
