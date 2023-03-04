package chap07.business;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import chap07.dao.PizzaOrderDAO;
import chap07.dto.PizzaOrder;

@WebServlet("/order")
public class PizzaOrderInsertBusinessLogic implements BusinessLogic {

	PizzaOrderDAO orderDao;
	
	@Override
	public String process(HttpServletRequest req) {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("Class not found...");
		}
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "Insert Into pizza_orders Values(?,?,?,?,?,?) ";
		
		String name = req.getParameter("name");
		String address = req.getParameter("address");
		String crust = req.getParameter("crust");
		String size = req.getParameter("size");
		String[] toppings = req.getParameterValues("toppings");
		String topping = String.join("/", toppings);
		String instructions = req.getParameter("instructions");
		
		// 인터페이스를 통해 나중에 만들겠다고 약속만 해놓은 상태
		int row = orderDao.insert(
				new PizzaOrder(name, address, crust, size, topping, instructions));
		
		// row값에 따라 redirect를 어디로 할지 결정
		
		if (row == 1) {
			// 리다이렉트 경로에 ?를 추가해 원하는 정보를 보낼 수도 있다.
			return "redirect::/chap07/pizza/order_result?name=" + name;
		} else	{
			// 리다이렉트 경로에 ?를 추가해 원하는 정보를 보낼 수도 있다.
			return "redirect::/chap07/pizza/order_failed";
		}
		
//		try (Connection conn = DriverManager.getConnection(url, "hr", "1234");
//			PreparedStatement pstmt = conn.prepareStatement(sql);) {
//			
//			pstmt.setString(1, name);
//			pstmt.setString(2, address);
//			pstmt.setString(3, crust);
//			pstmt.setString(4, size);
//			pstmt.setString(5, topping);
//			pstmt.setString(6, instructions);
//			
//			int row = pstmt.executeUpdate();
//			
//			if(row > 0 ) {
//				System.out.println("주문 성공함");
//			} else {
//				System.out.println("주문 실패");
//			}
//			
////			req.setAttribute("success", row);
////			req.setAttribute("info", new PizzaOrder(name, address, crust, size, topping, instructions));
//						
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		
	}
}
