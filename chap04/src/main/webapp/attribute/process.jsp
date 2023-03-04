<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="chap04.model.Student"%>
<%
	// page scope attribute (현재 페이지를 넘어가면 유효기간 지남, 현재 보고 있는 지역 변수)
	pageContext.setAttribute("food", "gimbab");
	
	// request scope attribute (응답을 하고나면 유효기간 지남, 요청 갯수만큼 존재)
	request.setAttribute("food", "Ramen");
	
	// session scope attribute (세션이 만료되면 유효기간 지남, 사용자 마다 존재)
	session.setAttribute("food", "Sushi");
	
	// application scope attribute (서버가 꺼지면 유효기간 지남, 모든 사용자가 함께 사용)
	application.setAttribute("food", "Chicken");

	// Parameter : HTML -> Java(Server)
	// Attribute : Java(JSP) -> Java(다른 페이지)
	
	// 어트리뷰트에는 모든 종류의 클래스를 등록할 수 있다. (내가 만든 클래스를 마음껏 사용할 수 있다.)
	request.setAttribute("info", new Student("kim", 50, 55, 60));
	
	request
		.getRequestDispatcher("/attribute/view/test1.jsp")
		.forward(request, response);
	
%>