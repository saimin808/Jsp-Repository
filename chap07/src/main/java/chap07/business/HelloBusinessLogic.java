package chap07.business;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class HelloBusinessLogic implements BusinessLogic {

	@Override
	public String process(HttpServletRequest request) {
		// DB에서 employees를 꺼내오기
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("Class not found...");
		}
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		try (Connection conn = DriverManager.getConnection(url, "hr", "1234");
			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM employees");
			ResultSet rs = pstmt.executeQuery();) {
			
			List<String> employees = new ArrayList<>();
			
			while(rs.next()) {
				employees.add(
						String.format("<tr><th>%s</th><td>%d</td></tr>",
										rs.getString("first_name"), rs.getInt("salary")));
			}
			// DB에서 꺼낸 데이터를 잘 정리하여 어트리뷰트에 추가
			request.setAttribute("employees", employees);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("name", "Sungmin");
		
		return "/hello";
	}
}
