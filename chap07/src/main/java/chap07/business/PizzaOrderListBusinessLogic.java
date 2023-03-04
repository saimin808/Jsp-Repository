package chap07.business;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import chap07.dao.PizzaOrderDAO;
import chap07.dao.PizzaOrderDAO_Impl;
import chap07.dto.PizzaOrder;

public class PizzaOrderListBusinessLogic implements BusinessLogic {

	PizzaOrderDAO orderDao = new PizzaOrderDAO_Impl();
	
	@Override
	public String process(HttpServletRequest request) {
		// # DAO (Data Access Object)
		// 수 많은 비즈니스 로직들은 DB에 똑같은 작업들을 많이 진행하게 된다.
		// 그렇기 때문에 비즈니스 로직 내부에서도 DB관련 작업들(DAO)을 따로 묶어 정리해두면
		// 작업량을 많이 줄일 수 있다. 
		String sql = "SELECT * FROM pizza_orders";
		
		List<PizzaOrder> pastOrders = orderDao.selectAll(sql);
		
		request.setAttribute("pastOrders", pastOrders);
		
//		try (Connection conn = DriverManager.getConnection(url, "hr", "1234");
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			ResultSet rs = pstmt.executeQuery();) {
//			
//			List<String> pastOrders = new ArrayList<>();
//			
//			int a = 1;
//			while (rs.next()) {
//				pastOrders.add(String.format("<tr><td>%d. %s</td><td>%s</td><td>%s</td><td>%s</td></tr>",
//						a++,
//						rs.getString("name"),
//						rs.getString("toppings"),
//						rs.getString("crust"),
//						rs.getString("pizza_size")));
//			}
//			
//			request.setAttribute("pastOrders", pastOrders);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		
		return "pizza/order_list";
	}
	
}
