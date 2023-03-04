package chap06.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap06.process.GugudanWebProcess;
import chap06.process.HelloWebProcess;
import chap06.process.WebProcess;

// 디자인 패턴 (또는 프론트 컨트롤러) : 웹 개발을 정형화 시켜놓은 것
public class DispatcherServlet extends HttpServlet {
	
	private Map<String, WebProcess> processMapping = new HashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String contextPath = config.getServletContext().getContextPath(); 
		
		System.out.println(contextPath);
		processMapping.put(contextPath + "/hello", new HelloWebProcess());
		processMapping.put(contextPath + "/gugudan", new GugudanWebProcess());
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		// 1. 사용자가 요청을 한다.
		System.out.println("요청 URL : " + req.getRequestURL());
		System.out.println("요청 URI : " + req.getRequestURI());
		System.out.println("요청 방식 : " + req.getMethod());
		
		// 2. 해당 URI와 Method에 알맞은 처리를 진행한다.
		try {
			String nextPage = processMapping.get(req.getRequestURI()).process(req, resp);
			// 3. 처리 후 알맞은 view 페이지를 응답한다.
			
			// WEB-INF의 내부에는 클라이언트가 직접 접근하는 것은 금지되어 있지만
			// 개발자에 의한 포워드는 허용되어 있다. (리다이렉트는 금지)
			req.getRequestDispatcher("/WEB-INF/views/" + nextPage + ".jsp").forward(req, resp);
		} catch (NullPointerException e) {
			resp.sendRedirect(req.getContextPath() +"/hello");
		}
		
		
	}
}
