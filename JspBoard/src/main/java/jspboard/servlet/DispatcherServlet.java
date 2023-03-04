package jspboard.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspboard.dto.Request;
import jspboard.service.DeleteService;
import jspboard.service.ListService;
import jspboard.service.MainService;
import jspboard.service.ModifyPageService;
import jspboard.service.ModifyService;
import jspboard.service.PasswordCheckService;
import jspboard.service.Service;
import jspboard.service.ShowBoardService;
import jspboard.service.WritePageService;
import jspboard.service.WriteService;
import jspboard.service.comment.C_PasswordCheckService;
import jspboard.service.comment.CommentFailService;
import jspboard.service.comment.DeleteCommentService;
import jspboard.service.comment.ModifyCommentPageService;
import jspboard.service.comment.ModifyCommentService;
import jspboard.service.comment.WriteCommentService;

public class DispatcherServlet extends HttpServlet {
	
	static private Map<Request, Service> uriMapping = new HashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("OracleDriver loaded...");
		} catch (ClassNotFoundException e) {
			System.out.println("Fail to load OracleDriver...");
		}
		
		uriMapping.put(new Request("/", "GET"), new MainService());
		uriMapping.put(new Request("/list", "GET"), new ListService());
		uriMapping.put(new Request("/show", "GET"), new ShowBoardService());
		uriMapping.put(new Request("/write", "GET"), new WritePageService());
		uriMapping.put(new Request("/write/write","POST"), new WriteService());
		uriMapping.put(new Request("/pw_check", "GET"), new PasswordCheckService());
		uriMapping.put(new Request("/modify", "POST"), new ModifyPageService());
		uriMapping.put(new Request("/delete", "POST"), new DeleteService());
		uriMapping.put(new Request("/modify/modify", "POST"), new ModifyService());
		uriMapping.put(new Request("/comment", "POST"), new WriteCommentService());
		uriMapping.put(new Request("/comment/fail", "GET"), new CommentFailService());
		uriMapping.put(new Request("/modify_comment","GET"), new C_PasswordCheckService());
		uriMapping.put(new Request("/modify_comment/pw_checked","POST"), new ModifyCommentPageService());
		uriMapping.put(new Request("/modify_comment/do","POST"), new ModifyCommentService());
		uriMapping.put(new Request("/delete_comment", "GET"), new C_PasswordCheckService());
		uriMapping.put(new Request("/delete_comment/do", "POST"), new DeleteCommentService());
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String contextPath = req.getContextPath();
		String uri = req.getRequestURI().substring(contextPath.length());
		String method = req.getMethod();
		
		System.out.println("uri: " + uri);
		System.out.println("method: " + method);
		
		String view = uriMapping.get(new Request(uri, method)).process(req);
		
		if (view.startsWith("redirect::")) {
			resp.sendRedirect(view.substring("redirect::".length()));
		} else {
			req.getRequestDispatcher("/WEB-INF/views/" + view + ".jsp").forward(req, resp);
		}
	}
}
