package chap04.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap04.model.Member;

@WebServlet("/memo/register")
public class RegisterServlet_T extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 회원가입 버튼 누르면? -> 회원가입 할 수 있는 폼을 보여줘야 한다.
		
		req.getRequestDispatcher("/quiz/view/regForm.jsp").forward(req,  resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletContext application = getServletContext();
		req.setCharacterEncoding("UTF-8");
		
		if(application.getAttribute("members") == null) {
			application.setAttribute("members", new HashMap<>());
		}
		
		// 회원정보가 도착하면 등록하는 곳
		String name = req.getParameter("name");
		String id = req.getParameter("id");
		String password = req.getParameter("pw");
		String birthday = req.getParameter("birthday");
		
		Map<String, Member> map = (Map)(application.getAttribute("members"));
		
		if(map.containsKey(id)) {
			// 이미 존재하는 ID (이미 존재한다고 표시하고 등록을 하지 않아야 함)
			resp.getWriter().append("<html><script>")
							.append("alert('중복된 아이디입니다!');")
							.append("location.href='/chap04/quiz/index.jsp'</script></html>");
		} else {
			// 사용할 수 있는 ID
			map.put(id ,new Member(name, id, password, birthday));
			resp.sendRedirect("/chap04/quiz/index_t.jsp");
		}
		
		// 이름이 올바른지를 알 수 있는 정규표현식을 만들어보세요
		// 비밀번호가 올바른지 알 수 있는 정규표현식을 만들어보세요 (유효성검사)
	}
}
