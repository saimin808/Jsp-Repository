package chap07.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap07.business.BusinessLogic;
import chap07.business.HelloBusinessLogic;
import chap07.business.PizzaIndexBusinessLogic;
import chap07.business.PizzaOrderFormBusiniessLogic;
import chap07.business.PizzaOrderInsertBusinessLogic;
import chap07.business.PizzaOrderListBusinessLogic;
import chap07.business.PizzaOrderResultBusinessLogic;

// hello로 접속하는 사용자에게 hello.jsp 페이지를 보여주도록 만들어 보세요
public class DispatcherServlet extends HttpServlet {

	static private Map<String, BusinessLogic> businessMapping = new HashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("OracleDriver loaded...");
		} catch (ClassNotFoundException e) {
			System.out.println("Fail to load OracleDriver...");
		}
		
		businessMapping.put("/hello", new HelloBusinessLogic());
		businessMapping.put("/pizza", new PizzaIndexBusinessLogic());
		businessMapping.put("/pizza/order/list", new PizzaOrderListBusinessLogic());
		businessMapping.put("/pizza/order_result", new PizzaOrderResultBusinessLogic());
		businessMapping.put("/pizza/order/form", new PizzaOrderFormBusiniessLogic());
		businessMapping.put("/pizza/order/insert", new PizzaOrderInsertBusinessLogic());
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String contextPath = req.getContextPath();
		String uri = req.getRequestURI().substring(contextPath.length());
		
		System.out.println(req.getRequestURI());
		System.out.println("contextPath: " + contextPath);
		System.out.println("uri: " + uri);
		
		String nextView = businessMapping.get(uri).process(req);
		
		if (nextView.startsWith("redirect::")) {
			resp.sendRedirect(nextView.substring("redirect::".length()));
		} else {
			req.getRequestDispatcher("/WEB-INF/views/" + nextView + ".jsp").forward(req, resp);
		}
	}
	
	
}
