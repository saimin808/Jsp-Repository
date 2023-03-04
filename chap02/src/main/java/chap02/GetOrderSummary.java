package chap02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/summary")
public class GetOrderSummary extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("새로운 주문이 들어왔습니다!");
		
		// delivery information
		String name = req.getParameter("name");
		String street_address = req.getParameter("street_address");
		String city = req.getParameter("city");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		
		// order
		String crust = req.getParameter("crust");
		String size = req.getParameter("size");
		// 해당 input에 값이 여러개인 경우 (checkbox 등) request.getParameterValues()
		String[] toppings = req.getParameterValues("toppings");
		String instructions = req.getParameter("instructions");
		
		PrintWriter out = resp.getWriter();
		
		out.print("<div id=\"order_summary\">\r\n"
				+ "	<div class=\"header\">\r\n"
				+ "	<h1>Order Summary</h1>\r\n"
				+ "	</div>");
		out.print("<div id=\"deliver_to\">\n");
		out.print("<h3>Deliver to</h3>\n");
		out.print("<div id=\"address\">\n");
		out.print("<div>"+ name +"</div>\n");
		out.print("<div>" + street_address + "</div>\n");
		out.print("<div>" + city + "</div>\n");
		out.print("<div>" + email + "</div>\n");
		out.print("<div>" + phone + "</div>\n");
		out.print("</div>\n");
		out.print("</div>\n");
		
		out.print("<div id=\"order\">\n");
		out.print("<h3>Order</h3>\n");
		out.print("<div id=\"order_information\">\n");
		out.print("<div><b>Crust</b>: "+ crust +"</div>\n");
		out.print("<div><b>Size</b>: " + size + "</div>\n");
		out.print("<div><b>Topping(s)</b>: <br>");
		if(toppings != null) {
			for(int i = 0; i < toppings.length; i++) {
				out.print("<span>" + toppings[i] + "</span><br>");
			}
		}
		out.print("</div>\n");
		out.print("<div><b>Instructions</b>: " + instructions + "</div>\n");		
		out.print("</div>\n");
		out.print("</div>\n");
		out.print("</div>");
	}
}
