<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");//한글처리	

	String name = request.getParameter("name");
 	String age = request.getParameter("age");	
	//숫자로 변환
 	int result = Integer.parseInt(age);
 		
	//나이값 분기
	if(result >= 20) {
		response.sendRedirect("res_ex01_ok.jsp"); //경로
	} else {
		response.sendRedirect("res_ex01_no.jsp");
	}
	
%>
