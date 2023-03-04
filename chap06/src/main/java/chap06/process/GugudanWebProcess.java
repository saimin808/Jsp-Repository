package chap06.process;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GugudanWebProcess implements WebProcess {

	private String getRandomGugudan() {
		int dan = (int)(Math.random() * 7 + 2);
		
		String gugudan = "<h1>" + dan + "단</h1>";
		for(int i = 1; i <= 9; i++) {
			gugudan += "<div id='gop'>" + dan + " × " + i + " = " + dan*i + "</div>\n";
		}
		
		return gugudan;
	}
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("gugudan", getRandomGugudan());
		
		return "random_gugudan"; // "/WEB-INF/views/random_gugudan.jsp"
	}
}
