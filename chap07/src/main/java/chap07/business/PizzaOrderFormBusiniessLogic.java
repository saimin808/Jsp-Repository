package chap07.business;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import chap07.dto.PizzaOrder;

public class PizzaOrderFormBusiniessLogic implements BusinessLogic {

	@Override
	public String process(HttpServletRequest req) {
		
		// 피자를 주문하는 폼으로 이동할 때 필요한 정보들을 조회할 수 잇음
		
		/*
		 	ex: DB로부터 로그인 된 사용자의 이름, 주소, 전화번호 등을 미리 꺼낼 수 있음
		 */
		
		// 만약 조회 했다면 request의 어트리뷰트에 실어서 view 페이지로 이동할 수 있음
		
		// 포워드 할 때는 webapp 밑의 경로를 사용하기 때문에 contextPath가 필요 없다.
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("Class not found...");
		}
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		try (Connection conn = DriverManager.getConnection(url, "hr", "1234");
			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM pizza_orders");
			ResultSet rs = pstmt.executeQuery();) {
			
			List<PizzaOrder> pizza_orders = new ArrayList<>();
			
			while(rs.next()) {
				String name = rs.getString("name");
				String address = rs.getString("address");
				String crust = rs.getString("crust");
				String size = rs.getString("pizza_size");
				String toppings = rs.getString("toppings");
				String instructions = rs.getString("instructions");
				
				PizzaOrder order = new PizzaOrder(name, address, crust, size, toppings, instructions);
				pizza_orders.add(order);
			}
			// DB에서 꺼낸 데이터를 잘 정리하여 어트리뷰트에 추가
			req.setAttribute("pizza_orders", pizza_orders);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "pizza/order_form";
	}
}
