<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션에 저장된 인증문자열
	String auth = (String)session.getAttribute("auth");
	//사용자가 입력한값
	String code = request.getParameter("code");

	//인증비교
	if(auth.equals(code) ) {
		
		//인증성공 세션생성
		session.setAttribute("authYN", "y");
		
		response.sendRedirect("reserve.jsp");
		
	} else {
		response.sendRedirect("auth.jsp");
	}
	
	
%>