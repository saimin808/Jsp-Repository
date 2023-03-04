package chap04.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap04.model.Member;

/**
 * Servlet implementation class MemoServlet
 */
@WebServlet("/memo/add")
public class TextServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Member mem = (Member)req.getSession().getAttribute("currMem");
		
		mem.putMemo(req.getParameter("memo"));
		
		resp.sendRedirect("/chap04/quiz/index_t.jsp");
		
	}

}
